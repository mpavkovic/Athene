<?php

namespace Sirius\Ext;
use Sirius\Ext\Response;
use Sirius\Ext\Request;

class Router {
    
    private static $instance = null;
    
    private $response;
    
    public static function getInstance() {
        if(self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }
    
    public function route(Request $request) {
        
        $this->response = new Response($request);
        
        $actionClass = '\\Athene\\Model\\' . $request->action;
        $class = new $actionClass;
        $r = $class->{$request->method}($request->data[0]);
        //var_dump($r);
        $this->response->setData($r, 'data');
        $this->sendResponse();
        
    }
    
    public function getResponse() {
        return $this->response;
    }
    
    public function sendResponse(Response $response = null) {
        if(!isset($response)) {
            $response = &$this->response;
        }
        echo $response->toJson();
    }
    
}