<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type:text/html;charset=utf-8');

$csv = file_get_contents('Boravista.csv');

$inserts = array();
$lines = preg_split('/\n/', $csv);
foreach($lines as $line) {
    $data = explode(';', $line);
    $inserts[] = '(' .
        intval($data[0]) . // ematica id
        ',\'' . mysql_escape_string($data[1]) . '\')'; // opis
}

$query = "INSERT INTO osz_razlogboravista(ematica_id, opis) VALUES" . implode(',', $inserts) . ";";

echo $query;