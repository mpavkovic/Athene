<?php

namespace Athene\Model\Field;

abstract class Field {
    
    protected $mapping;
    protected $required = true;
    protected $defaultValue;
    protected $value;
    
    public function __construct($properties = null) {
        
        if(isset($properties['default'])) {
            $this->required = false;
            $this->defaultValue = $properties['default'];
        }
        
        if(isset($properties['mapping'])) {
            $this->mapping = $properties['mapping'];
        }
        
        $this->init($properties);
        
    }
    
    public function setValue($value) {
        $this->value = $value;
    }
    
    abstract protected function init($properties);
    
}