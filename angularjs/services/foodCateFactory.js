app.factory('FoodCate', function ($http) {
	var API = '../api/admin/foodcate.php?action='

	return {
		get: function(id){
			return $http.get( `${API}foodCateOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}foodCate` )
		},
		page: function(limit, offset){
			return $http.get( `${API}foodCate&limit=${limit}&offset=${offset}` ) // promise
		},
		save: function(data) {
			return $http.post( `${API}foodCateAdd`,data )
		},
		count: function() {
			return $http.get( `${API}foodCateCount` )
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}foodDeleteByIds&ids=${ids}`)
		},
		delete: function(id) {
			return $http.get(`${API}foodCateDelete&id=${id}`)
		},
		update: function(data, id) { 
			return $http.post( `${API}foodCateAdd&id=${id}`, data )
		}
	}
})