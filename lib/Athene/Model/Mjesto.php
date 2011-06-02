<?php

namespace Athene\Model;

class Mjesto extends Model {
    
    protected $table = 'osz_mjesto';
    
    protected $primaryKey = 'id';
    
    protected $foreignKeys = array(
        array(
            'key' => 'drzava_id',
            'table' => 'osz_drzava',
            'fields' => array(
                array('naziv', 'drzava')
            )
        )
    );
    
}