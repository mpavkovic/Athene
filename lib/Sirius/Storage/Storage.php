<?php

namespace Sirius\Storage;

class Storage {
    
    private static $storage = array();
    
    public static function getStorage($name) {
        return self::$storage[$name];
    }
    
    public static function create($name, $storage, $options) {
        $storage = '\\Sirius\\Storage\\' . $storage;
        self::$storage[$name] = new $storage($options);
        return self::$storage[$name];
    }
    
}