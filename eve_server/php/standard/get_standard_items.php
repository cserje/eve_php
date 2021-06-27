<?php

include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

if (!isset($_POST["category_id"])){
    http_response_code(422);
    return;
}
$category_id = $_POST["category_id"];

// return print($category_id);
$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT `id`, `name`, `standard`, `icon`, `enabled` FROM STANDARD_ITEM WHERE id_category = ? ORDER BY `name`;");
$stmt->bind_param("i", $category_id);
$stmt->execute();
$result = $stmt->get_result();
$output = array();
while ($row = $result->fetch_assoc()) {
    $output[] = [
        "id" => $row["id"], "name" => $row["name"], "standard" => $row["standard"], "icon" => $row["icon"], "enabled" => $row["enabled"] == true    ];
}

return print json_encode($output);