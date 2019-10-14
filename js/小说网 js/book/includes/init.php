<?php
session_start();
error_reporting(E_ALL);
$path=str_replace("\\","/",dirname(dirname(__FILE__)));
$home = "./assets/home";
$admin="../assets/admin";
$uploads = "../assets/uploads";
$assets = "../assets";
$home_assets = "./assets";

define("APP_PATH",$path);
define("HOME_PATH",$home);
define("ADMIN_PATH",$admin);
define("UPLOAD_PATH",$uploads);
define("ASSETS_PATH",$assets);
define("HOME_ASSETS",$home_assets);

function __autoload($classname)
{
    $classname=strtolower($classname);
    include_once("extends/class.$classname.php");
}
$db=new DB("localhost","root","root","book");
// $one=$db->select()->from("cate")->where("id=2")->orderby("id","desc")->find();
// // select * from pre_book where id=1 order by id desc; 
// var_dump($one);
// exit;

$Strings=new Strings();
$uploads = new Uploads();
include_once("helpers.php");
header("Content-Type:text/html;charset=utf-8");
//   $add=$db->add("cate","(`name`)","('sd')") ->adds(); 
// $update=$db->update("cate","'name'='mm'")->where("id=2")->adds();
//   var_dump($update);
//   exit;   

?>