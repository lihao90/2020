app.controller('foodCtrl',function($scope,Food){

	Food.query().then(function(result){
		$scope.indexFood = result.data;
	})
    
})