<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include('../config.php');
include('../lib/Sirius/Autoload.php');

$autoload = new Sirius\Autoload(APP_PATH . '/lib');

$database = new Sirius\Storage\Database\Mysql(array(
    'user'  => DB_USER,
    'password'  => DB_PASS,
    'database'  => DB_NAME
));

$modelUser = new Athene\Model\User();

echo '<pre>';
var_dump($modelUser->getAll());
echo '</pre>';