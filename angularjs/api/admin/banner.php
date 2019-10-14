<?php
include_once('../lib/config.php');

$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;
if($action == 'banner'){
    $sql ="select * from {$pre}banner order by banner_id desc";
    $data =getAll($sql);
    echo json_encode($data);die;
}
if($action == 'bannerOne'){
    $sql = "select * from {$pre}banner  where banner_id={$id}";
    $data = getOne($sql);
    echo json_encode($data);die;
}
 // 删除所有
 if($action == 'bannerDeleteByIds' && $ids){
    $ids = json_decode($ids,true);// 将字符串转为数组，方便操作 
    $sql= "select pic from f_banner where banner_id in (${ids['ids']})";
    $pic=getAll($sql);
    foreach ($pic as $key => $value) {
        $oldpic= str_replace(HTTP, ROOT,$value['pic']);
        unlink($oldpic);
    }
    $sql = "delete from {$pre}banner where banner_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
// 删除一条
if($action == 'bannerDelete' && $id){
    $sqls= "select pic from f_banner where banner_id = {$id}";
     $pic=getOne($sqls);
     $oldpic= str_replace(HTTP, ROOT, $pic['pic']);
     unlink($oldpic);
     $sqld = "delete from {$pre}banner where banner_id = {$id}";
     $result = delete($sqld);
     if($result){
         echo_json(1,'删除成功');
     }else{
         echo_json(0,'删除失败');
     }
 }
 //图片上传
 if($action == 'fileUpload'){
    $uploadUrl = '../../assets/home/img';
    $pic = upload_file('file',$uploadUrl);

    if($pic){
        $pic = str_replace($uploadUrl,'',$pic);
        $pic = UPLOADS . $pic;
        echo_json(1,$pic);
    }else{
        echo_json(0,'上传失败');
    }
} 
if($action == 'bannerAdd'){
    if($_POST){
        $title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
        $link = isset($_POST['link']) && !empty($_POST['link']) ? trim($_POST['link']) : '';
        $pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
        $oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
        $data = array(
            'link' => $link,
            'title' => $title,
            'pic' => $pic
        );
        if(!$id){
            $result = add("banner",$data);
            if($result){
                echo_json(1,'添加成功');
                
            }else{
                echo_json(0,'添加失败');
            }
        }else{
                //物理处理图片
            if($pic && $oldpic && $pic !=$oldpic){
                $oldpic =str_replace(HTTP,ROOT,$oldpic);
                unlink($oldpic);
            }
            $result = update("banner",$data,"where banner_id=${id}");
            if($result){
               echo_json(1,'编辑成功');
                
            }else{
                echo_json(0,'编辑失败');
            }
        }
    }
}