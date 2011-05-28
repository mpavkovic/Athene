<?php

namespace Athene;

class Error {
    
    private $code;
    private $message;
    
    public function __construct($message, $code = 0) {
        $this->message = $message;
        $this->code = $code;
    }
    
    public function __get($property) {
        if(in_array($property, array('message', 'code'))) {
            return $this->$property;
        }
    }
    
    public function __toString() {
        return $this->message . ' (greška: ' . $this->code . ')';
    }
    
}