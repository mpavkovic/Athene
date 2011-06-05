<?php

use Sirius\Storage\Database\Mysql as MysqlStore;

ini_set('display_errors', 1);
error_reporting(E_ALL);


include('../config.php');
include('../lib/Sirius/Autoload.php');

$autoload = new Sirius\Autoload(APP_PATH . '/lib');

$dbStore = new MysqlStore(array(
    'host'  => DB_HOST,
    'user'  => DB_USER,
    'password'  => DB_PASS,
    'database'  => DB_NAME
));


$modelMenu = new Athene\Model\Menu(array(
                'label' => 'Mjesta',
                'extId' => 'asas',
                'extLeaf' => 'dsda'
            ));

//var_dump($modelMenu);

//echo $modelMenu;
$dbStore->save($modelMenu);

$modelMenu = new Athene\Model\Menu;
$dbStore->get($modelMenu);