<?php

namespace Sirius;

class Auth {
    
    private static $instance = null;
    
    private $options = array();
    
    private $users = array();
    
    public function getInstance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }
    
    public function setOption($option, $value = null) {
        
        if(isset($value)) {
            $this->options[$option] = $value;
        }
        
    }
    
    public function getUser($id) {
        
        $id = intval($id);
        
        if(!isset($this->users[$id])) {
            if(!isset($this->options['adapter'])) {
                throw new \Exception('No adapter defined!');
            }
            $user = $this->options['adapter']->query("SELECT * FROM auth_user WHERE id = $id");
            $this->users[$id] = $user[0];
            return $user[0];
        } else {
            return $this->users[$id];
        }
        
    }
    
    
}