<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

if (!isset($_POST["equipment_id"]))
{
    return http_response_code(422);
}


$equipment_id = $_POST["equipment_id"];

$mysqli = mysql_connect();
$stmt = $mysqli->prepare("DELETE FROM EQUIPMENT WHERE `id` = ?");
$stmt->bind_param("i", $equipment_id);
$stmt->execute();
