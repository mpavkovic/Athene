<?php

namespace Sirius\Ext;

class Request {
    
    private $action;
    private $method;
    private $data;
    private $tid;
    private $type;
    
    public function __construct($data) {
        
        if(is_string($data)) {
            $data = json_decode($data);
        }
        
        $this->action = $data->action;
        $this->method = $data->method;
        $this->data = $data->data;
        $this->tid = $data->tid;
        $this->type = $data->type;
        
    }
    
    public function toJson() {
        return json_encode($this);
    }
    
    public function __get($property) {
        return $this->$property;
    }
    
}