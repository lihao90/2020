<?php
include_once("../includes/init.php");
date_default_timezone_set('PRC');

$cateid = isset($_GET['cateid']) ? $_GET['cateid'] : 0;
$cate = $db->select()->from("cate")->where(['id'=>$cateid])->find();

if(!$cate)
{
  show('该书籍记录不存在，请重新选择','list.php');
  exit;
}
if($_POST){
  $name=isset($_POST['name']) ? trim($_POST['name']) : '';
  $catecheck=$db->select()->from("cate")->where("name='$name' AND id !=$cateid")->find();
  if($catecheck){
    show("该书籍分类已经存在了，请重新编辑","cate_edit.php?cateid=$cateid");
    exit;

  }
  $data=array(
    "name"=>$name
  );
  if($db->update("cate",$data,"id=$cateid"))
  {
    show('编辑书分类成功','catelist.php');
    exit;
  }else{
    show('编辑书籍失败');
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
                    <button class="btn btn-primary" onClick="location='catelist_php'"><i class="icon-list"></i> 文章列表</button>
                  <div class="btn-group">
                  </div>
                </div>

                <div class="well">
                    <div id="myTabContent" class="tab-content">
                      <div class="tab-pane active in" id="home">
                        <form method="post">
                            <label>文章名称</label>
                            <input type="text" name="name" required required  value="<?php echo $cate['name'];?>" class="input-xxlarge">
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
