<?php

namespace Sirius\Ext;
use Sirius\Ext\Request;

class Response {
    
    private $action;
    private $method;
    private $result = array();
    private $tid;
    private $type;
    
    // Error-related
    private $message;
    private $file;
    private $line;
    private $trace = 'No trace info';
    
    public function __construct(Request $request) {
        $this->action = $request->action;
        $this->method = $request->method;
        $this->tid = $request->tid;
        $this->type = $request->type;
        //$this->return = new \stdClass();
    }
    
    public function setData($data, $key = null) {
        if(isset($key)) {
            $this->result[$key] = $data;
        }
    }
    
    public function __set($property, $value) {
        $this->$property = $value;
    }

    public function toJson() {
        $returnData = array(
            'action' => $this->action,
            'method' => $this->method,
            'result' => $this->result,
            'tid' => $this->tid,
            'type' => $this->type
        );
        
        if($this->type == 'exception') {
            $returnData['message'] = $this->message;
            $returnData['file'] = $this->file;
            $returnData['line'] = $this->line;
            $returnData['trace'] = print_r($this->trace, true);
        }
        
        return json_encode((object)$returnData);
    }    
    
}