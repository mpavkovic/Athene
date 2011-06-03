<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include('../config.php');
include('../lib/Sirius/Autoload.php');

$autoload = new Sirius\Autoload(APP_PATH . '/lib');


$modelMenu = new Athene\Model\Menu();