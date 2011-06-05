<?php

namespace Athene\Model\Field;

class Reference extends Field {
    
    protected $model;
    
    protected function init($properties) {
        
        if(!isset($properties['model'])) {
            throw new \Exception('Reference model is not set!');
        }
        $this->model = $properties['model'];
        
    }
    
}