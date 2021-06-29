<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

session_start();
if (!isset($_POST["user_id"], $_POST["name"], $_POST["profession"]))
{
    http_response_code(422);
    return;
}
$user_id = intval($_POST["user_id"]);
$name = $_POST["name"];
$profession = $_POST["profession"];

$mysqli = mysql_connect();
$stmt = $mysqli->prepare("INSERT INTO `WORKER` (`name`, `profession`, `id_user`) VALUES (?,?,?);");
$stmt->bind_param("ssi", $name, $profession, $user_id);;
$stmt->execute();

http_response_code(200);
return;
