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

$numRecords = 900;

function oib() {
    $oib = '';
    for($i=0; $i<11; $i++) {
        if($i==0) {
            $oib .= rand(1,9);
        }
        $oib .= rand(0,9);
    }
    return $oib;
}

function jmbg() {
    $day = str_pad(rand(1,31), 2, '0', STR_PAD_LEFT);
    $month = str_pad(rand(1,12), 2, '0', STR_PAD_LEFT);
    $year = rand(989,999);
    $randomNumber = str_pad(rand(1,999), 3, '0', STR_PAD_LEFT);
    
    return $day . $month . $year . '360' . $randomNumber;
}

function datum($jmbg) {
    $year = '1' . substr($jmbg, 4, 3);
    $month = substr($jmbg, 2, 2);
    $day = substr($jmbg, 0, 2);
    
    return $year . '-' . $month . '-' . $day;
}

$muskaImena = array('Milan', 'Zoran', 'Petar', 'Natko', 'Jakov',
               'Nikola', 'Ivan', 'Marko', 'Marin', 'Mario',
               'Igor', 'Viktor', 'Željko', 'Slaven', 'Vanja',
               'Mile', 'Pero');

$zenskaImena = array('Karmen', 'Manuela', 'Ivana', 'Petra',
                'Mila', 'Ines', 'Valentina', 'Iva', 'Ana',
               'Nataša', 'Diana');


$prezimena = array('Pavković', 'Ugrina', 'Koraca', 'Hasić', 'Mandić',
                   'Kostrenčić', 'Sušanj', 'Antić', 'Perić', 'Marković',
                   'Frančić', 'Vincetić', 'Graovac', 'Valentić', 'Nekić',
                   'Todeskini', 'Bokulić', 'Štajduhar', 'Petrović', 'Marić');

//$data = array();
$inserts = array();
$countImenaZ = count($zenskaImena);
$countImenaM = count($muskaImena);
$countPrezimena = count($prezimena);

$spol = array('Z','M');

for($i=0; $i<$numRecords; $i++) {
    $_spol = rand(0,1);
    if($_spol == 0) {
        $randIme = $zenskaImena[rand(0,$countImenaZ-1)];
    } else {
        $randIme = $muskaImena[rand(0,$countImenaM-1)];
    }
    $randPrezime = $prezimena[rand(0,$countPrezimena-1)];
    $jmbg = jmbg();
    /*$data[] = array(
        'oib' => oib(),
        'jmbg' => $jmbg,
        'ime'   => $randIme,
        'prezime' => $randPrezime,
        'datum_rodjenja' => datum($jmbg),
        'spol' => $spol[$_spol]
    );*/
    $inserts[] = "(" . oib() . ", " . $jmbg . ",'" . $randIme . "','" . $randPrezime . "','" . datum($jmbg) . "','" . $spol[$_spol] . "')";
    
}

$query = "INSERT INTO osz_ucenik(oib,jmbg,ime,prezime,datum_rodjenja,spol) VALUES" . implode(',', $inserts) . ";";

echo $query;
