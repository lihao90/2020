app.controller('shopCtrl',function($scope,Shop){

	Shop.query().then(function(result){
		$scope.indexShop = result.data;
	})
    
})