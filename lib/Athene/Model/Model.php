<?php

namespace Athene\Model;

class Model {
    
    private static $EXT_FIELDS = array('extTID', 'extAction', 'extMethod', 'extType', 'extUpload');
    
    protected $adapter;
    
    protected $fields;
    
    protected $table;
    
    public function __construct($fields = null) {
        $this->adapter = \Database::getInstance();
        if(isset($fields)) {
            // TODO: Clear ext values
            foreach($fields as $k=>$v) {
                if(in_array($k, self::$EXT_FIELDS)) {
                    unset($fields[$k]);
                }
            }
            $this->fields = $fields;
        }
    }
    
    public function save() {
        $this->adapter->insert($this->table, $this->fields);
    }
    
    public function getAll() {
        return $this->adapter->query("SELECT * FROM " . $this->table);
    }
    
}