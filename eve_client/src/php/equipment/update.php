<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

if (!isset($_POST["equipment_id"]) || !isset($_POST["fields"]))
{
    return http_response_code(422);
}

$fields = json_decode($_POST["fields"], true);
$equipment_id = intval($_POST["equipment_id"]);


$mysqli = mysql_connect();
foreach ($fields as $key => $value)
{
    $standard_item_field_id = intval($key);
    // return print(json_encode([$value, $equipment_id, $standard_item_field_id]));
    $stmt = $mysqli->prepare("UPDATE `EQUIPMENT_VALUE` SET `value` = ? WHERE `id_equipment` = ? AND `id_standard_item_field` = ?;");
    $stmt->bind_param("sii", $value, $equipment_id, $standard_item_field_id);
    $stmt->execute();
    $stmt->close();
}
