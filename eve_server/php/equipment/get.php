<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

// worker_id
// category, subcategory, fields

if (!isset($_POST["worker_id"]))
{
    return http_response_code(422);
}
$rows = [];
$worker_id = intval($_POST["worker_id"]);
$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT `id`, `id_standard_item_id` FROM `EQUIPMENT` WHERE `id_worker` = ?;");
$stmt->bind_param("i", $worker_id);
$stmt->execute();
$stmt->bind_result($equipment_id, $standard_item_id);
while ($stmt->fetch())
{
    $rows[] = ["equipment_id" => $equipment_id, "standard_item_id" => $standard_item_id];
}
$stmt->close();

// return print(json_encode($rows));
$list = [];
foreach ($rows as $item)
{
    $values = [];
    $stmt = $mysqli->prepare("SELECT `id_standard_item_field`, `value`, (SELECT `in_standard` FROM `STANDARD_ITEM_FIELD` WHERE `STANDARD_ITEM_FIELD`.`id` = `id_standard_item_field`), (SELECT `order` FROM `STANDARD_ITEM_FIELD` WHERE `STANDARD_ITEM_FIELD`.`id` = `id_standard_item_field`) FROM `EQUIPMENT_VALUE` WHERE `id_equipment` = ? ");
    $stmt->bind_param("i", $item["equipment_id"]);
    $stmt->execute();
    $stmt->bind_result($field_id, $value, $in_standard, $order);
    while ($stmt->fetch())
    {
        $values[] = ["field_id" => $field_id, "value" => $value, "in_standard" => $in_standard === 1, "order" => $order];
    }
    usort($values, function ($a, $b)
    {
        return $a["order"] - $b["order"];
    });

    // $stmt = $mysqli->prepare("SELECT `standard` FROM `STANDARD_ITEM` WHERE `id` = ?;");
    // $stmt->bind_param("i", $item["standard_item_id"])

    // alkategória kiválasztása, vagyis standard_item name lekérdezése $standard_item_id értéke alapján
    $stmt = $mysqli->prepare("SELECT `name`, `icon`, (SELECT `id` FROM `CATEGORY` WHERE `CATEGORY`.`id` = `id_category`), (SELECT `name` FROM `CATEGORY` WHERE `CATEGORY`.`id` = `id_category`), `standard` FROM `STANDARD_ITEM` WHERE `id` = ?;");
    $stmt->bind_param("i", $item["standard_item_id"]);
    $stmt->execute();
    $stmt->bind_result($standard_item_name, $standard_item_icon, $category_id, $category_name, $standard);
    $stmt->fetch();
    $category = ["id" => $category_id, "name" => $category_name];
    $standard_item = ["id" => $item["standard_item_id"], "name" => $standard_item_name, "icon" => $standard_item_icon, "values" => $values, "standard" => $standard];
    $list[] = [
        "equipment_id" => $item["equipment_id"],
        "category" => $category,
        "standard_item" => $standard_item

    ];
    $stmt->close();
}

return print(json_encode($list));
