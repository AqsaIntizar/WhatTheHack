<?php

session_start();

require_once 'general.php';

$database = Database::getInstance();

$email = isset($_SESSION['email']) ? $_SESSION['email'] : null;
$pwd = isset($_SESSION['pwd']) ? $_SESSION['pwd'] : null;

// Let's fake login haha
$email = 'jhon.doe@gmail.com';
$pwd = 'f2f86d6bdd231f23b356f858191b3887';

$usr = null;

$isValidUser = true;
$usr = $database->getUser($email, $pwd);
if(empty($usr)) {
    $isValidUser = false;
}

LoadPages::feed($isValidUser, $usr);      // load feed screen

