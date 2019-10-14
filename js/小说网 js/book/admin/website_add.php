<?php
include_once("../includes/init.php");
date_default_timezone_set('PRC');
if($_POST){
  $name=isset($_POST['name']) ? trim($_POST['name']) : '';
  $website=$db->select()->from("website")->where("name='$name'")->find();
  if($website){
    show("该节点已经存在了，请重新添加","website_add.php");
    exit;

  }
  $data=array(
    "name"=>$name,
    "code"=>trim($_POST['code']),
    'register_time'=>strtotime($_POST['register_time']),
  );
  if($db->add("website",$data))
  {
    show('添加书节点成功','websitelist.php');
    exit;
  }else{
    show('添加节点失败');
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
  <?php include_once('header.php');?>

  <?php include_once('menu.php');?>

    <div class="content">
        <div class="header">
            <h1 class="page-title">添加节点</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a> <span class="divider">/</span></li>
            <li class="active">添加节点</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onClick="location='websitelist_php'"><i class="icon-list"></i> 节点列表</button>
                  <div class="btn-group">
                  </div>
                </div>

                <div class="well">
                    <div id="myTabContent" class="tab-content">
                      <div class="tab-pane active in" id="home">
                        <form method="post">
                            <label>节点标题</label>
                            <input type="text" name="name" required  class="input-xxlarge">
                            <label>节点的程序文件路径</label>
                            <input type="text" name="code" required  class="input-xxlarge">
                            <label>执行时间点</label>
                            <input  type="date" class="input-xxlarge" name="register_time" required />
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
  </body>
</html>

<?php include_once('footer.php');?>
