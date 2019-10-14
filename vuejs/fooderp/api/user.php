<?php
include_once("../includes/init.php");

$action = isset($_GET['action']) ? $_GET['action'] : "";

$json = array("msg"=>null,"result"=>false,"data"=>null);

if($action == "register")
{
  if($_POST)
  {
    $username = isset($_POST['username']) ? trim($_POST['username']) : "";

    $user = $db->select()->from("user")->where(["username"=>$username])->find();
    if($user)
    {
      $json['msg'] = '该用户已经注册了';
      return json($json);
    }
    
    $salt = $Strings->randomStr(15,false);

    $password = isset($_POST['password']) ? trim($_POST['password']) : "";

    $data = [
      "username"=>$username,
      "password"=>md5($password.$salt),
      "salt"=>$salt,
      "createtime"=>time(),
      "status"=>0,
      "avatar"=>'',
      'sex'=>1,
      'email'=>'',
    ];
    $result = $db->add("user",$data);

    if($result)
    {
      $json['result'] = true;
      $json['msg'] = '注册成功，跳转登录';
    }else{
      $json['result'] = false;
      $json['msg'] = '注册失败';
    }

    return json($json);
  }
}else if($action == "login")  //登录
{
  if($_POST)
  {
    $username = isset($_POST['username']) ? trim($_POST['username']) : "";

    //先判断用户是否存在
    $user = $db->select()->from("user")->where(['username'=>$username])->find();

    if(!$user)
    {
      $json['msg'] = "用户不存在";
      return json($json);
    }

    //判断密码是否正确
    $password = isset($_POST['password']) ? trim($_POST['password']) : "";
    $repass = $user['password'];
    $salt = $user['salt'];

    if(md5($password.$salt) != $repass)
    {
      $json['msg'] = '密码不正确';
      return json($json);
    }else{
      $json['msg'] = '登录成功';
      $json['data'] = $user;
      $json['result'] = true;
      return json($json);
    }

  }
}





?>