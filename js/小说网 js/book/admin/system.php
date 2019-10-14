<?php
include_once("../includes/init.php");
include_once("common.php");


$conf = $db->select("name,value")->from("conf")->where("name in ('oanme','logopng','link','number','keyword','describe')")->all();


if($_POST){
  $oanme = isset($_POST['oanme']) ? trim($_POST['oanme']) : '';
  $link = isset($_POST['link']) ? trim($_POST['link']) : '';
  $number = isset($_POST['number']) ? trim($_POST['number']) : '';
  $keyword = isset($_POST['keyword']) ? trim($_POST['keyword']) : '';
  $describe = isset($_POST['describe']) ? trim($_POST['describe']) : '';




$data='';
  //判断是否有文件上传
  if($uploads->isFile()){
    //判断文件是否上传成功
    if($uploads->upload()){
      @is_file(ASSETS_PATH.$conf['logopng']) && @unlink(ASSETS_PATH.$conf['logopng']);
      //获取上传的文件名
      $data = $uploads->savefile();
     //var_dump($data['logopng']);die;
    }else{
      //显示错误信息
      show($uploads->getMessage());
      exit;
    }
  }
  $conflist = array(['oanme',$oanme],['link',$link],['number',$number],['keyword',$keyword],['describe',$describe],['logopng',$data]);
 //var_dump($conflist);die;

$a='';
  //插入数据库
  if($a == ''){
    for($i=0;$i<count($conf);$i++){
      
        $db->update('conf',["value"=>$conflist[$i][1]],"name = '".$conflist[$i][0]."'");
    }
    //var_dump($conflist);die;
    show('更新设置成功！','system.php');
}else{
   
    show('更新设置失败！','system.php');
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
            <h1 class="page-title">网站设置</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Index</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onClick="location='cate_list.php'"><i class="icon-list"></i> 分类列表</button>
                  <div class="btn-group">
                  </div>
                </div>

                <div class="well">
                    <div id="myTabContent" class="tab-content">
                      <div class="tab-pane active in" id="home">
                        <form method="post" enctype="multipart/form-data">  
                            <label>网站名称</label>
                            <input type="text" name="oanme" value="<?php echo $conf[0]['value']?>" class="input-xxlarge">
                            <label>网站logopng</label>
                            <input type="file" value="" class="input-xxlarge" name="logopng" />
                            <?php if(!empty($conf[1]['value'])){?>
                              <div class="book_thumb">
                                <img class="img-responsive" src="<?php echo ASSETS_PATH.$conf[1]['value'];?>" />
                              </div>
                            <?php }else{?>
                              <div class="book_thumb">
                                <img class="img-responsive" src="<?php echo ADMIN_PATH.'/images/cover.png';?>" />
                              </div>
                            <?php }?>
                            <label>友情连接</label>
                            <input type="text" name="link" value="<?php echo $conf[2]['value']?>" class="input-xxlarge">
                            <label>备案号</label>
                            <input type="text" name="number" value="<?php echo $conf[3]['value']?>" class="input-xxlarge">
                            <label>关键字</label>
                            <input type="text" name="keyword" value="<?php echo $conf[4]['value']?>" class="input-xxlarge">
                            <label>描述</label>
                            <textarea value="Smith" rows="3" class="input-xxlarge" name="describe"><?php echo $conf[5]['value']?></textarea>
                           
                            <label></label>
                            <input class="btn btn-primary" type="submit" value="提交" />
                        </form>
                      </div>
                  </div>
                </div>

                <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Delete Confirmation</h3>
                  </div>
                  <div class="modal-body">
                    
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
                  </div>
                  <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                    <button class="btn btn-danger" data-dismiss="modal">Delete</button>
                  </div>
                </div>
                
                <footer>
                    <hr>
                    <p>&copy; 2017 <a href="#" target="_blank">copyright</a></p>
                </footer>
                    
            </div>
        </div>
    </div>
    
    <?php include_once('./footer.php')?>
  </body>
</html>


