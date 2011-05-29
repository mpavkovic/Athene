<?php

namespace Sirius;

class Autoload {
    
    const DEFAULT_EXTENSION = 'php';
    
    private $paths = array();
    
    public function __construct($path = null) {
        spl_autoload_register(array($this, 'autoload'));
        if(isset($path)) {
            if(is_array($path)) {
                $this->paths = $path;
            } else {
                $this->paths[] = $path;
            }
        }
    }
    
    public function addPath($path) {
        $this->paths[] = $path;
    }
    
    public function autoload($className) {
        
        if(empty($this->paths)) {
            throw new \Exception('No paths set, don\'t know where to look for files.');
        }
        
        $loaded = false;
        
        foreach($this->paths as $path) {
            $classPath = $path . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $className) . '.' . self::DEFAULT_EXTENSION;
            if(file_exists($classPath)) {
                include($classPath);
                $loaded = true;
                break;
            }
        }
        
        if(!$loaded) {
            throw new \Exception('Unable to load ' . $className);
        }
        
        return true;
        
    }
    
}