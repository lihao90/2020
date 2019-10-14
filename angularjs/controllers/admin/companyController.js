app.controller('companyCtrl',function($scope,Form,Company,$state){
    $scope.slt = ''
    // 正反选
    Form.checkedAction($scope,'.ids')
    Company.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
    // 删除一条
	$scope.del = function(id) { 
		Company.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
            Company.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.company')
            })
        }
})

app.controller('companyAddCtrl',function($scope,Company,$state,$stateParams,Upload){
//设置是否推荐默认值
$scope.company={}
$scope.id=$stateParams.id;
console.log($scope.id);
 // 展示功能  // 获取分类
 Company.query().then(function(result){
    if(result.status==200){
        // 查一条美食
        if($stateParams.id) {
            console.log($stateParams.id)
            Company.get($stateParams.id).then(function(result){
                console.log(result)
                if(result.status == 200) { 
                    $scope.company = result.data
                    $scope.company.oldpic = result.data.pic
					console.log($scope.company)
                }
            })
        }
    }
})
// 公司id company_id
// 	公司名称 title
// 	图片 pic 
// 	电话 phone
// 	传真 tel 
// 	邮编 postal_code
// 	地址 address
// 添加功能
$scope.save = function() {
    var data = {
        title: $scope.company.title,
        phone: $scope.company.phone,
        tel: $scope.company.tel,
        postal_code: $scope.company.postal_code,
        address:$scope.company.address,
    }
    if($scope.company.pic) {
        // 物理上传
        Upload.upload({
            url: '../api/admin/company.php?action=fileUpload',
            data: {file: $scope.company.pic}
        }).then(function(resp){
            console.log(resp)
            if(resp.data.code) {
                $scope.company.pic = resp.data.msg
                data.pic = resp.data.msg
                data.oldpic = $scope.company.oldpic
                if(!$scope.id) {
                    console.log(111);
                    Company.save(data).then(function(result){
                        console.log(result)
                        if(result.status == 200) {
                            if(result.data.code == 1) {
                                alert(result.data.msg);
                                $state.go('admin.company')
                            }else{
                                $state.reload()
                            }
                        }
                    })
                }else{
                    Company.update(data, $scope.id).then(function(result){
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
            console.log(111);
            Company.save(data).then(function(result){
                console.log(result)
                if(result.status == 200) {
                    if(result.data.code == 1) {
                        alert(result.data.msg);
                        $state.go('admin.company')
                    }else{
                        $state.reload()
                    }
                }
            })
        }else{
            Company.update(data, $scope.id).then(function(result){
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