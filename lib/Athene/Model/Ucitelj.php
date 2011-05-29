<?php

namespace Athene\Model;

class Ucitelj extends Model {
    
    protected $table = 'osz_ucitelj';
    
    protected $foreignKeys = array(
        array(
            'key' => 'titula_prefix_id',
            'table' => 'osz_titula',
            'alias' => 'pt',
            'fields' => array(
                array('naziv', 'titula_prefix')
            ),
        ),
        array(
            'key' => 'titula_sufix_id',
            'table' => 'osz_titula',
            'alias' => 'st',
            'fields' => array(
                array('naziv', 'titula_sufix')
            ),
        )

    );
}