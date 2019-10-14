app.factory('Single', function ($http) {
	var API = '../api/admin/single.php?action='

	return {
		get: function(id){
			return $http.get( `${API}singleOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}single` )
		},
		// page: function(limit, offset){
		// 	return $http.get( `${API}foodCate&limit=${limit}&offset=${offset}` ) // promise
		// },
		// count: function() {
		// 	return $http.get( `${API}foodCateCount` )
		// },
		deleteByIds: function(ids) {
			return $http.get(`${API}singleDeleteByIds&ids=${ids}`)
		},
		delete: function(id) {
			return $http.get(`${API}singleDelete&id=${id}`)
		},
		save: function(data) {
			return $http.post( `${API}singleAdd`,data )
		},
		update: function(data, id) { 
			return $http.post( `${API}singleAdd&id=${id}`, data )
		}
	}
})