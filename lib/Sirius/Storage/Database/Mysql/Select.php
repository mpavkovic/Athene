<?php

namespace Sirius\Storage\Database\Mysql;

class Select extends Statement {
    
    private $table;
    private $alias;
    private $fields = array();
    
    private $limitCount;
    private $limitOffset;
    
    private $joins = array();
    
    public function __construct($params) {
        
        if(is_array($params)) {
            $this->table = $params['table'];
            if(isset($params['alias'])) {
                $this->alias = $params['alias'];
            }
            if(isset($params['fields'])) {
                $this->fields = $params['fields'];
            }
        } else {
            $this->table = $params;
        }
        
    }
    
    public function limit($a, $b = null) {
        if(isset($b)) {
            $this->limitCount = $b;
            $this->limitOffset = $a;
            return $this;
        }
        $this->limitCount = $a;
        return $this;
    }
    
    public function join($params) {
        
        $this->joins[] = $params;
        
        return $this;
    }
    
    public function __toString() {
        $query = 'SELECT ';
        if(empty($this->fields)) {
            if(isset($this->alias)) {
                $query .= $this->alias . '.*';
            } else {
                $query .= '*';
            }
        } else {
            $fields = $this->fields;
            if(isset($this->alias)) {
                array_walk($fields, function(&$f) {
                    $f = $this->alias . '.' . $f;
                });
            }
            $query .= implode(',', $fields);
        }
        $query .= ' FROM ' . $this->table;
        
        // JOINs
        if(!empty($this->joins)) {
            foreach($this->joins as $join) {
                $query .= ' JOIN ' . $join['table'] . ' ON ';
                if(isset($this->alias)) {
                    $query .= $this->alias;
                } else {
                    $query .= $this->table;
                }
                $query .= '.' . $join['key'] . ' = ' . $join['table'] . '.id';
            }
        }
        
        // LIMIT
        if(isset($this->limitCount)) {
            $query .= ' LIMIT ';
            if(isset($this->limitOffset)) {
                $query .= $this->limitOffset . ',';
            }
            $query .= $this->limitCount;
        }
        return $query;
    }
    
}