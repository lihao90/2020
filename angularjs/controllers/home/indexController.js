app.controller('indexCtrl',function($scope,Nav,Company){
	$scope.limit = 6;
    Nav.query().then(function(result){
		$scope.indexNav = result.data
		console.log($scope.indexNav)
	})

	Company.query().then(function(result){
		console.log(result);
		$scope.indexComp = result.data;
	})
    
})