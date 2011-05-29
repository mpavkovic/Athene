<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type:text/html;charset=utf-8');

$csv = file_get_contents('NacionalneManjine.csv');

$inserts = array();
$lines = preg_split('/\n/', $csv);
foreach($lines as $line) {
    $data = explode(';', $line);
    $inserts[] = '(' .
        intval($data[0]) . // ematica id
        ',\'' . mysql_escape_string($data[1]) . '\')'; // naziv
}

$query = "INSERT INTO osz_nacionalnamanjina(ematica_id, naziv) VALUES" . implode(',', $inserts) . ";";

echo $query;