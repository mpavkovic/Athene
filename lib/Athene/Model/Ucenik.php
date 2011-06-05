<?php

namespace Athene\Model;

class Ucenik extends Model {
    
    protected $table = 'osz_ucenik';
    
    protected $primaryKey = 'oib';
    
    protected $foreignKeys = array(
        array(
            'key' => 'mjesto_rodjenja_id',
            'table' => 'osz_mjesto',
            'fields' => array(
                array('naziv', 'mjesto_rodjenja')
            )
        )
    );
    
    public function init() {
        
    }
    
}