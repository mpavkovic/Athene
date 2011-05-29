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
    if(!isset($inserts[$data[0]])) {
        $inserts[$data[0]] = '(' .
            intval($data[0]) . // ematica id
            ',\'' . mysql_escape_string($data[1]) . '\'' . // naziv
            ',\'' . mysql_escape_string($data[2]) . '\'' . // naziv en
            ',\'' . mysql_escape_string($data[3]) . '\'' . // puni naziv
            ',\'' . mysql_escape_string($data[4]) . '\'' . // puni naziv en
            ',\'' . intval($data[5]) . '\')';  // iso kod
    }
}

$query = "INSERT INTO osz_drzava(ematica_id, naziv, naziv_en, puni_naziv, puni_naziv_en, iso_kod) VALUES" . implode(',', array_values($inserts)) . ";";

echo $query;