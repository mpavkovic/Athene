<?php

namespace Athene\Model\Field;

class Boolean extends Field {
    
    protected function init($properties) {
        
    }
    
    public function setValue($value) {
        $this->value = (bool)$value;
    }
    
}