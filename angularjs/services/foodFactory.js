app.factory('Food', function ($http) {
	var API = '../api/admin/food.php?action='

	return {
		get: function(id){ // 查询一条
			return $http.get( `${API}foodOne&id=${id}` ) // promise
		},
		query: function() {
			return $http.get( `${API}food` )
		},
		page: function(limit, offset){
			return $http.get( `${API}food&limit=${limit}&offset=${offset}` ) // promise
		},
		count: function() {
			return $http.get( `${API}foodCount` )
		},
		delete: function(id) {
			return $http.get(`${API}foodDelete&id=${id}`)
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}foodDeleteByIds&ids=${ids}`)
		},
		save: function(data) {
			return $http.post( `${API}foodAdd`,data )
		},
		update: function(data, id) { // 编辑
			return $http.post( `${API}foodAdd&id=${id}`, data )
		}
	};
})