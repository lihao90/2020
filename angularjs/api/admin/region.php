<?php
include_once('../lib/config.php');
$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : '';
// $limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] :2;
// $offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] :0;

if($action =='region'){
    $sql = "select * from {$pre}region order by region_id desc";
    $data = getAll($sql);
    echo json_encode($data);die;
}

if($action == 'regionOne') {
    $sql = "select * from {$pre}region where region_id={$id}";
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
  if($action == 'regionDeleteByIds' && $ids){
    $ids = json_decode($ids,true);// 将字符串转为数组，方便操作 
    $sql = "delete from {$pre}region where region_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
// 删除一条
if($action == 'regionDelete' && $id){
     $sql = "delete from {$pre}region where region_id = {$id}";
     $result = delete($sql);
     if($result){
         echo_json(1,'删除成功');
     }else{
         echo_json(0,'删除失败');
     }
 }

if($action =='regionAdd'){
    if($_POST){
        $region_name= isset($_POST['region_name']) && !empty($_POST['region_name']) ? trim($_POST['region_name']):'';
    
        $data=array(
            'region_name'=>$region_name
        );
        if(!$id){
            $result=add("region",$data);
            if($result){
                echo_json(1,'添加成功');
            }else{
                echo_json(0,'添加失败');
            }
        }else{
            $result = update("region", $data, "where region_id=${id}");
			if($result) {
				echo_json(1, '编辑成功');
			}else{
				echo_json(0, '编辑失败');
			}
        }
       
    }
}
 
?>