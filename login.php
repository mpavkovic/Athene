<?php

include('config.php');
include('database.php');

session_start();

$db = Database::getInstance();

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