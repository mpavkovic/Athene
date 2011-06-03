<?php

namespace Sirius\Storage\Database\Mysql;

class Select extends Statement {
    
    private $table;
    private $alias;
    private $fields = array();
    
    private $limitCount;
    private $limitOffset;
    
    private $joins = array();
    
    private $filters = array();
    
    private $wheres;
    
    private $getPage = true;
    
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
    
    public function getPage() {
        $this->getPage = true;
        return $this;
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
    
    public function filter($field, $value) {
        //var_dump($field, $value);
        $this->filters[] = array($field, $value);
    }
    
    public function join($params) {
        
        $this->joins[] = $params;

        return $this;
    }
    
    public function where($field, $value = null) {
        // Avoid notice
        if(!isset($this->wheres)) {
            $this->wheres = array();
        }
        
        if(is_array($field)) {
            //$this->wheres[] = $field;
            foreach($field as $k=>$v) {
                $this->wheres[] = array($k, $v);
            }
            return $this;
        }
        
        $this->wheres[] = array($field, $value);
        
        return $this;
    }
    
    public function __toString() {
        $query = 'SELECT {select_fields}';
        $selectFields = '';
        if(empty($this->fields)) {
            if(isset($this->alias)) {
                $selectFields .= $this->alias . '.*';
            } else {
                $selectFields .= $this->table . '.*';
            }
        } else {
            $fields = $this->fields;
            if(isset($this->alias)) {
                $self = $this;
                array_walk($fields, function(&$f) use ($self) {
                    $f = $self->alias . '.' . $f;
                });
            }
            $selectFields .= implode(',', $fields);
        }
        $query .= ' FROM ' . $this->table;
        // ALIAS
        if(isset($this->alias)) {
            $query .= ' AS ' . $this->alias;
        }
        
        /*if($this->getPage) {
            $selectFields = 'floor(count(id)/' . $this->limitCount . ') as page';
            unset($this->limitCount);
            unset($this->limitOffset);
        }*/
        
        // JOINs
        if(!empty($this->joins)) {
            foreach($this->joins as $join) {
                if(isset($join['alias'])) {
                    $t = $join['alias'];
                } else {
                    $t = $join['table'];
                }
                
                $query .= ' JOIN ' . $join['table'];
                if(isset($join['alias'])) {
                    $query .= ' AS ' . $join['alias'];
                }
                $query .= ' ON ';
                if(isset($this->alias)) {
                    $query .= $this->alias;
                } else {
                    $query .= $this->table;
                }
                $query .= '.' . $join['key'] . ' = ' . $t . '.id';
                if(isset($join['fields'])) {
                    foreach($join['fields'] as $field) {
                        $selectFields .= ', ' . $t . '.' . $field[0] . ' AS ' . $field[1];
                    }
                }
            }
        }
        
        // FILTERS
        if(!empty($this->filters)) {
            $query .= ' WHERE ';
            foreach($this->filters as $filter) {
                if(isset($this->alias)) {
                    $query .= $this->alias . '.';
                } else {
                    $query .= $this->table . '.';
                }
                $query .= $filter[0] . ' LIKE \'' . $filter[1] . '%\'';
            }
        }
        
        // WHEREs
        //var_dump($this->wheres);
        if(!empty($this->wheres)) {
            $query .= ' WHERE ';
            $whereCount = 0;
            foreach($this->wheres as $where) {
                if($whereCount > 0) {
                    $query .= ' AND ';
                }
                if(count($where) == 2) {
                    if(!is_int($where[1])) {
                        $where[1] = '\'' . mysql_escape_string($where[1]) . '\'';
                    }
                    $query .= $where[0] . ' = ' . $where[1];
                    $whereCount++;
                }
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
        
        
        $query = str_replace('{select_fields}', $selectFields, $query);
        
        //var_dump($query);
        
        return $query;
    }
    
    public function __get($propety) {
        if(in_array($propety, array('table', 'alias'))) {
            return $this->$propety;
        }
    }
    
}