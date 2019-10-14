app.controller('linkCtrl',function($scope,Form,Link,$state){
    $scope.slt = ''
    // 正反选
    Form.checkedAction($scope,'.ids')
    Link.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    // 删除一条
	$scope.del = function(id) { 
		Link.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
    var idsJson= Form.checkedValToJson('.ids')
    Link.deleteByIds(idsJson).then(function(result){
            console.log(result)
            alert(result.data.msg);
            //跳转到列表页
            $state.reload('admin.link')
        })
    }
})

app.controller('linkAddCtrl',function($scope,Link,$state,$stateParams,Upload){
//设置是否推荐默认值
$scope.link={}
$scope.id=$stateParams.id;
console.log($scope.id);
 // 展示功能  // 获取分类
 Link.query().then(function(result){
    if(result.status==200){
        // 查一条美食
        if($stateParams.id) {
            console.log($stateParams.id)
            Link.get($stateParams.id).then(function(result){
                console.log(result)
                if(result.status == 200) { 
                    $scope.link = result.data
                    $scope.link.oldpic = result.data.pic
					console.log($scope.link)
                }
            })
        }
    }
})
// 添加功能
$scope.save = function() {
    var data = {
        title: $scope.link.title,
    }
    if($scope.link.pic) {
        // 物理上传
        Upload.upload({
            url: '../api/admin/link.php?action=fileUpload',
            data: {file: $scope.link.pic}
        }).then(function(resp){
            console.log(resp)
            if(resp.data.code) {
                $scope.link.pic = resp.data.msg
                data.pic = resp.data.msg
                data.oldpic = $scope.link.oldpic
                if(!$scope.id) {
                    console.log(111);
                    Link.save(data).then(function(result){
                        console.log(result)
                        if(result.status == 200) {
                            if(result.data.code == 1) {
                                alert(result.data.msg);
                                $state.go('admin.link')
                            }else{
                                $state.reload()
                            }
                        }
                    })
                }else{
                    Link.update(data, $scope.id).then(function(result){
                        console.log(result)
                        if(result.status == 200) {
                            if(result.data.code == 1) {
                                alert(result.data.msg);
                                $state.reload()
                            }else{
                                alert(result.data.msg);
                            }
                        }
                    })
                }
            }else{
                alert('上传图片失败')
                return false;
            }
        })
    }else{
        if(!$scope.id) {
            Link.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.link')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Link.update(data, $scope.id).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.reload()
                    }else{
                        alert(result.data.msg);
                    }
                }
            })
        }
    }
  } 
})