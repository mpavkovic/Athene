<?php

namespace Athene\Model;

class Razred extends Model {
    
    protected $table = 'osz_razrednoodjeljenje';
    
    protected $foreignKeys = array(
        array(
            'key'   => 'razrednik_id',
            'table' => 'osz_ucitelj',
            'fields'=> array(
                array('prezime', 'razrednik_prezime'),
                array('ime', 'razrednik_ime')
            )
        )
    );
    
    public function init() {
        
    }
    
}