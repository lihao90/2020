app.controller('navCtrl',function($scope,Nav,$state,Form){
    $scope.slt = '' 
    //正反选
    Form.checkedAction($scope,'.ids');
    Nav.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    $scope.del = function(id) { 
		Nav.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
        Nav.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.nav')
            })
        }
})

app.controller('navAddCtrl',function($scope,Nav,$state,$stateParams){
    $scope.nav={}
    $scope.id=$stateParams.id;
    console.log($scope.id)
     if($stateParams.id) {
        console.log($stateParams.id)
        Nav.get($stateParams.id).then(function(result){
            if(result.status == 200) { 
                $scope.nav = result.data
                console.log($scope.nav)
            }
        })
    }
    $scope.save = function() {
        var data = {
            title: $scope.nav.title,
            link: $scope.nav.link,
        }
        if(!$scope.id) {
            Nav.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.nav')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Nav.update(data, $scope.id).then(function(result){
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