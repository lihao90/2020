app.factory('Setting', function ($http) {
	var API = '../api/admin/setting.php?action='

	return {
		get: function(id){
			return $http.get( `${API}settingOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}setting` )
		},
		page: function(limit, offset){
			return $http.get( `${API}setting&limit=${limit}&offset=${offset}` ) // promise
		},
		// count: function() {
		// 	return $http.get( `${API}settingCount` )
		// },
		deleteByIds: function(ids) {
			return $http.get(`${API}settingDeleteByIds&ids=${ids}`)
		},
		delete: function(id) {
			return $http.get(`${API}settingDelete&id=${id}`)
		},
		save: function(data) {
			return $http.post( `${API}settingAdd`,data )
		},
		update: function(data, id) { 
			return $http.post( `${API}settingAdd&id=${id}`, data )
		}
	}
})