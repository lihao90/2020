app.controller('singleCtrl',function($scope,Single){

	Single.query().then(function(result){
		$scope.indexSin = result.data[0];
	})
    
}).filter('trustHtml',['$sce',function($sce){

    return function(data){

        return $sce.trustAsHtml(data);

    }

}]);