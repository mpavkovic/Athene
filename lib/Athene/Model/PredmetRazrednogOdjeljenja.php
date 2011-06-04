<?php

namespace Athene\Model;

class PredmetRazrednogOdjeljenja extends Model {
    
    protected $table = 'osz_predmetrazrednogodjeljenja';

    protected $primaryKey = 'id';
    
    protected $foreignKeys = array(
        array(
            'key' => 'predmet_id',
            'table' => 'osz_predmet',
            'fields' => array(
                array('naziv', 'predmet')
            )   
        ),
        
        array(
            'key' => 'razredno_odjeljenje_id',
            'table' => 'osz_razrednoodjeljenje',
            'fields' => array(
                array('naziv', 'razredno_odjeljenje')
            )
        )
        
    );

}