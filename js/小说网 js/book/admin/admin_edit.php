<?php
include_once("../includes/init.php");
date_default_timezone_set('PRC');

$adminid = isset($_GET['adminid']) ? $_GET['adminid'] : 0;
$admin = $db->select()->from("admin")->where(['id'=>$adminid])->find();
if(!$admin)
{
  show("该用户不存在，请重新添加","admin_add.php");
  exit;
}
$salt=$admin['salt'];
if($_POST){
  $username=isset($_POST['username']) ? $_POST['username'] : ' ';
  
  $admincheck = $db->select()->from("admin")->where("username = '$username' AND id !=$adminid ")->find();
  if($admincheck)
  {
    show("该书籍已经存在了，请重新修改","book_edit.php?adminid=$adminid");
    exit;
  }
  $data=array(
    'username'=>$username,
    'password'=>md5($_POST['password'].$salt),
    'email'=>trim($_POST['email']),
    'register_time'=>strtotime($_POST['register_time']),
  );
//判断是否有文件上传
if($uploads->isFile())
{
  //判断文件是否上传成功
  if($uploads->upload())
  {
    //获取上传的文件名
    @is_file(ASSETS_PATH.$book['avatar']) && @unlink(ASSETS_PATH.$book['avatar']);
    //获取上传的文件名
    $data['avatar'] = $uploads->savefile();
  }else{
    //显示错误信息
    show($uploads->getMessage());
    exit;
  }
}

if($db->update("admin",$data,"id = $adminid"))
{
  show("编辑成功","adminlist.php");
  exit;
}else{
  show("编辑失败","admin_edit.php");
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
                            <input type="text"  name="username" class="input-xxlarge" value="<?php echo $admin['username'];?>" required/>
                            <label>密码</label>
                            <input type="password"  name="password" class="input-xxlarge" value="<?php echo $admin['password'];?>" required/>
                            <label>头像</label>
                            <input type="file"  class="input-xxlarge" name="avater" required/>
                            <?php if(!empty($admin['thumb'])){?>
                              <div class="book_thumb">
                                <img class="img-responsive" src="<?php echo ASSETS_PATH.$admin['thumb'];?>" />
                              </div>
                            <?php }else{?>
                              <div class="book_thumb">
                                <img class="img-responsive" src="<?php echo ADMIN_PATH.'/images/cover.png';?>" />
                              </div>
                            <?php }?>
                            <label>邮箱</label>
                            <input type="text" name="email" class="input-xxlarge" value="<?php echo $admin['email'];?>" required/>
                            <label>添加时间</label>
                            <input type="date" value="<?php echo date('Y-m-d',$admin['register_time']);?>" class="input-xxlarge" name="register_time" required />
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
  
  


    
   
