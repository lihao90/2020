app.controller('bannerCtrl',function($scope,Form,Banner,$state){
    $scope.slt = ''
    // 正反选
    Form.checkedAction($scope,'.ids')
    Banner.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    // 删除一条
	$scope.del = function(id) { 
		Banner.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
    var idsJson= Form.checkedValToJson('.ids')
    Banner.deleteByIds(idsJson).then(function(result){
            console.log(result)
            alert(result.data.msg);
            //跳转到列表页
            $state.reload('admin.banner')
        })
    }
})

app.controller('bannerAddCtrl',function($scope,Banner,$state,$stateParams,Upload){
//设置是否推荐默认值
$scope.banner={}
$scope.id=$stateParams.id;
console.log($scope.id);
 // 展示功能  // 获取分类
 Banner.query().then(function(result){
    if(result.status==200){
        // 查一条美食
        if($stateParams.id) {
            console.log($stateParams.id)
            Banner.get($stateParams.id).then(function(result){
                console.log(result)
                if(result.status == 200) { 
                    $scope.banner = result.data
                    $scope.banner.oldpic = result.data.pic
					console.log($scope.banner)
                }
            })
        }
    }
})
// 添加功能
$scope.save = function() {
    var data = {
        title: $scope.banner.title,
        link: $scope.banner.link,
    }
    if($scope.banner.pic) {
        // 物理上传
        Upload.upload({
            url: '../api/admin/Banner.php?action=fileUpload',
            data: {file: $scope.banner.pic}
        }).then(function(resp){
            console.log(resp)
            if(resp.data.code) {
                $scope.banner.pic = resp.data.msg
                data.pic = resp.data.msg
                data.oldpic = $scope.banner.oldpic
                if(!$scope.id) {
                    console.log(111);
                    Banner.save(data).then(function(result){
                        console.log(result)
                        if(result.status == 200) {
                            if(result.data.code == 1) {
                                alert(result.data.msg);
                                $state.go('admin.banner')
                            }else{
                                $state.reload()
                            }
                        }
                    })
                }else{
                    Banner.update(data, $scope.id).then(function(result){
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
           Banner.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.banner')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
           Banner.update(data, $scope.id).then(function(result){
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