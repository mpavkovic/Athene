<?php

namespace Sirius\Util\DataGenerator;

use Sirius\Storage\Storage;
use Sirius\Model\Model;

class DataGenerator {
    
    private $storage;
    
    private $model;
    
    public function setStorage(Storage $store) {
        $this->storage = $store;
    }
    
    public function useModel(Model $model) {
        $this->model = $model;
    }
    
    public function generate() {
        
    }
    
}