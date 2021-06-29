<?php

include '../common/set_access_control_allow_origin.php';

if (!isset($_POST["email"], $_POST["password"])){
    http_response_code(400);
    return;
}
$email = $_POST["email"];
$password = md5($email.$_POST["password"]);
include '../common/db_connection.php';
$mysqli = mysql_connect();
$stmt = $mysqli->prepare("SELECT `id`, `name`, `email`  FROM USER WHERE `email` = ? AND `password` = ?;");
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$stmt->bind_result($id, $name, $email);
$stmt->fetch();
if (isset($id, $name, $email)){
    http_response_code(200);
    $user = ["id" => $id , "name" => $name, "email" => $email];
    session_start();
    $_SESSION["user"] = $user;
    session_write_close();
    return print(json_encode($user));
}
else{
  return http_response_code(401);
}