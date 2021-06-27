<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';


$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT `id`, `name`, `icon`, (SELECT COUNT(`id`) FROM `STANDARD_ITEM` WHERE `id_category` = `CATEGORY`.`id`) AS `count` FROM `CATEGORY`;");
$stmt->execute();
$result = $stmt->get_result();

$output = array();
while ($row = $result->fetch_assoc()) {
    $output[] = [
        "id" => $row["id"], "name" => $row["name"], "icon" => $row["icon"], "count" => $row["count"]
    ];
}

return print json_encode($output);