<?php

namespace Athene\Model;

use Athene\Debug;
use Athene\Error;

class User extends Model {
    
    protected $table = 'auth_user';
    
    public function getAll() {
        $users = parent::getAll();
        /*$numUsers = count($users);
        for($i = 0; $i < $numUsers; $i++) {
            $users['groups'] = $this->adapter->query("SELECT g.id as id, g.name as name FROM ")
        }*/
        return $users;
    }
    
    public function save() {
        $this->fields['password'] = md5($this->fields['password']);
        if(!parent::save()) {
            return new Error('Nemogu dodati novog korisnika');
        }
        return true;
        //Debug::getInstance()->log('Save user', var_export($this->fields, true), __FILE__, __LINE__);
    }
    
}