app.controller('shopCtrl',function($scope,Form,Shop,$state){
    $scope.slt = ''
    // 正反选
    Form.checkedAction($scope,'.ids')
    Shop.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    // 删除一条
	$scope.del = function(id) { 
		Shop.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
    var idsJson= Form.checkedValToJson('.ids')
        Shop.deleteByIds(idsJson).then(function(result){
            console.log(result)
            alert(result.data.msg);
            //跳转到列表页
            $state.reload('admin.shop')
        })
    }
})

app.controller('shopAddCtrl',function($scope,Shop,$state,$stateParams,Upload){
//设置是否推荐默认值
$scope.shop={}
$scope.id=$stateParams.id;
console.log($scope.id);
 // 展示功能  // 获取分类
 Shop.query().then(function(result){
    if(result.status==200){
        // 查一条美食
        if($stateParams.id) {
            console.log($stateParams.id)
            Shop.get($stateParams.id).then(function(result){
                console.log(result)
                if(result.status == 200) { 
                    $scope.shop = result.data
                    $scope.shop.oldpic = result.data.pic
					console.log($scope.shop)
                }
            })
        }
    }
})
// 添加功能
$scope.save = function() {
    var data = {
        title: $scope.shop.title,
        dishes: $scope.shop.dishes,
        address: $scope.shop.address,
        region_id: $scope.shop.region_id,
        business_time:$scope.shop.business_time,
        tag: $scope.shop.tag
    }
    if($scope.shop.pic) {
        // 物理上传
        Upload.upload({
            url: '../api/admin/shop.php?action=fileUpload',
            data: {file: $scope.shop.pic}
        }).then(function(resp){
            console.log(resp)
            if(resp.data.code) {
                $scope.shop.pic = resp.data.msg
                data.pic = resp.data.msg
                data.oldpic = $scope.shop.oldpic
                if(!$scope.id) {
                    console.log(111);
                    Shop.save(data).then(function(result){
                        console.log(result)
                        if(result.status == 200) {
                            if(result.data.code == 1) {
                                alert(result.data.msg);
                                $state.go('admin.shop')
                            }else{
                                $state.reload()
                            }
                        }
                    })
                }else{
                    Shop.update(data, $scope.id).then(function(result){
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
            Shop.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.shop')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Shop.update(data, $scope.id).then(function(result){
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