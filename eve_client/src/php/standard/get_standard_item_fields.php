<?php
include '../common/set_access_control_allow_origin.php';
include '../common/db_connection.php';

if (!isset($_POST["standard_item_id"])) {
  http_response_code(422);
  return;
}
$standard_item_id = $_POST["standard_item_id"];
$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT `id`, `name`, `order`, `type`, `tooltip`, `in_standard`, `required` FROM STANDARD_ITEM_FIELD WHERE id_standard_item = ? ORDER BY `order`;");
$stmt->bind_param("i", $standard_item_id);
$stmt->execute();
$result = $stmt->get_result();
$standard_fields = [];
while ($row = $result->fetch_assoc()) {
  $standard_fields[] = [
    "id" => $row["id"], "name" => $row["name"], "order" => $row["order"], "type" => $row["type"]
    , "tooltip" => $row["tooltip"], "in_standard" => $row["in_standard"], "required" => $row["required"] == true,
  ];
}
foreach ($standard_fields as &$standard_field) {
  if ($standard_field["type"] === "SELECT") {
    $stmt = $mysqli->prepare("SELECT `id`, `text`, `value` FROM FIELD_VALUE_SET WHERE id_standard_item_field = ? ORDER BY `value`;");
    $stmt->bind_param("i", $standard_field["id"]);
    $stmt->execute();
    $result = $stmt->get_result();
    $options = [];
    while ($row = $result -> fetch_assoc()) {
      $options[] = [
        "id" => $row["id"], "text" => $row["text"], "value" => $row["value"],
      ];
    }
    usort($options, function ($a, $b) {
      if (($ia = intval($a["value"])) > 0 && ($ib = intval($b["value"])) > 0) {
        return $ia - $ib;
      } else if (($a["text"] == "nem" && $b["text"] == "igen") || ($a["text"] == "igen" && $b["text"] == "nem")) {
          if ($a["text"] == "igen"){
              return -1;
          }
          else if ($b["text"] == "igen"){
              return 1;
          }
      } else {
        return strcmp($a["value"], $b["value"]);
      }
    });
    $standard_field["options"] = $options;
  }
}

return print json_encode($standard_fields);
