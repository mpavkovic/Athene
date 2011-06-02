<?php

namespace Athene\Model;

class Tip extends Model {
    
    protected $table = 'athene_tips';
    
    public function read() {
        $tips = parent::read();
        var_dump($tips);
    }
    
}