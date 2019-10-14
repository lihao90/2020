app.controller('settingCtrl',function($scope,Setting,$state,Form){
    $scope.slt = '' 
    //正反选
    Form.checkedAction($scope,'.ids');
    Setting.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
            $scope.data = result.data;
            console.log($scope.data );
		}
    })
    $scope.del = function(id) { 
		Setting.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
        Setting.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.setting')
            })
        }
})

app.controller('settingAddCtrl',function($scope,Setting,$state,$stateParams){
    $scope.setting={}
    $scope.id=$stateParams.id;
    console.log($scope.id)
     if($stateParams.id) {
        console.log($stateParams.id)
        Setting.get($stateParams.id).then(function(result){
            if(result.status == 200) { 
                $scope.setting = result.data
                console.log($scope.setting)
            }
        })
    }
    $scope.save = function() {
        var data = {
            setting_name: $scope.setting.setting_name,
            setting_value: $scope.setting.setting_value,
        }
        console.log(data);
        if(!$scope.id) {
            Setting.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.setting')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Setting.update(data, $scope.id).then(function(result){
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