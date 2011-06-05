<?php

namespace Athene\Model;

class Adresa extends Model {
    
    protected $table = 'osz_adresa';
    
    protected $primaryKey = 'id';
    
    protected $foreignKeys = array(
        array(
            'key' => 'ucenik_id',
            'table' => 'osz_ucenik',
            'fields' => array(
                array('prezime', 'ucenik')
            )
        ),
        array(
            'key' => 'mjesto_id',
            'table' => 'osz_mjesto',
            'fields' => array(
                array('naziv', 'mjesto')
            )
        )
    );
}