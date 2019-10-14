<?php
include_once('../lib/config.php');

$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;
if($action == 'shop'){
    $sql ="select * from {$pre}shop as s left join {$pre}region as r on s.region_id= r.region_id order by shop_id desc";
    $data =getAll($sql);
    echo json_encode($data);die;
}
if($action == 'shopOne'){
    $sql = "select * from {$pre}shop as s left join {$pre}region as r on s.region_id = r.region_id where shop_id={$id}";
    $data = getOne($sql);
    echo json_encode($data);die;
}
 // 删除所有
 if($action == 'shopDeleteByIds' && $ids){
    $ids = json_decode($ids,true);// 将字符串转为数组，方便操作 
    $sql= "select pic from f_shop where shop_id in (${ids['ids']})";
    $pic=getAll($sql);
    foreach ($pic as $key => $value) {
        $oldpic= str_replace(HTTP, ROOT,$value['pic']);
        unlink($oldpic);
    }
    $sql = "delete from {$pre}shop where shop_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
// 删除一条
if($action == 'shopDelete' && $id){
    $sqls= "select pic from f_shop where shop_id = {$id}";
     $pic=getOne($sqls);
     $oldpic= str_replace(HTTP, ROOT, $pic['pic']);
     unlink($oldpic);
     $sqld = "delete from {$pre}shop where shop_id = {$id}";
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
if($action == 'shopAdd'){
    if($_POST){
        $title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
        $dishes = isset($_POST['dishes']) && !empty($_POST['dishes']) ? trim($_POST['dishes']) : '';
        $address = isset($_POST['address']) && !empty($_POST['address']) ?trim($_POST['address']) : '';
        $region_id = isset($_POST['region_id']) && !empty($_POST['region_id']) ? intval($_POST['region_id']) : 0;
        $tag = isset($_POST['tag']) && !empty($_POST['tag']) ? trim($_POST['tag']) : '';
        $business_time = isset($_POST['business_time']) && !empty($_POST['business_time']) ? trim($_POST['business_time']) : '';
        $pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
        $oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
        $data = array(
            'title' => $title,
            'dishes' => $dishes,
            'address' => $address,
            'region_id' => $region_id,
            'business_time'=>$business_time,
            'tag' => $tag,
            'pic' => $pic
        );
        if(!$id){
            $result = add("shop",$data);
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
            $result = update("shop",$data,"where shop_id=${id}");
            if($result){
               echo_json(1,'编辑成功');
                
            }else{
                echo_json(0,'编辑失败');
            }
        }
    }
}