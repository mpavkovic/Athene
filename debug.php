<?php

namespace Athene;

header('Content-Type: text/javascript; charset=utf-8');

include('config.php');
include('lib/Sirius/Autoload.php');

session_start();

$autoload = new \Sirius\Autoload(APP_PATH . '/lib');
$database = new \Sirius\Storage\Database\Mysql(array(
    'host'  => DB_HOST,
    'user'  => DB_USER,
    'password'  => DB_PASS,
    'database'  => DB_NAME
));


$r = null;
if(isset($_SESSION['last_message'])) {
    $q = "SELECT * FROM debug WHERE time > '" . $_SESSION['last_message'] . '\'';
    $r = $database->query($q);
}
$_SESSION['last_message'] = date('Y-m-d H:i:s');

//var_dump($q, $r);
$jsonResponse = array(
    'type'  => 'event',
    'name'  => 'debug',
    'data'  => $r
);
echo json_encode($jsonResponse);