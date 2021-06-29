<?php
include '../common/set_access_control_allow_origin.php';
session_start();
session_destroy();
session_write_close();