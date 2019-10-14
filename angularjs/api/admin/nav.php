<?php
include_once('../lib/config.php');
$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : '';
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] :2;
// $offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] :0;

if($action =='nav'){
    $sql = "select * from {$pre}nav order by nav_id desc";
    $data = getAll($sql);
    echo json_encode($data);die;
}
if($action =='homenav'){
    $sql = "select * from {$pre}nav order by nav_id desc litmit {$limit}";
    $data = getAll($sql);
    echo json_encode($data);die;
}
if($action == 'navOne') {
    $sql = "select * from {$pre}nav where nav_id={$id}";
	$data = getOne($sql);
	echo json_encode($data);die;
}

//  //计算总数量 
//  if($action == 'foodCateCount'){
//     $sql = "select count(*) from {$pre}food_cate";
//     $data = getOne($sql);
//     echo json_encode($data);die;
// }
  // 删除所有
  if($action == 'navDeleteByIds' && $ids){
    $ids = json_decode($ids,true);// 将字符串转为数组，方便操作 
    $sql = "delete from {$pre}nav where nav_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
// 删除一条
if($action == 'navDelete' && $id){
     $sql = "delete from {$pre}nav where nav_id = {$id}";
     $result = delete($sql);
     if($result){
         echo_json(1,'删除成功');
     }else{
         echo_json(0,'删除失败');
     }
 }

if($action =='navAdd'){
    if($_POST){
        $title= isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']):'';
        $link= isset($_POST['link']) && !empty($_POST['link']) ? trim($_POST['link']):'';
    
        $data=array(
            'title'=>$title,
            'link'=>$link
        );
        if(!$id){
            $result=add("nav",$data);
            if($result){
                echo_json(1,'添加成功');
            }else{
                echo_json(0,'添加失败');
            }
        }else{
            $result = update("nav", $data, "where nav_id=${id}");
			if($result) {
				echo_json(1, '编辑成功');
			}else{
				echo_json(0, '编辑失败');
			}
        }
       
    }
}
 
?>