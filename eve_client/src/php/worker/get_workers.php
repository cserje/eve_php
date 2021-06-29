<?php

include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';


if (!isset($_POST["user_id"])){
    http_response_code(401);
    return;
}

$user_id = $_POST["user_id"];
$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT `id`, `name`, `profession` FROM `WORKER` WHERE `id_user` = ?;");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($id, $name, $profession);
$result = $stmt->get_result();

$output = array();
while ($row = $result->fetch_assoc()) {
    $output[] = [
        "id" => $row["id"], "name" => $row["name"], "profession" => $row["profession"]
    ];
}

return print json_encode($output);