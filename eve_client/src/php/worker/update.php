<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

session_start();
if (!isset($_POST["user_id"], $_POST["worker_id"], $_POST["name"], $_POST["profession"]))
{
    http_response_code(422);
    return;
}
$user_id = intval($_POST["user_id"]);
$worker_id = intval($_POST["worker_id"]);
$name = $_POST["name"];
$profession = $_POST["profession"];

$mysqli = mysql_connect();
$stmt = $mysqli->prepare("UPDATE `WORKER` SET `name` = ?, `profession` = ? WHERE `id` = ? AND `id_user`= ?;");
$stmt->bind_param("ssii", $name, $profession, $worker_id, $user_id);
$stmt->execute();
