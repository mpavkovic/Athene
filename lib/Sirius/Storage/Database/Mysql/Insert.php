<?php

namespace Sirius\Storage\Database\Mysql;

class Insert extends Statement {
    
    protected $table;
    protected $data;
    
    public function __construct($table, $data) {
        $this->table = $table;
        $this->data = $data;
    }
    
    public function __toString() {
        
        $filteredValues = array();
        foreach(array_values($this->data) as $value) {
            if(is_bool($value)) {
                $filteredValues[] = (int)$value;
            } else {
                $filteredValues[] = '\'' . mysql_escape_string($value) . '\'';
            }
        }
        $query = 'INSERT INTO ' . $this->table . '(' . implode(',', array_keys($this->data)) . ') VALUES(' . implode(',', $filteredValues) . ')';
        
        return $query;
        
    }
    
}