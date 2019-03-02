<?php

session_start();

require_once 'general.php';

$postRequest = isset($_POST['request']) ? $_POST['request'] : null;
$getRequest = isset($_GET['request']) ? $_GET['request'] : null;
$reply = "Not even been in the switchCase?";
$salt = "SaltyIsThisSalt";

$database = Database::getInstance();

switch($postRequest) {
    default:
        $reply = "Unrecognized request";
        break;
}

switch($getRequest) {
    case "feed":
        $filter = isset($_GET['filter']) ? $_GET['filter'] : null;
        $maxDiff = isset($_GET['md']) ? $_GET['md'] : null;

        if($filter == "time") {
            if($maxDiff != null) {
                $reply = $database->getFeedByTimeFilter($maxDiff);
            } else {
                $reply = $database->getFeed();
            }
        } else {
            $reply = $database->getFeed();
        }
        break;
    default:
        $reply = "Unrecognized request";
        break;
}

$database->closeDB();
echo json_encode($reply);
