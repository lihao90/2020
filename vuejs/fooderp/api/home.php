<?php
include_once("../includes/init.php");

$action = isset($_GET['action']) ? $_GET['action'] : "";

$json = array("msg"=>null,"result"=>false,"data"=>null);

if($action == "banner")  //banner
{
  $banner = $db->select()->from("food")->where(["flag"=>"top"])->limit(0,8)->all();

  $json['data'] = $banner;
  $json['result'] = true;

  return json($json);
}else if($action == "hotfood")  //banner
{
  $hotfood = $db->select()->from("food")->where(["flag"=>"hot"])->limit(0,20)->all();

  $json['data'] = $hotfood;
  $json['result'] = true;

  return json($json);
}else if($action == 'foodcate') //食品分类
{ 

  $foodcate = $db->select()->from("foodcate")->where()->limit(0,8)->all();

  if(count($foodcate) > 0)
  {
    $cateid = isset(current($foodcate)['id']) ? current($foodcate)['id'] : 0;
    $foodlist = $db->select()->from("food")->where(['cateid'=>$cateid])->all();
  }

  $json['data'] = ['foodcate'=>$foodcate,"foodlist"=>$foodlist];
  $json['result'] = true;

  return json($json);
}else if($action == 'foodlist') //查询指定分类
{ 
  $cateid = isset($_POST['cateid']) ? $_POST['cateid'] : 0;
  $foodlist = $db->select()->from("food")->where(["cateid"=>$cateid])->all();

  $json['data'] = $foodlist;
  $json['result'] = true;

  return json($json);
}






?>