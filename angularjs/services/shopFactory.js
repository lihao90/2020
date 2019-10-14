
app.factory('Shop', function ($http) {
	API = '../api/admin/shop.php?action='

	return {
		get: function(id){ 
			return $http.get( `${API}shopOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}shop` )
		},
		page: function(limit, offset){
			return $http.get( `${API}shop&limit=${limit}&offset=${offset}` ) // promise
		},
		count: function() {
			return $http.get( `${API}shopCount` )
		},
		delete: function(id) {
			return $http.get(`${API}shopDelete&id=${id}`)
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}shopDeleteByIds&ids=${ids}`)
		},
		save: function(data) {
			return  $http.post( `${API}shopAdd`,data )
		},
		update: function(data, id) { // 编辑
			return $http.post( `${API}shopAdd&id=${id}`, data )
		}
	};
})