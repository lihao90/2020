<?php
include_once('../lib/config.php');
$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : '';
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] :2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] :0;

if($action =='foodCate'){
    $sql = "select * from {$pre}food_cate order by cate_id desc";
    $data = getAll($sql);
    echo json_encode($data);die;
}

if($action == 'foodCateOne') {
    $sql = "select * from {$pre}food_cate where cate_id={$id}";
	$data = getOne($sql);
	echo json_encode($data);die;
}

 //计算总数量 
 if($action == 'foodCateCount'){
    $sql = "select count(*) from {$pre}food_cate";
    $data = getOne($sql);
    echo json_encode($data);die;
}
  // 删除所有
  if($action == 'foodDeleteByIds' && $ids){
    $ids = json_decode($ids,true);// 将字符串转为数组，方便操作 
    $sql = "delete from {$pre}food_cate where cate_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
if($action=="foodCateDelete"){
    $sql= "delete from {$pre}food_cate where cate_id = {$id}";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
if($action =='foodCateAdd'){
    if($_POST){
        $cate_name= isset($_POST['cate_name']) && !empty($_POST['cate_name']) ? trim($_POST['cate_name']):'';
    
        $data=array(
            'cate_name'=>$cate_name
        );
        if(!$id){
            $result=add("food_cate",$data);
            if($result){
                echo_json(1,'添加成功');
            }else{
                echo_json(0,'添加失败');
            }
        }else{
            $result = update("food_cate", $data, "where cate_id=${id}");
			if($result) {
				echo_json(1, '编辑成功');
			}else{
				echo_json(0, '编辑失败');
			}
        }
       
    }
}
 
?>