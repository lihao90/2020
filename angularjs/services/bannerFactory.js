
app.factory('Banner', function ($http) {
	API = '../api/admin/banner.php?action='

	return {
		get: function(id){ 
			return $http.get( `${API}bannerOne&id=${id}` ) 
		},
		query: function() {
			return $http.get( `${API}banner` )
		},
		page: function(limit, offset){
			return $http.get( `${API}banner&limit=${limit}&offset=${offset}` ) // promise
		},
		count: function() {
			return $http.get( `${API}bannerCount` )
		},
		delete: function(id) {
			return $http.get(`${API}bannerDelete&id=${id}`)
		},
		deleteByIds: function(ids) {
			return $http.get(`${API}bannerDeleteByIds&ids=${ids}`)
		},
		save: function(data) {
			return  $http.post( `${API}bannerAdd`,data )
		},
		update: function(data, id) { // 编辑
			return $http.post( `${API}bannerAdd&id=${id}`, data )
		}
	};
})