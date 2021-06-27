<?php
include '../common/set_access_control_allow_origin.php';
session_start();
$user = isset($_SESSION["user"]) ? $_SESSION["user"] : null;
return print(json_encode($user));