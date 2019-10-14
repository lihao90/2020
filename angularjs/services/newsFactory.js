app .factory('News',function($http){
    var API='../api/admin/news.php?action='
    return{
        get: function(id){ // 查询一条
			return $http.get( `${API}newsOne&id=${id}` ) // promise
		},
        query:function(){
            return $http.get(`${API}news`)
        },
        delete: function(id) {
			return $http.get(`${API}newsDelete&id=${id}`)
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}newsDeleteByIds&ids=${ids}`)
		},
        save:function(data){
            return $http.post(`${API}newsAdd`,data)
        },
        update:function(data,id){
            return $http.post(`${API}newsAdd&id=${id}`,data)
        }
    }
})