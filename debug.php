<?php

namespace Athene;

include('config.php');
include('database.php');

session_start();

header('Content-Type: text/javascript; charset=utf-8');
$db = \Database::getInstance();

$r = null;
if(isset($_SESSION['last_message'])) {
    $q = "SELECT * FROM debug WHERE time > '" . $_SESSION['last_message'] . '\'';
    $r = $db->query($q);
}
$_SESSION['last_message'] = date('Y-m-d H:i:s');

//var_dump($q, $r);
$jsonResponse = array(
    'type'  => 'event',
    'name'  => 'debug',
    'data'  => $r
);
echo json_encode($jsonResponse);