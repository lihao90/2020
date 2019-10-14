app.controller('newsCtrl',function($scope,News,$state,Form){
    $scope.slt = '' 
    //正反选
    Form.checkedAction($scope,'.ids');
    News.query().then(function(result){
        console.log(result);
        if(result.status == 200) {
			$scope.data = result.data;
		}
    })
      // 删除一条
	$scope.del = function(id) { 
		News.delete(id).then(function(result){
			if(result.status == 200) {
				alert(result.data.msg)
				$state.reload()
			}
		})
    }
    // 删除所有选中的
    $scope.delAll=function(){
        var idsJson= Form.checkedValToJson('.ids')
            News.deleteByIds(idsJson).then(function(result){
                console.log(result)
                alert(result.data.msg);
                //跳转到列表页
                $state.reload('admin.news')
            })
        }
})
app.controller('newsAddCtrl',function($scope,News,$state,$stateParams,Upload){
    //设置是否推荐默认值
$scope.news={}
$scope.id=$stateParams.id;
console.log($scope.id);
 // 展示功能  // 获取分类
 News.query().then(function(result){
    if(result.status==200){
        // 查一条美食
        if($stateParams.id) {
            console.log($stateParams.id)
            News.get($stateParams.id).then(function(result){
                console.log(result)
                if(result.status == 200) { 
                    $scope.news = result.data
                    $scope.news.oldpic = result.data.pic
					console.log($scope.news)
                }
            })
        }
    }
})
    $scope.save=function(){
        var data={
            title:$scope.news.title,
            description:$scope.news.description,
            create_time:$scope.news.create_time,
            content:$scope.news.content,
            pic:$scope.news.pic

        }
        if($scope.news.pic){
            Upload.upload({
                url:'../api/admin/news.php?action=fileUpload',
                data:{file:$scope.news.pic}
            }).then(function(resp){
                console.log(resp)
                if(resp.data.code) {
                    $scope.news.pic = resp.data.msg
                    data.pic = resp.data.msg
                    data.oldpic = $scope.news.oldpic
                    if(!$scope.id) {
                        News.save(data).then(function(result){
                            console.log(result)
                            if(result.status == 200) {
                                if(result.data.code == 1) {
                                    alert(result.data.msg);
                                    // $state 状态管理不是地址/admin/food
                                    $state.go('admin.news')
                                }else{
                                    $state.reload()
                                }
                            }
                        })
                  }else{
                    News.update(data, $scope.id).then(function(result){
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
                News.save(data).then(function(result){
                    console.log(result)
                    if(result.status == 200) {
                        if(result.data.code == 1) {
                            alert(result.data.msg);
                            // $state 状态管理不是地址/admin/food
                            $state.go('admin.news')
                        }else{
                            $state.reload()
                        }
                    }
                })
              }else{
                News.update(data, $scope.id).then(function(result){
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