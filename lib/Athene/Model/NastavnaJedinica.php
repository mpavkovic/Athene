<?php

namespace Athene\Model;

class NastavnaJedinica extends Model {
    
    protected $table = 'osz_nastavnajedinica';

    protected $primaryKey = 'id';
    
    protected $foreignKeys = array(
        array(
            'key' => 'nastavni_plan_id',
            'table' => 'osz_nastavniplan',
            'fields' => array(
                array('opis', 'nastavni_plan')
            )
        )
    );
}