<?php

namespace Athene\Model;

use Sirius\Storage\Database\Mysql;

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
        if($this->fields->id) {
            $query = $this->adapter->update();
        }
        
        return $this->adapter->insert($this->table, $this->fields);
    }
    
    public function getAll($params = null) {
        //var_dump($params); die();
        //$selectFiedls = array('*')
        $query = $this->adapter->select($this->table);
                    /*'table' => $this->table,
                    'fields' => array('oib', 'jmbg')
                ));*/
        
        if(!empty($this->foreignKeys)) {
            foreach($this->foreignKeys as $fk) {
                //$query .= " JOIN " . $fk['table'] . " ON " . $this->table . "." . $fk['key'] . "=" . $fk['table'] . ".id";
                $query->join($fk);
            }
        }
        
        //echo $query;
        if(isset($params->page)) {
            $query->limit($params->start, $params->limit);
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
    
    public function count() {
        $query = "SELECT COUNT(*) AS total FROM " . $this->table;
        $r = $this->adapter->query($query);
        return intval($r[0]->total);
    }
    
}