<?php

namespace Athene\Model\Field;

abstract class Field {
    
    protected $mapping;
    protected $required = false;
    protected $defaultValue;
    protected $value;
    protected $primary = false;
    
    public function __construct($properties = null) {
        
        if(isset($properties['default'])) {
            $this->required = false;
            $this->defaultValue = $properties['default'];
            $this->value = $this->defaultValue;
        }
        
        if(isset($properties['mapping'])) {
            $this->mapping = $properties['mapping'];
        }
        
        if(isset($properties['required']) && $properties['required']) {
            $this->required = true;
        }
        
        $this->init($properties);
        
    }
    
    public function setValue($value) {
       $this->value = $value;
    }
    
    public function isPrimary() {
        return $this->primary;
    }
    
    public function isRequired() {
        return $this->required;
    }
    
    public function isMapped() {
        if(isset($this->mapping)) {
            return true;
        }
        return false;
    }
    
    public function __get($property) {
        if(in_array($property, array('mapping'))) {
            return $this->$property;
        }
    }
    
    public function __toString() {
        return (string)$this->value;
    }
    
    public function hasValue() {
        if(isset($this->value)) {
            return true;
        }
        return false;
    }
    public function getValue() {
        return $this->value;
    }
    
    abstract protected function init($properties);
    
}