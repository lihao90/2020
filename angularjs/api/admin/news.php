<?php
include_once('../lib/config.php');
$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;


if($action == 'news'){
    $sql ="select * from {$pre}news  order by news_id desc";
    $data =getAll($sql);
    foreach($data as $key=>$value){
        $data[$key]['description_cut'] = cutstr($value['description'], 0, 15, '...');
     }
    echo json_encode($data);die;
}
if($action == 'newsOne'){
    $sql = "select * from {$pre}news where news_id={$id}";
    $data = getOne($sql);
    echo json_encode($data);die;
}
// 删除所有
if($action == 'newsDeleteByIds' && $ids){
    $ids = json_decode($ids,true);
    $sql= "select pic from f_news where news_id in (${ids['ids']})";
    $pic=getAll($sql);
    foreach ($pic as $key => $value) {
        $oldpic= str_replace(HTTP, ROOT,$value['pic']);
        unlink($oldpic);
    }
    $sql = "delete from {$pre}news where news_id in (${ids['ids']})";

    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}

// 删除一条
if($action == 'newsDelete' && $id){
   $sqls= "select pic from f_news where news_id = {$id}";
    $pic=getOne($sqls);
    $oldpic= str_replace(HTTP, ROOT, $pic['pic']);
    unlink($oldpic);
    $sqld = "delete from {$pre}news where news_id = {$id}";
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

if($action=='newsAdd'){
    if($_POST){
        $title=isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
        $description=isset($_POST['description']) && !empty($_POST['description']) ? trim($_POST['description']) : '';
        $create_time=isset($_POST['create_time']) && !empty($_POST['create_time']) ? trim($_POST['create_time']) : '';
        $content=isset($_POST['content']) && !empty($_POST['content']) ? trim($_POST['content']) : '';
        $pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
        $oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
        $data=array(
            'title'=>$title,
            'description'=>$description,
            'create_time'=>$create_time,
            'content'=>$content,
            'pic'=>$pic
        );
        if(!$id){
            $result=add('news',$data);
            if($result){
                echo_json(1,'添加成功');
            }else{
                echo_json(0,'添加失败');
            }
        }else{
            $result=update('news',$data,"where news_id=${id}");
            if($result){
                echo_json(1,'编辑成功');
            }else{
                echo_json(0,'编辑失败');
            }
        }
       
    }
}
?>