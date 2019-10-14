<?php
    session_start();
    if( !isset($_SESSION['admin_name']) || empty($_SESSION['admin_name']) ) {
        showMsg('您还未登录，请登录...', 'login.php');die;
    }
?>