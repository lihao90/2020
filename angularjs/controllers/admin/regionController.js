app.controller('regionCtrl',function($scope,Region,$state,Form){
    $scope.slt = '' 
    //正反选
    Form.checkedAction($scope,'.ids');
    Region.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    $scope.del = function(id) { 
		Region.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
        Region.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.region')
            })
        }
})

app.controller('regionAddCtrl',function($scope,Region,$state,$stateParams){
    $scope.region={}
    $scope.id=$stateParams.id;
    console.log($scope.id)
     if($stateParams.id) {
        console.log($stateParams.id)
        Region.get($stateParams.id).then(function(result){
            if(result.status == 200) { 
                $scope.region = result.data
                console.log($scope.region)
            }
        })
    }
    $scope.save = function() {
        var data = {
            region_name: $scope.region.region_name,
        }
        if(!$scope.id) {
            Region.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.region')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Region.update(data, $scope.id).then(function(result){
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