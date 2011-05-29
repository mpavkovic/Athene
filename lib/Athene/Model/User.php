<?php

namespace Athene\Model;

use Athene\Debug;
use Athene\Error;

class User extends Model {
    
    protected $table = 'auth_user';
    
    public function getAll() {
        $users = array(); $keys = array();
        $r = $this->adapter->query("SELECT au.*, aug.group_id, ag.name as group_name FROM auth_user au JOIN auth_user_groups aug ON aug.user_id = au.id JOIN auth_group ag ON ag.id = aug.group_id");
        foreach($r as $row) {
            if(!in_array($row->id, $keys)) {
                $row->groups = array(
                    array('id' => $row->group_id, 'name' => $row->group_name)    
                );
                unset($row->group_id, $row->group_name);
                $users[] = $row;
                $keys[] = $row->id;
            } else {
                foreach($users as $user) {
                    if($user->id = $row->id) {
                        $user->groups[] = array(
                            'id' => $row->group_id,
                            'name' => $row->group_name
                        );
                    }
                    break;
                }
            }
        }
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