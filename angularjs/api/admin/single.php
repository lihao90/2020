<?php
include_once('../lib/config.php');
$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : '';
// $limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] :2;
// $offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] :0;

if($action =='single'){
    $sql = "select * from {$pre}single_page order by single_id desc";
    $data = getAll($sql);
    foreach($data as $key=>$value){
        $data[$key]['content_cut'] = cutstr($value['content'], 0, 35, '...');
     }
    echo json_encode($data);die;
}

if($action == 'singleOne') {
    $sql = "select * from {$pre}single_page where single_id={$id}";
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
  if($action == 'singleDeleteByIds' && $ids){
    $ids = json_decode($ids,true);// 将字符串转为数组，方便操作 
    $sql = "delete from {$pre}single_page where single_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}
// 删除一条
if($action == 'singleDelete' && $id){
     $sql = "delete from {$pre}single_page where single_id = {$id}";
     $result = delete($sql);
     if($result){
         echo_json(1,'删除成功');
     }else{
         echo_json(0,'删除失败');
     }
 }

if($action =='singleAdd'){
    if($_POST){
        $title= isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']):'';
        $content= isset($_POST['content']) && !empty($_POST['content']) ? trim($_POST['content']):'';
    
        $data=array(
            'title'=>$title,
            'content'=>$content
        );
        if(!$id){
            $result=add("single_page",$data);
            if($result){
                echo_json(1,'添加成功');
            }else{
                echo_json(0,'添加失败');
            }
        }else{
            $result = update("single_page", $data, "where single_id=${id}");
			if($result) {
				echo_json(1, '编辑成功');
			}else{
				echo_json(0, '编辑失败');
			}
        }
       
    }
}
 
?>