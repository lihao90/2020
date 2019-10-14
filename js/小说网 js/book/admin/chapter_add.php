<?php
include_once("../includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');


if($_POST)
{
  $title = isset($_POST['title']) ? trim($_POST['title']) : '';
  // var_dump($title);exit;
  $chapter = $db->select()->from("chapter")->where("title = '$title'")->find();


  if($chapter)
  {
    show("该书籍章节已经存在了，请重新添加","chapteradd.php");
    exit;
  }

  $data = [
    "title"=>$title,
    'register_time'=>strtotime($_POST['register_time']), 
    'content'=>trim($_POST['content']),
    'bookid'=>trim($_POST['bookid'])
  ];
  //插入数据库
  if($db->add("chapter",$data))
  {
    show('添加书籍章节成功','chapterlist.php');
    exit;
  }else{
    show('添加书籍章节失败');
    exit;
  }
}
$booklist = $db->select()->from("book")->all();
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
            <h1 class="page-title">添加书籍章节</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.php">首页</a> <span class="divider">/</span></li>
            <li class="active">添加</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onClick="location='chapterlist.php'"><i class="icon-list"></i> 文章列表</button>
                  <div class="btn-group">
                  </div>
                </div>

                <div class="well">
                    <div id="myTabContent" class="tab-content">
                      <div class="tab-pane active in" id="home">
                        <form method="post">
                        <label>书籍名</label>
                            <select required name="bookid" class="input-xlarge">
                              <option value="">请选择</option>
                              <?php foreach($booklist as $item){?>
                              <option value="<?php echo $item['id'];?>"><?php echo $item['title'];?></option>
                              <?php }?>
                            </select>
                            <label>书籍章节标题</label>
                            <input type="text" value="" name="title" required  class="input-xxlarge">
                            <label>添加时间</label>
                            <input  type="date" value="" class="input-xxlarge" name="register_time" required />
                            <label>章节的内容是一个路径</label>
                            <input type="text" value="" name="content" required  class="input-xxlarge">
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

