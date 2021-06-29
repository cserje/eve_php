<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

if (!isset($_POST["fields"]) || !isset($_POST["worker_id"]) || !isset($_POST["standard_id"]) || !isset($_POST["user_id"]))
{
    return http_response_code(422);
}

$fields = json_decode($_POST["fields"], true);
$worker_id = intval($_POST["worker_id"]);
$standard_id = intval($_POST["standard_id"]);
$user_id = intval($_POST["user_id"]);




$mysqli = mysql_connect();

// TODO: normális hitelesítéssel kicsit máshogyan néz majd ki
// $mysqli = mysql_connect();
// $stmt = $mysqli->prepare("SELECT COUNT(id) AS `count` FROM `WORKER` WHERE `id`=? AND `id_user`=?;");
// $stmt->bind_param("ii", $worker_id, $user_id);
// $stmt->execute();
// $stmt->bind_result($count);
// $stmt->fetch();
// $stmt->close();
// if ($count !== 1)
// {
//     return http_response_code(422);
// }

// EQUIPMENT beszúrása, id kinyerése
$stmt = $mysqli->prepare("INSERT INTO `EQUIPMENT` (`id_worker`,`id_standard_item_id`) VALUES (?,?);");
$stmt->bind_param("ii", $worker_id, $standard_id);
$stmt->execute();
$id_equipment = $mysqli->insert_id;
// $mysqli->close();
$stmt->close();


foreach ($fields as $field_id => $value)
{
    $field_id = intval($field_id);
    // $mysqli = mysql_connect();
    $stmt = $mysqli->prepare("INSERT INTO `EQUIPMENT_VALUE` (`id_equipment`,`id_standard_item_field`,`value`) VALUES (?,?,?);");
    $stmt->bind_param("iis", $id_equipment, $field_id, $value);
    $stmt->execute();
    $stmt->close();
}


// equipment value feltöltése
