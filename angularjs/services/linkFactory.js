
app.factory('Link', function ($http) {
	API = '../api/admin/link.php?action='

	return {
		get: function(id){ 
			return $http.get( `${API}linkOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}link` )
		},
		page: function(limit, offset){
			return $http.get( `${API}link&limit=${limit}&offset=${offset}` ) // promise
		},
		count: function() {
			return $http.get( `${API}linkCount` )
		},
		delete: function(id) {
			return $http.get(`${API}linkDelete&id=${id}`)
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}linkDeleteByIds&ids=${ids}`)
		},
		save: function(data) {
			return  $http.post( `${API}linkAdd`,data )
		},
		update: function(data, id) { // 编辑
			return $http.post( `${API}linkAdd&id=${id}`, data )
		}
	};
})