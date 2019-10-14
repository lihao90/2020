app.controller('newsCtrl',function($scope,News){

	News.query().then(function(result){
		$scope.indexNews = result.data;
	})
    
})