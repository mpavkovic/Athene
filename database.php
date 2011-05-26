<?php

include('config.php');

class Database {

    private $conn = null;
    private static $instance = null;
    
    public static function getInstance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }
    
    public function __construct() {
        $this->conn = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS);
        $this->exec("SET CHARACTER SET utf8");
    }
    
    public function exec($query) {
        return $this->conn->exec($query);
    }
    
    public function query($query) {
        $return = array();
        foreach($this->conn->query($query, PDO::FETCH_ASSOC) as $r) {
            $return[] = (object)$r;
        }
        return $return;
    }
    
    public function insert($table, $data) {
        //var_dump($data);
        array_walk($data, function(&$val) { $val = "'" . $val . "'"; });
        // TODO: Make SQL escape
        $query = 'INSERT INTO ' . $table . '(' . implode(',', array_keys($data)) . ') VALUES (' . implode(',', $data) . ')';
        $this->exec($query);
    }
    
}
