<?php

namespace Athene\Model;

class Ucenik extends Model {
    
    protected $table = 'osz_ucenik';
    
    protected $foreignKeys = array(
        array(
            'key' => 'mjesto_rodjenja_id',
            'table' => 'osz_mjesto',
            'fields' => array('naziv', 'mjesto_rodjenja')
        )
    );
    
}