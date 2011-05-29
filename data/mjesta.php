<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type:text/html;charset=utf-8');

include('../config.php');
include('../lib/Sirius/Autoload.php');

$autoload = new \Sirius\Autoload(APP_PATH . '/lib');
$database = new \Sirius\Storage\Database\Mysql(array(
    'user'  => DB_USER,
    'password'  => DB_PASS,
    'database'  => DB_NAME
));

$csv = file_get_contents('DrzavePodrucjaIMjesta.csv');
//var_dump($csv);

$inserts = array();
$lines = preg_split('/\n/', $csv);
foreach($lines as $line) {
    $data = explode(';', $line);
    //echo '<pre>'; var_dump($data); echo '</pre>';
    if($data[0] == "297") { // hrvatska
        $inserts[] = '(' .
            intval($data[12]) . // ematica id
            ',\'' . mysql_escape_string($data[13]) . '\'' . // naziv
            ',\'' . mysql_escape_string($data[14]) . '\'' . // postanski broj
            ', 62)'; // drzava id - Hrvatska
    }
}

$query = "INSERT INTO osz_mjesto(ematica_id, naziv, post_br, drzava_id) VALUES" . implode(',', $inserts) . ";";

echo $query;