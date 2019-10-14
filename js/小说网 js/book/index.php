<?php
include_once("includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');


?>
<!DOCTYPE html>
<html>

<head>
  <?php include_once('meta.php');?>
</head>
<body>
  <div id="warmp" class="warmp">
    <?php include_once('header.php');?>

    <div class="tab-news" id="tab-news">
      <div class="tab-news-hd tab-hd-index">
            <ul class="fix">
                <li class="on">最新书籍</li>
                <li>网友推荐</li>
                <li>书籍置顶</li>
            </ul>
        </div>
        <div class="tab-news-con">
            <div class="con list-index active">
                <ul>
                  <?php foreach($new as $item){?>
                    <li><a href="chapterlist.php?bookid=<?php echo $item['id']?>"><?php echo $item['titles'];?></a></li>
                  <?php }?>
                </ul>
            </div>
            <div class="con list-index">
                <ul>
                  <?php foreach($hot as $item){?>
                    <li><a href="chapterlist.php?bookid=<?php echo $item['id']?>"><?php echo $item['titles'];?></a></li>
                  <?php }?>
                </ul>
            </div>
            <div class="con list-index">
                <ul>
                  <?php foreach($top as $item){?>
                    <li><a href="chapterlist.php?bookid=<?php echo $item['id']?>"><?php echo $item['titles'];?></a></li>
                  <?php }?>
                </ul>
            </div>
        </div>
    </div>

    <?php include_once("footer.php");?>
  </div>
  <?php include_once("menu.php");?>
</body>
</html>
<script src="<?php echo HOME_PATH;?>/js/index.js"></script>