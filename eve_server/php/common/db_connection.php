<?php

function mysql_connect() {
  $mysqli = new mysqli("localhost", "eve", "f9221911f3fea8872facca23da5ecc00", "EVE");

// Check connection
  if ($mysqli->connect_errno) {
    error_log("Failed to connect to MySQL: " . $mysqli->connect_error);
    exit();
  }
  return $mysqli;
}