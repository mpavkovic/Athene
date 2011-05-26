<?php

namespace Athene;

class Debug {
    
    private static $instance = null;
    
    private $adapter;
    
    public static function getInstance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }
    
    public function __construct() {
        $this->adapter = \Database::getInstance();
    }
    
    public function log($title, $message, $file, $line) {
        $this->adapter->insert('debug', array(
            'time'  => date('Y-m-d H:i:s'),
            'title' => $title,
            'message'   => $message,
            'file'  => $file,
            'line'  => $line
        ));
    }
    
    
}