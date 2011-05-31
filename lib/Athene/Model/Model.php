<?php

namespace Athene\Model;

use Sirius\Storage\Database\Mysql;
use Athene\Debug;

class Model {
    
    private static $EXT_FIELDS = array('extTID', 'extAction', 'extMethod', 'extType', 'extUpload');
    
    protected $adapter;
    
    protected $fields;
    
    protected $table;
    
    protected $primaryKey = 'id';
    
    protected $foreignKeys = array();
    
    public function __construct($fields = null) {
        $this->adapter = Mysql::getInstance();
        if(isset($fields)) {
            // TODO: Clear ext values
            foreach($fields as $k=>$v) {
                if(in_array($k, self::$EXT_FIELDS)) {
                    unset($fields[$k]);
                }
            }
            $this->fields = $fields;
        }
    }
    
    public function save() {
        /*if($this->fields['id']) {
            $query = $this->adapter->update();
        }*/
        
        return $this->adapter->insert($this->table, $this->fields);
    }
    
    public function getAll($params = null) {
        //var_dump($params); die();
        //$selectFiedls = array('*')
        $query = $this->adapter->select($this->table);
        
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
        
        if(isset($params->wherePage) && isset($params->page)) {
            //var_dump();
            $sq = $this->adapter->select($this->table)->limit($params->start, $params->limit)->where(get_object_vars($params->wherePage))->getPage();
            echo $sq;
            $r = $this->adapter->query($sq);
            var_dump($r);
        }
        
        //echo $query;
        if(isset($params->page)) {
            $query->limit($params->start, $params->limit);
        }
        
        //var_dump($params);
        if(isset($params->filter)) {
            $query->filter('prezime', $params->filter[0]->value);
        }
        
        
        //echo $query;
        return $this->adapter->query($query);
        
        
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
    
}