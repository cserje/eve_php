<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

session_start();
if (!isset($_SESSION["user"]["id"])){
    http_response_code(401);
    return;
}

$user_id = $_SESSION["user"]["id"];
$mysqli = mysql_connect();
// TODO: folytatás
// $stmt = $mysqli->prepare("SELECT `id`, `name`, `profession` FROM `WORKER` WHERE `id_user` = ?;");