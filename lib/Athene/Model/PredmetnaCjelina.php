<?php

namespace Athene\Model;

class PredmetnaCjelina extends Model {
    
    protected $table = 'osz_predmetnacjelina';
    
    protected $primaryKey = 'id';
    
    protected $foreignKeys = array(
        array(
            'key' => 'predmet_id',
            'table' => 'osz_predmet',
            'fields' => array(
                array('naziv', 'predmet')
            )
        )
    );
}