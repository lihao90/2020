<?php
header("content-type: text/html; charset=utf-8");
// 设置时区
date_default_timezone_set('PRC');

// http://www.xxx.com/
define('HTTP', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['SERVER_NAME']);

// http根目录
define("DIR", HTTP . dirname(dirname(dirname($_SERVER['PHP_SELF']))) . '/' );
 
 // 图片http地址头
define("UPLOADS",  DIR . 'assets/home/img/' );

// 物理根目录
define("ROOT",  $_SERVER['DOCUMENT_ROOT'] );

// 设置路径
define("APP", str_replace('\\', '/', dirname(__DIR__)) . '/'); 
define("LIB", APP . 'lib/' );

$host = 'localhost';
$user = 'root';
$pwd = '123456';
$db = 'food';
$pre = 'f_';

// 引入库文件
include_once(LIB.'db.php');

// 链接数据库
$cn = connect($host, $user, $pwd, $db);
// 引入助手函数库
include_once(LIB .'helper.php');

// 引入分页函数库
include_once( LIB .'pagination.php');
// 引入文件上传库
include_once(LIB .'file.php');