<?php
include_once("includes/init.php");
include_once("common.php");
date_default_timezone_set('PRC');


$cateid = isset($_GET['cateid']) ? $_GET['cateid'] : 0;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$action = isset($_GET['action']) ? $_GET['action'] : "";

$limit = 20;
$start = ($page-1)*$limit;

if($action == "reset")
{
  //直接查询书籍
  $booklist =$db->select()->from("book")->where("cateid = $cateid")->limit($start,$limit)->all();
  echo json_encode($booklist);
  exit;
}

//上拉加载
if($action == "page")
{
  $booklist =$db->select()->from("book")->where("cateid = $cateid")->limit($start,$limit)->all();

  $count = $db->select("COUNT(id) AS c")->from("book")->where("cateid = $cateid")->find();

  $result = array("booklist"=>$booklist,"count"=>$count);
  
  echo json_encode($result);
  exit;
}

//直接查询书籍
// $booklist =$db->select()->from("book")->where("cateid = $cateid")->limit($start,$limit)->all();

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
      <div id="mescroll" class="mescroll list-index">
        <ul id="articlelist" class=articlelist></ul>
      </div>
  </div>

  <?php include_once("menu.php");?>

</body>
</html>
<script src="<?php echo HOME_PATH;?>/js/index.js"></script>
<script id="tpl" type="text/html">
  <%for(var i = 0; i < list.length; i++) {%>
    <li>
        <a href="chapterlist.php?bookid=<%:=list[i].id%>">
          <%:=list[i].titles%>
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
        use : false , 
        delay : 500 
    }
  });

  function downCallback()
  {
    $.ajax({
				url: 'booklist.php?action=reset&cateid=<?php echo $cateid;?>&page=1',
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
      url: `booklist.php?action=page&page=${pageNum}&cateid=<?php echo $cateid;?>`,
      dataType:"json",
      success: function(data) {
        var curPageData = data.booklist; 
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