<?php

namespace Athene;

ini_set('display_errors', 1);
error_reporting(E_ALL);

set_include_path(get_include_path() . PATH_SEPARATOR . 'library/');

session_start();

include('database.php');
require_once('FirePHPCore/FirePHP.class.php');
$firephp = \FirePHP::getInstance(true);
ob_start();

spl_autoload_register(function ($class) {
    //var_dump($class);
    $classPath = 'lib' . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';
    include($classPath);
    //throw new \Exception('Unable to load ' . $class);
});

class JsonResponse {
    public $action, $method, $result, $tid, $type = 'rpc';
    
    public function __construct($action, $method, $result, $tid) {
        $this->action = $action;
        $this->method = $method;
        $this->result = $result;
        $this->tid = $tid;
    }
    
    public function __toString() {
        return json_encode($this);
    }
}

class FailureReponse {
    
    protected $success = false;
    
    public function __construct() {
        
    }
    
    public function __toString() {
        return json_encode($this);
    }
    
}

class Menu {
    
    public function side($node) {
        if($node == 'sidemenu') {
            return array(
                (object)array('text' => 'Imenik', 'id' => 'sidemenu/imenik', 'cls' => 'folder', 'expanded' => true),
                (object)array('text' => 'Dnevnik', 'id' => 'sidemenu/dnevnik', 'cls' => 'folder', 'expanded' => true),
                (object)array('text' => 'Administracija', 'id' => 'sidemenu/admin', 'cls' => 'folder', 'expanded' => false)
            );
        } else if($node == 'sidemenu/imenik') {
            return array(
                (object)array('text' => 'Učenici', 'id' => 'sidemenu/imenik/uceniklist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Razredi', 'id' => 'sidemenu/imenik/razredlist', 'leaf' => true, 'cls' => 'file')
            );
        } else if($node == 'sidemenu/dnevnik') {
            return array(
                (object)array('text' => 'Izostanci', 'id' => 'sidemenu/imenik/izostanaklist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Školske godine', 'id' => 'sidemenu/imenik/skgodlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Učitelji', 'id' => 'sidemenu/imenik/uciteljlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Države', 'id' => 'sidemenu/imenik/drzavalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Mjesta', 'id' => 'sidemenu/imenik/mjestolist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Nacionalna manjina', 'id' => 'sidemenu/imenik/nacionalnamanjinalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Nastavni Plan', 'id' => 'sidemenu/imenik/nastavniplanlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Događaji', 'id' => 'sidemenu/imenik/dogadjajlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Narodnost', 'id' => 'sidemenu/imenik/narodnostlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Škole', 'id' => 'sidemenu/imenik/skolalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Predmeti', 'id' => 'sidemenu/imenik/predmetlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Predmet razrednog odjeljenja', 'id' => 'sidemenu/imenik/predmetrazrednogodjeljenjalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Poteškoće', 'id' => 'sidemenu/imenik/poteskocalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Vrsta putnika', 'id' => 'sidemenu/imenik/vrstaputnikalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Zanimanja', 'id' => 'sidemenu/imenik/zanimanjalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Titula', 'id' => 'sidemenu/imenik/titulalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Kategorija ocjena', 'id' => 'sidemenu/imenik/kategorijaocjenalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Slobodna aktivnost', 'id' => 'sidemenu/imenik/slobodnaaktivnostlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Razlog boravišta', 'id' => 'sidemenu/imenik/razlogboravistalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Predmetna cjelina', 'id' => 'sidemenu/imenik/predmetnacjelinalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Ocjene', 'id' => 'sidemenu/imenik/ocjenalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Dodijeljena Poteškoća', 'id' => 'sidemenu/imenik/dodijeljenapoteskocalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Nastavna Jedinica', 'id' => 'sidemenu/imenik/nastavnajedinicalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Metodska Jedinica', 'id' => 'sidemenu/imenik/metodskajedinicalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Nastavni sat', 'id' => 'sidemenu/imenik/nastavnisatlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Najava ispita', 'id' => 'sidemenu/imenik/najavaispitalist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Adresa', 'id' => 'sidemenu/imenik/adresalist', 'leaf' => true, 'cls' => 'file')
            );
        } else if($node == 'sidemenu/admin') {
            return array(
                (object)array('text' => 'Korisnici', 'id' => 'sidemenu/admin/userlist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Grupe', 'id' => 'sidemenu/admin/grouplist', 'leaf' => true, 'cls' => 'file'),
                (object)array('text' => 'Postavke', 'id' => 'sidemenu/admin/settings', 'leaf' => true, 'iconCls' => 'settingIcon'),
            );
        }
    }
    
}

if(isset($_GET)) {
    if(isset($_GET['node'])) {
        $menu = new Menu();
        header('Content-Type: text/javascript');
        echo json_encode($menu->side($_GET['node']));
        die();
    } else if(isset($_GET['logout'])) {
        session_destroy();
        die();
    }
}

if(isset($_POST) && !empty($_POST)) {
    //var_dump($_POST);   
    $response = new JsonResponse($_POST['extAction'], $_POST['extMethod'], null, $_POST['extTID']);
    $class = $_POST['extAction'];
    $actionClass = new $class($_POST);
    $return = call_user_func(array($actionClass, $_POST['extMethod']));
  
    $reponse->return = $return;
          
    echo $response;
} else if(isset($HTTP_RAW_POST_DATA)) {
    header('Content-Type: text/javascript; charset=utf-8');
    $jsonRequest = json_decode($HTTP_RAW_POST_DATA);
    $firephp->log($jsonRequest, 'JSON request');
    $responses = array();
    if(is_array($jsonRequest)) {
        foreach($jsonRequest as $jr) {
            $class = 'Athene\\Model\\' . $jr->action;
            $actionClass = new $class;
            $return = call_user_func(array($actionClass, $jr->method));
            $responses[] = new JsonResponse($jr->action, $jr->method, $return, $jr->tid);
        }
    } else {
        $class = 'Athene\\Model\\' . $jsonRequest->action;
        try {
            $actionClass = new $class;
        } catch(\Exception $e) {
            return $e->getMessage();
        }
        $return = call_user_func(array($actionClass, $jsonRequest->method));
        $responses[] = new JsonResponse($jsonRequest->action, $jsonRequest->method, $return, $jsonRequest->tid);
    }
    $firephp->log($responses, 'Response');
    echo implode(',', $responses);
}

?>
