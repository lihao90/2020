<?php
include_once("../includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');



if($_POST){
  $username=isset($_POST['username']) ? $_POST['username'] : '';
  // $password=isset($_POST['password']) && !empty($_POST['password'])? $_POST['password']: ' ';
  // $avater=isset($_POST['avater']) && !empty($_POST['avater'])? $_POST['avater']: ' ';
  // $email=isset($_POST['email']) && !empty($_POST['email'])? $_POST['email']:' ';
  $admin = $db->select()->from("admin")->where("username = '$username'")->find();
  if($admin)
  {
    show("该用户已经存在了，请重新添加","admin_add.php");
    exit;
  }
  $salt=$admin['salt'];$username=isset($_POST['username']) ? $_POST['username'] : ' ';
  // $password=isset($_POST['password']) && !empty($_POST['password'])? $_POST['password']: ' ';
  // $avater=isset($_POST['avater']) && !empty($_POST['avater'])? $_POST['avater']: ' ';
  // $email=isset($_POST['email']) && !empty($_POST['email'])? $_POST['email']:' ';
  $admin = $db->select()->from("admin")->where("username = 'username'")->find();
  if($admin)
  {
    show("该用户已经存在了，请重新添加","admin_add.php");
    exit;
  }
  $salt=$admin['salt'];
  $data=array(
    'username'=>$username,
    'password'=>md5($_POST['password'].$salt),
    'email'=>trim($_POST['email']),
    'salt'=>trim($admin['salt']),
    'register_time'=>strtotime($_POST['register_time']),
  );

if($uploads->isFile())
{
  if($uploads->upload())
  {
    $data['avatar'] = $uploads->savefile();
  }else{
    show($uploads->getMessage());
    exit;
  }
}

if($db->add("admin",$data))
{
  show("添加成功","adminlist.php");
  exit;
}else{
  show("添加失败","admin_add.php");
  exit;
}
  
  
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include_once('meta.php');?>
  </head>

  <body> 

    <!-- 引入头部 -->
    <?php include_once('header.php');?>
    
    <?php include_once('menu.php');?>
    <div class="content">
        <div class="header">
            <h1 class="page-title">添加管理员</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Index</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onClick="location='list.html'"><i class="icon-list"></i>添加管理员</button>
                  <div class="btn-group">
                  </div>
                </div>

                <div class="well">
                    <div id="myTabContent" class="tab-content">
                      <div class="tab-pane active in" id="home">
                        <form method="post" enctype="multipart/form-data">
                            <label>用户名</label>
                            <input type="text"  name="username" class="input-xxlarge" required/>
                            <label>密码</label>
                            <input type="password"  name="password" class="input-xxlarge" required/>
                            <label>头像</label>
                            <input type="file" value="" class="input-xxlarge" name="avatar" required/>
                            <label>邮箱</label>
                            <input type="text" name="email" class="input-xxlarge"required/>
                            <label>添加时间</label>
                            <input  type="date" value="" class="input-xxlarge" name="register_time" required />
                            <label></label>
                            <input class="btn btn-primary" type="submit" value="提交" />
                        </form>
                      </div>
                  </div>
                </div>

                <footer>
                    <hr>
                    <p>&copy; 2017 <a href="#" target="_blank">copyright</a></p>
                </footer>
                    
            </div>
        </div>
    </div>
    
    <?php include_once('footer.php');?>

  </body>
</html>
  


    
    
   
