<?php

namespace Athene\Model;

use Athene\Model\Field\Field;
use Sirius\Storage\Storage;

abstract class Model {
    
    protected $fields;
    
    protected $fieldOrder = array();
    
    protected $requiredFields = array();
    
    protected $mappings = array();
    
    protected $records = array();
    
    public function __construct($values = null) {
        
        $this->fields = new \stdClass(); // Prevent E_STRICT errors
        
        // Init first
        $this->init();
        
        //var_dump($this->fields);
        if(is_array($values)) {
            /*echo 'VALUES: <pre>'; var_dump($values); echo '</pre>';
            if(is_array($values[0])) { // MULTIPLE RECORDS
                echo 'MULTIPLE RECORDS';
            }*/
            
            // Check if all required fields are set
            if($this->requiredFields != array_intersect(array_keys($values), $this->requiredFields)) {
                throw new \Exception('Not all required fields are set!');
            }
            
            foreach($values as $k=>$v) {
                /*if(is_int($k)) {
                    throw new \Exception('Values should be either ')
                }*/
                if(!isset($this->fields->$k)) {
                    if(!isset($this->mappings[$k])) {
                        throw new \Exception('Unknown field ' . $k);
                    } else {
                        $k = $this->mappings[$k];
                    }
                }
                $this->fields->$k->setValue($v);
            }
        }
        
    }
    
    public function addRecord($data) {
        
    }
    
    protected function setField($name, Field $field) {
        if(!in_array($name ,$this->fieldOrder)) {
            $this->fieldOrder[] = $name;
        }
        $this->fields->$name = $field;
        if($field->isRequired()) {
            $this->requiredFields[] = $name;
        }
        if($field->isMapped()) {
            $this->mappings[$field->mapping] = $name;
        }
    }
    
    public function __toString() {
        $asString = '';
        foreach($this->fields as $name=>$field) {
            $asString .= $name . ':' . $field . '|';
        }
        return substr($asString, 0, -1);
    }
    
    public function __set($property, $value) {
        var_dump($property, $value);
    }
    
    public function __get($property) {
        if(in_array($property, array('table'))) {
            return $this->$property;
        }
    }
    
    public function getFields($mapped = false) {
        $fieldsAssoc = array();
        foreach($this->fields as $name=>$field) {
            if($field->hasValue()) {
                if($mapped && $field->isMapped()) {
                    $name = $field->mapping;
                }
                $fieldsAssoc[$name] = $field->getValue();
            }
        }
        return $fieldsAssoc;
    }
    
    public function create($params) {
        if(isset($this->primaryKey)) {
            $this->primaryKey = 'id';
        }
        $pkVal = $params->{$this->primaryKey};
        unset($params->{$this->primaryKey});
        
        return $this->adapter->insert($this->table, get_object_vars($params));
    }
    
    public function save() {
        /*if($this->fields['id']) {
            $query = $this->adapter->update();
        }*/
        
        return $this->adapter->insert($this->table, $this->fields);
    }
    
    public function read($params = null) {
        return $this->getAll($params);
    }
    
    public function getAll($params = null) {
        //var_dump($params); die();
        //$selectFiedls = array('*')
        $database = Storage::getStorage('database');
        $query = $database->select($this->table);
        
        //echo $query;
        
        /*$query = $this->adapter->select(array(
                    'table' => $this->table,
                    'alias' => 'u',
                    'fields' => array('oib', 'jmbg')
        ));*/
        
        if(!empty($this->foreignKeys)) {
            foreach($this->foreignKeys as $fk) {
                //$query .= " JOIN " . $fk['table'] . " ON " . $this->table . "." . $fk['key'] . "=" . $fk['table'] . ".id";
                $query->join($fk);
            }
        }
        
        //echo $query;
        
        /*if(isset($params->wherePage) && isset($params->page)) {
            //var_dump();
            $sq = $this->adapter->select($this->table)->limit($params->start, $params->limit)->where(get_object_vars($params->wherePage))->getPage();
            echo $sq;
            $r = $this->adapter->query($sq);
            //var_dump($r);
        }*/
        
        //echo $query;
        if(isset($params->page)) {
            $query->limit($params->start, $params->limit);
        }
        
        //var_dump($params);
        if(isset($params->filter)) {
            $query->filter('prezime', $params->filter[0]->value);
        }
        
        
        //echo $query;
        return $database->query($query->__toString());
        
        
        /*$query = "SELECT * FROM " . $this->table;
        if(!empty($this->foreignKeys)) {
            foreach($this->foreignKeys as $fk) {
                $query .= " JOIN " . $fk['table'] . " ON " . $this->table . "." . $fk['key'] . "=" . $fk['table'] . ".id";
            }
        }
        if(isset($params->page)) {
            /*$r = $this->adapter->query("SELECT COUNT(*) AS total FROM " . $this->table);
            $totalCount = $r[0]->total;*
            $query .= " LIMIT {$params->start}, {$params->limit}";
        }
        return $this->adapter->query($query);*/
            
    }
    
    public function delete($idVal) {
        $query = "DELETE FROM " . $this->table . ' WHERE ' . $this->primaryKey . " = '$idVal'";
        if($this->adapter->exec($query) == 0) {
            return false;
        }
        return true;
    }
    
    public function count($params = null) {
        $query = "SELECT COUNT(*) AS total FROM " . $this->table;
        Debug::getInstance()->log('Params for total', var_export($params, true), __FILE__, __LINE__);
        if(isset($params[0]->filter)) {
            $query .= ' WHERE ' . $params[0]->filter[0]->property . ' LIKE \'' . $params[0]->filter[0]->value . '%\'';
        }
        Debug::getInstance()->log('Count query', $query, __FILE__, __LINE__);
        $r = $this->adapter->query($query);
        return intval($r[0]->total);
    }
    
    public function find($params) {
        //var_dump($params);
        $query = $this->adapter->select($this->table)->where($params->findBy, $params->findValue);
        return $this->adapter->query($query);
        //echo $query;
        //echo 'Query ', $query->__toString(); die();
    }
    
    // Delete record
    public function destroy($params) {
        if(isset($this->primaryKey)) {
            $q = "DELETE FROM " . $this->table . " WHERE " . $this->primaryKey . ' = ' . $params->{$this->primaryKey};;
            return $this->adapter->query($q);
        }
    }
    
    public function del($params) {
        //echo 'DELETE: '; var_dump($params);
        if(isset($this->primaryKey)) {
            $q = "DELETE FROM " . $this->table . " WHERE " . $this->primaryKey . ' = ' . $params->{$this->primaryKey};;
            return $this->adapter->query($q);
        }
    }
    
    public function update($params) {
        if(isset($this->primaryKey)) {
            $this->primaryKey = 'id';
        }
        $pkVal = $params->{$this->primaryKey};
        unset($params->{$this->primaryKey});
    
        $query = 'UPDATE ' . $this->table . ' SET ';
        $sets = array();
        foreach(get_object_vars($params) as $k=>$v) {
            $sets[] = $k . ' = \'' . $v . '\'';
        }
        //var_dump($query . implode(',', $sets));
        $query .= implode(',', $sets) . ' WHERE ' . $this->primaryKey . ' = \'' . $pkVal . '\'';
        $r = $this->adapter->exec($query);
        if($r > 0) {
            return true;
        }
        $error = new Error('Radnja neuspjela.', '32');
        return $error;
    }
    
}