app.controller('singleCtrl',function($scope,Single,$state,Form){
    $scope.slt = '' 
    //正反选
    Form.checkedAction($scope,'.ids');
    Single.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    $scope.del = function(id) { 
		Single.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
        Single.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.single')
            })
        }
})

app.controller('singleAddCtrl',function($scope,Single,$state,$stateParams){
    $scope.single={}
    $scope.id=$stateParams.id;
    console.log($scope.id)
     if($stateParams.id) {
        console.log($stateParams.id)
        Single.get($stateParams.id).then(function(result){
            if(result.status == 200) { 
                $scope.single = result.data
                console.log($scope.single)
            }
        })
    }
    $scope.save = function() {
        var data = {
            title: $scope.single.title,
            content: $scope.single.content,
        }
        if(!$scope.id) {
            Single.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.single')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Single.update(data, $scope.id).then(function(result){
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