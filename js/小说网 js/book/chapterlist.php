<?php
include_once("includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');


$bookid = isset($_GET['bookid']) ? $_GET['bookid'] : 0;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$action = isset($_GET['action']) ? $_GET['action'] : "";

// $book=$db->select()->from("book")->where("id=$bookid")->find();
// var_dump($book);exit;
// if(!$book){
//   show("没有该书籍的数据","booklist.php");
//   exit;
// }


$limit = 20;
$start = ($page-1)*$limit;


if($action == "reset")
{
  //直接查询书籍
  $chapterlist =$db->select()->from("chapter")->where("bookid = $bookid")->limit($start,$limit)->all();
  echo json_encode($chapterlist);
  exit;
}
//上拉加载
if($action == "page")
{
  $chapterlist =$db->select()->from("chapter")->where("bookid = $bookid")->limit($start,$limit)->all();

  $count = $db->select("COUNT(id) AS c")->from("chapter")->where("bookid = $bookid")->find();

  $result = array("chapterlist"=>$chapterlist,"count"=>$count);
  
  echo json_encode($result);
  exit;
}

//直接查询书籍
// $chapterlist =$db->select()->from("chapter")->where("bookid = $bookid")->limit($start,$limit)->all();
?>
<!DOCTYPE html>
<html>
<head>
  <?php include_once('meta.php');?>
  <link rel="stylesheet" href="<?php echo HOME_ASSETS;?>/plugin/mescroll/mescroll.min.css">
  <script src="<?php echo HOME_ASSETS;?>/plugin/mescroll/mescroll.min.js"></script>

  <script src="<?php echo HOME_ASSETS;?>/plugin/templatejs/template.js"></script>
  <style>
    .mescroll{
      position: fixed;
			top: 144px;
			bottom: 0;
			height: auto; /*如设置bottom:50px,则需height:auto才能生效*/
    }
  </style>
</head>

<body>
  <div id="warmp" class="warmp">
      <?php include_once('header.php');?>
      
      <div class="dh"><a href="index.php">首页</a> > 数据列表：</div>
      <!-- <div class="list-index">
        <ul class=articlelist>
          <?php foreach($chapterlist as $item){?>
          <li><a href="bookinfo.php?chapterid=<?php echo $item['id']?>"><?php echo $item['title'];?></a></li>
          <?php }?>
        </ul>
      </div> -->

      <div id="mescroll" class="mescroll list-index">
        <ul id="articlelist" class=articlelist></ul>
      </div>

       <?php include_once("footer.php");?> 
  </div>

  <?php include_once("menu.php");?>

</body>
</html>
<script src="<?php echo HOME_PATH;?>/js/index.js"></script>
<script id="tpl" type="text/html">
  <%for(var i = 0; i < list.length; i++) {%>
    <li>
        <a href="bookinfo.php?chapterid=<%:=list[i].id%>">
          <%:=list[i].title%>
        </a>
    </li>
  <%}%>
</script>
<script>
  var mescroll = new MeScroll("mescroll",{
    down:{
      callback: downCallback,
    },

   
    up:{
      callback: upCallback,
      page: {
        num: 0, 
        size: 10 
      },
        // use : false , 
        // delay : 500 
    }
  });

  function downCallback()
  {
    $.ajax({
				url: 'chapterlist.php?action=reset&bookid=<?php echo $bookid;?>&page=1',
        dataType:"json",
				success: function(data) {
          var tpl = document.getElementById('tpl').innerHTML;
          var str = template(tpl, {list: data});
          $("#articlelist").html("");
          $("#articlelist").html(str);
          mescroll.resetUpScroll();
					mescroll.endSuccess(); 
				},
				error: function(data) {
					mescroll.endErr();
				}
			});
  }


  function upCallback(page)
  {
    var pageNum = page.num;
    $.ajax({
      url: `chapterlist.php?action=page&page=${pageNum}&bookid=<?php echo $bookid;?>`,
      dataType:"json",
      success: function(data) {
        var curPageData = data.chapterlist; 
        var totalSize = data.count.c; 

        var tpl = document.getElementById('tpl').innerHTML;
        var str = template(tpl, {list: curPageData});
        $("#articlelist").append(str);
        mescroll.endBySize(curPageData.length, totalSize);
        
      },
      error: function(e) {
        mescroll.endErr();
      }
    });
  }
</script>