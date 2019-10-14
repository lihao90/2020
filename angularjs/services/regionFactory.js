app.factory('Region', function ($http) {
	var API = '../api/admin/region.php?action='

	return {
		get: function(id){
			return $http.get( `${API}regionOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}region` )
		},
		// page: function(limit, offset){
		// 	return $http.get( `${API}foodCate&limit=${limit}&offset=${offset}` ) // promise
		// },
		// count: function() {
		// 	return $http.get( `${API}foodCateCount` )
		// },
		deleteByIds: function(ids) {
			return $http.get(`${API}regionDeleteByIds&ids=${ids}`)
		},
		delete: function(id) {
			return $http.get(`${API}regionDelete&id=${id}`)
		},
		save: function(data) {
			return $http.post( `${API}regionAdd`,data )
		},
		update: function(data, id) { 
			return $http.post( `${API}regionAdd&id=${id}`, data )
		}
	}
})