<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

session_start();
if (!isset($_POST["user_id"], $_POST["worker_id"]))
{
    http_response_code(422);
    return;
}
$user_id = intval($_POST["user_id"]);
$worker_id = intval($_POST["worker_id"]);

$mysqli = mysql_connect();
$stmt = $mysqli->prepare("DELETE FROM `WORKER` WHERE `id` = ? AND `id_user` = ?;");
$stmt->bind_param("ii", $worker_id, $user_id);;
$stmt->execute();
