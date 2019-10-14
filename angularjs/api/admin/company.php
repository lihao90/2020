<?php
include_once('../lib/config.php');

$action=isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] :'';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;
if($action == 'company'){
    $sql ="select * from {$pre}company order by company_id desc";
    $data =getAll($sql);
    echo json_encode($data);die;
}
if($action == 'companyOne'){
    $sql = "select * from {$pre}company where company_id={$id}";
    $data = getOne($sql);
    echo json_encode($data);die;
}

 if($action == 'companyDeleteByIds' && $ids){
    $ids = json_decode($ids,true);
    $sql= "select pic from f_company where company_id in(${ids['ids']})";
    $pic=getAll($sql);
    foreach ($pic as $key => $value) {
        $oldpic= str_replace(HTTP, ROOT,$value['pic']);
        unlink($oldpic);
    }
    $sql = "delete from {$pre}company where company_id in (${ids['ids']})";
    $result = delete($sql);
    if($result){
        echo_json(1,'删除成功');
    }else{
        echo_json(0,'删除失败');
    }
}

if($action == 'companyDelete' && $id){
    $sqls= "select pic from f_company where company_id = {$id}";
     $pic=getOne($sqls);
     $oldpic= str_replace(HTTP, ROOT, $pic['pic']);
     unlink($oldpic);
     $sqld = "delete from {$pre}company where company_id = {$id}";
     $result = delete($sqld);
     if($result){
         echo_json(1,'删除成功');
     }else{
         echo_json(0,'删除失败');
     }
 }

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
if($action == 'companyAdd'){
    if($_POST){
        $title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
        $phone = isset($_POST['phone']) && !empty($_POST['phone']) ? trim($_POST['phone']) : '';
        $tel = isset($_POST['tel']) && !empty($_POST['tel']) ?trim($_POST['tel']) : '';
        $postal_code = isset($_POST['postal_code']) && !empty($_POST['postal_code']) ? intval($_POST['postal_code']) : '';
        $address = isset($_POST['address']) && !empty($_POST['address']) ? trim($_POST['address']) : '';
        $pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
        $oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
        $data = array(
            'title' => $title,
            'phone' => $phone,
            'tel' => $tel,
            'postal_code' => $postal_code,
            'address'=>$address,
            'pic' => $pic
        );
        if(!$id){
            $result = add("company",$data);
            if($result){
                echo_json(1,'添加成功');
                
            }else{
                echo_json(0,'添加失败');
            }
        }else{
               
            if($pic && $oldpic && $pic !=$oldpic){
                $oldpic =str_replace(HTTP,ROOT,$oldpic);
                unlink($oldpic);
            }
            $result = update("company",$data,"where company_id=${id}");
            if($result){
               echo_json(1,'编辑成功');
                
            }else{
                echo_json(0,'编辑失败');
            }
        }
    }
}