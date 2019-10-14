app.factory('Nav', function ($http) {
	var API = '../api/admin/nav.php?action='

	return {
		get: function(id){
			return $http.get( `${API}navOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}nav` )
		},
		homenav: function(limit) {
			return $http.get( `${API}homenav&limit=${limit}` )
		},
		// page: function(limit, offset){
		// 	return $http.get( `${API}foodCate&limit=${limit}&offset=${offset}` ) // promise
		// },
		// count: function() {
		// 	return $http.get( `${API}foodCateCount` )
		// },
		deleteByIds: function(ids) {
			return $http.get(`${API}navDeleteByIds&ids=${ids}`)
		},
		delete: function(id) {
			return $http.get(`${API}navDelete&id=${id}`)
		},
		save: function(data) {
			return $http.post( `${API}navAdd`,data )
		},
		update: function(data, id) { 
			return $http.post( `${API}navAdd&id=${id}`, data )
		}
	}
})