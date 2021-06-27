<?php
function sort_select($list){
foreach ($list as &$item) {
  usort($item["options"], function ($a, $b) {
    if (($ia = intval($a["value"])) > 0 && ($ib = intval($b["value"])) > 0) {
      return $ia - $ib;
    } else if (($a["display"] == "nem" && $b["display"] == "igen") || ($a["display"] == "igen" && $b["display"] == "nem")) {
        if ($a["display"] == "igen"){
            return -1;
        }
        else if ($b["display"] == "igen"){
            return 1;
        }
    } else {
      return strcmp($a["value"], $b["value"]);
    }
  });
}
return $list;
}