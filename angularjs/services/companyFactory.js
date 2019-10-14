
app.factory('Company', function ($http) {
	API = '../api/admin/company.php?action='

	return {
		get: function(id){ 
			return $http.get( `${API}companyOne&id=${id}`) 
		},
		query: function() {
			return $http.get( `${API}company`)
		},
		page: function(limit, offset){
			return $http.get( `${API}company&limit=${limit}&offset=${offset}` ) // promise
		},
		count: function() {
			return $http.get( `${API}companyCount`)
		},
		delete: function(id) {
			return $http.get(`${API}companyDelete&id=${id}`)
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}companyDeleteByIds&ids=${ids}`)
		},
		save: function(data) {
			return  $http.post( `${API}companyAdd`,data)
		},
		update: function(data, id) { // 编辑
			return $http.post( `${API}companyAdd&id=${id}`, data)
		}
	};
})