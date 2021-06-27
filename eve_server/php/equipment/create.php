<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

if (!isset($_POST["fields"]) || !isset($_POST["worker_id"]) || !isset($_POST["standard_id"]) || !isset($_POST["user_id"]))
{
    return http_response_code(422);
}

$fields = json_decode($_POST["fields"], true);
$worker_id = $_POST["worker_id"];
$standard_id = $_POST["standard_id"];
$user_id = $_POST["user_id"];

$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT COUNT(id) AS `count` FROM `WORKER` WHERE `id`=? AND `id_user`=?;");
$stmt->bind_param("ii", $worker_id, $user_id);
$stmt->execute();
$stmt->bind_result($count);
$stmt->fetch();
return $count;
// ellenőrzés, hogy a userhez tartozik-e a worker
// equipment létrehozása, id elmentése
// equipment value feltöltése
