<?php

namespace Sirius\Storage\Database;

class Mysql extends Database {
    
    const DEFAULT_HOST = 'localhost';
    const DEFAULT_CHARSET = 'utf8';

    private $conn = null;
    private static $instance = null;
    
    public static function getInstance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }
    
    public function __construct($options) {
        
        if(!isset($options['host'])) {
            $options['host'] = self::DEFAULT_HOST;
        }
        
        if(!isset($options['user'])) {
            throw new \Exception('User is not set');
        }
        
        if(!isset($options['password'])) {
            $options['password'] = '';
        }
        
        $connectionString = 'mysql:host=' . $options['host'];
        if(isset($options['database'])) {
            $connectionString .= ';dbname=' . $options['database'];
        }
        
        $this->conn = new \PDO($connectionString, $options['user'], $options['password']);
        
        if(!isset($options['charset'])) {
            $options['charset'] = self::DEFAULT_CHARSET;
        }
        
        $this->exec('SET CHARACTER SET ' . $options['charset']);
        
        // Set instance
        self::$instance = $this;
        
    }
    
    public function exec($query) {
        return $this->conn->exec($query);
    }
    
    public function query($query) {
        $return = array();
        foreach($this->conn->query($query, \PDO::FETCH_ASSOC) as $r) {
            $return[] = (object)$r;
        }
        return $return;
    }
    
    public function insert($table, $data) {
        //var_dump($data);
        array_walk($data, function(&$val) { $val = "'" . $val . "'"; });
        // TODO: Make SQL escape
        $query = 'INSERT INTO ' . $table . '(' . implode(',', array_keys($data)) . ') VALUES (' . implode(',', $data) . ')';
        return $this->exec($query);
    }
    
    public function select($params) {
        return new Mysql\Select($params);
    }
    
}
