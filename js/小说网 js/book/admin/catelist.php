<?php
include_once("../includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');

// $catelist=$db->select()->from("cate")->all();
if($_POST)
{
  $cateid = isset($_POST['cateid']) ? $_POST['cateid'] : 0;
  $cateid = implode(",",$cateid);

  $affect = $db->delete("cate","id IN($cateid)");

  if($affect)
  {
    show("删除书籍分类{$affect}条","catelist.php");
    exit;
  }else{
    show("删除书籍分类失败","catelist.php");
    exit;
  }
}
//当前页码数
$page = isset($_GET['page']) ? $_GET['page'] : 1;

//总条数
$count = $db->select("COUNT(id) AS c")->from("cate")->find();

//每页显示多少条
$limit = 5;

//中间的页码数
$size = 6;

//调用分页函数，生成分页字符串
$pageStr = page($page,$count['c'],$limit,$size,'yellow');

//偏移量
$start = ($page-1)*$limit;
$catelist = $db->select()->from("cate")->orderby("id","desc")->limit($start,$limit)->all();//查询
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
            <h1 class="page-title">文章列表</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Index</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onClick="location='cate_add.php'"><i class="icon-plus"></i>发布文章</button>
                </div>
                <div class="well">
                  <form  method="post">
                    <table class="table">
                      <thead>
                        <tr>
                          <th><input type="checkbox" name="delete" id="delete" /></th>
                          <th>分类名称</th>
                          <th style="width: 26px;">操作</th>
                        </tr>
                      </thead>
                      <tbody>
                      <?php foreach($catelist as $item){?>
                        <tr>
                          <td><input type="checkbox" class="items" name="cateid[]" value="<?php echo $item['id'];?>" /></td>
                          <td><?php echo $item['name'];?></td>
                          <td>
                              <a href="cate_edit.php?cateid=<?php echo $item['id'];?>"><i class="icon-pencil"></i></a>
                              <a href="#myModal" onclick="del(<?php echo $item['id'];?>)" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                          </td>
                        </tr>
                      <?php }?>
                      <tr>
                        <td colspan="20" style="text-align:left;">
                          <button type="submit">批量删除</button>
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </form>
                </div>
                <div class="pagination">
                    <?php echo $pageStr;?>
                </div>

                <form method="post">
                <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Delete Confirmation</h3>
                    </div>
                    <div class="modal-body">
                        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>是否确实要删除该用户？</p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="cateid" name="cateid[]" value="0" />
                        <button type="submit" class="btn btn-danger">删除</button>
                        <button class="button" data-dismiss="modal" aria-hidden="true">取消</button>
                    </div>
                </div>
                </form>
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
<script>
  function del(cateid)
  {
    $("#cateid").val(cateid);
  }
</script>

