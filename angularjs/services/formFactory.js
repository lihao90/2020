app.factory('Form', function () {
	return {
		checkedAction: function($scope,classStr) {
            $scope.sltAll=function(){
                $(classStr).prop('checked',true)
             }
             $scope.cancel=function(){
                $(classStr).prop('checked',false)
            }
            $scope.reverse=function(){
               $(classStr).prop('checked',function(k,v){
                   return !v;
               })
            }
        },
        checkedValToJson:function(cl){
             // 数组好操作 {"ids":["5","4","3","2","1"]}
        var idsArr=[];
        $.each($(cl),function(i,v){
            if($(v).prop('checked')){
                idsArr.push($(v).val())
            }
        })

       // 为了最终格式化为json字符串，方便地址栏上传递数据
		// 这里将数组装入对象中
        idsStr=idsArr.join(',')
                
        var idsobj={ids:idsStr}// {"ids":"5,4,3,2,1"}
        // idsJson=angular.toJson(idsobj)
        // 转为json传参请求后台API
        idsJson=JSON.stringify(idsobj) 
        return   idsJson;
        }
		
	};
})