<?php
include_once("includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');

$chapterid=isset($_GET['chapterid']) ? $_GET['chapterid'] :0;
$action=isset($_GET['action']) ? $_GET['action']: "pages";

$bookinfo=$db->select()->from("chapter")->where("id=$chapterid")->find();

if(!$bookinfo){
  show("无章节数据","boooklist.php");
  exit;
}
$content = is_file(HOME_ASSETS.$bookinfo['content']) ? file_get_contents(HOME_ASSETS.$bookinfo['content']) : "";

if(empty($content)){
  show("该章节无内容","booklist.php");
  exit;
}
$json=json_decode($content,true);

// $prev=$db->select("id")->from('chapter')->where("id < $chapterid")->orderby("id","desc")->find();
$prev=$db->select("chapter.id")->from('chapter')->join("book","chapter.bookid= book.id")->where("chapter.id < $chapterid")->orderby("chapter.id","desc")->find();
// var_dump($db);die;
$next=$db->select("chapter.id")->from('chapter')->join("book","chapter.bookid= book.id")->where("chapter.id > $chapterid")->orderby("chapter.id","asc")->find();
?>
<!DOCTYPE html>
<html>

<head>
<?php include_once("meta.php");?>
<base target="_self" />
</head>
<body>
<div id="nav-over"></div>
<div id="warmp" class="warmp">
  <?php include_once("header.php");?> 
	
	<div class="dh">
    <a href="index.php">首页</a> >
     <font color="#999999"><strong><?php echo $json['title'];?></strong></font>
     <?php
     if($action=="pages"){?>
        <a style="float:right;" href="bookinfo.php?chapterid=<?php echo $chapterid;?>&action=down">下拉阅读</a>
     <?php }else{?>
         
      <a style="float:right;" href="bookinfo.php?chapterid=<?php echo $chapterid;?>&action=pages">分页阅读</a>
     <?php }?>
    </div>

	<article class="article">
		<h1 class="hd"><?php echo $json['title'];?></h1>
		<div class="article-con">
			<?php echo $json['content'];?>
		</div>
	</article>
  <div class="pagelist">
    <?php if($prev){?>
       <li><a href="bookinfo.php?chapterid=<?php echo $prev['id'];?>">上一页</a></li>
    <?php }else{?>
      <li><a href="javascript:void(0)">无上一页</a></li>
    <?php }?>
    <?php if($next){?>
       <li><a href="bookinfo.php?chapterid=<?php echo $next['id'];?>">下一页</a></li>
    <?php }else{?>
      <li><a href="javascript:void(0)">无下一页</a></li>
    <?php }?>
  </div>
  <?php include_once("footer.php");?>
</div>
<!-- 下拉导航菜单 -->
<?php include_once("menu.php");?>
<!-- 下拉导航菜单END -->

</body>
</html>
<script src="<?php echo HOME_PATH;?>/js/index.js"></script>