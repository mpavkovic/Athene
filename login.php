<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include('config.php');
include('lib/Sirius/Autoload.php');

session_start();

$autoload = new \Sirius\Autoload(APP_PATH . '/lib');
$db = new \Sirius\Storage\Database\Mysql(array(
    'user'  => DB_USER,
    'password'  => DB_PASS,
    'database'  => DB_NAME
));


if(isset($_POST)) {
    header('Content-Type: text/javascript; charset=utf-8');
    
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    $r = $db->query("SELECT * FROM auth_user WHERE username = '$username' AND password='" . md5($password) . "' LIMIT 1");
    if(empty($r)) {
        echo "{ success: false, errors: { reason: 'Greška prilikom prijave. Provjerite da ste unijeli ispravne podatke!' }}";
        die();
    }
    
    // Login
    $_SESSION['id'] = $r[0]->id;
    $_SESSION['username'] = $r[0]->username;
    echo '{ success: true }';
}

?>