<?php

namespace Athene\Model;

use Athene\Debug;

class User extends Model {
    
    protected $table = 'auth_user';
    
    public function save() {
        Debug::getInstance()->log('Save user', var_export($this->fields, true), __FILE__, __LINE__);
    }
    
}