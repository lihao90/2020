app.controller('foodcateCtrl',function($scope,FoodCate,$state,Form){
    $scope.slt = '' 
    //正反选
    Form.checkedAction($scope,'.ids');
    FoodCate.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    $scope.del = function(id) { 
		FoodCate.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
            FoodCate.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.foodcate')
            })
        }
})
app.controller('foodcateAddCtrl',function($scope,FoodCate,$state,$stateParams){
    $scope.foodcate={}
    $scope.id=$stateParams.id;
    console.log($scope.id)
     // 查一条美食
     if($stateParams.id) {
        console.log($stateParams.id)
        FoodCate.get($stateParams.id).then(function(result){
            if(result.status == 200) { 
                $scope.foodcate = result.data
                $scope.foodcate.oldpic = result.data.pic
                console.log($scope.foodcate)
            }
        })
    }
    $scope.save = function() {
        var data = {
            cate_name: $scope.foodcate.cate_name,
        }
        if(!$scope.id) {
            FoodCate.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.foodcate')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            FoodCate.update(data, $scope.id).then(function(result){
                console.log(data)
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
})