<?php
include_once("../includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');



$websiteid = isset($_GET['websiteid']) ? $_GET['websiteid'] : 0;
$website = $db->select()->from("website")->where(['id'=>$websiteid])->find();

if(!$website)
{
  show('该书籍记录不存在，请重新选择','websitelist.php');
  exit;
}
if($_POST){
  $name=isset($_POST['name']) ? trim($_POST['name']) : '';
  $websitecheck=$db->select()->from("website")->where("name='$name'")->find();
  if($websitecheck){
    show("该节点已经存在了，请重新编辑","website_edit.php?websiteid=$websiteid");
    exit;

  }
  $data=array(
    "name"=>$name,
    "code"=>trim($_POST['code']),
    'register_time'=>strtotime($_POST['register_time']),
  );
  if($db->update("website",$data,"id = $websiteid"))
  {
    show('编辑节点成功','websitelist.php');
    exit;
  }else{
    show('编辑节点失败');
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
            <h1 class="page-title">发布文章</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a> <span class="divider">/</span></li>
            <li class="active">添加分类</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onClick="location='websitelist.php'"><i class="icon-list"></i> 文章列表</button>
                  <div class="btn-group">
                  </div>
                </div>

                <div class="well">
                    <div id="myTabContent" class="tab-content">
                      <div class="tab-pane active in" id="home">
                      <form method="post">
                            <label>节点标题</label>
                            <input type="text" name="name" value="<?php echo $website['name'];?>" required  class="input-xxlarge">
                            <label>节点的程序文件路径</label>
                            <input type="text" name="code" value="<?php echo $website['code'];?>" required  class="input-xxlarge">
                            <label>执行时间点</label>
                            <input type="date" value="<?php echo date('Y-m-d',$website['register_time']);?>" class="input-xxlarge" name="register_time" required />
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
