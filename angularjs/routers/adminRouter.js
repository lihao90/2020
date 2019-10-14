app.config(function($httpProvider,$stateProvider,$urlRouterProvider){
    $httpProvider.defaults.transformRequest=function(obj){
        var arr=[]
        for(var i in obj){
            arr.push(i+ "="+ obj[i])
        }
        return arr.join("&");
    }
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

    $urlRouterProvider.when('','/admin');
    $stateProvider
    .state({
        name:'admin',
        url:'/admin',
        views:{
            'header':{
                templateUrl:"../views/admin/public/header.html"
            },
            'sidebar':{
                templateUrl:"../views/admin/public/sidebar.html",
                controller: 'adminCtrl'
            },
            'content':{
                templateUrl:"../views/admin/admin-index.html",
                controller: 'adminCtrl'
            },
            'footer':{
                templateUrl:"../views/admin/public/footer.html"
            },
        }
    })

     .state({
        name:'admin.food',
        url:'/food',
        views:{
            'content@':{
                templateUrl:"../views/admin/food.html",
                controller: 'foodCtrl'
            },
        }
    })
    .state({
        name:'admin.food.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/food_add_edit.html",
                controller: 'foodAddCtrl'
            },
        }
    })
    .state({
        name: 'admin.food.edit',
		url: '/edit/:id',
		views: {
			'content@': {
				templateUrl: '../views/admin/food_add_edit.html',
				controller: 'foodAddCtrl'
			} 
		}
    })
    .state({
        name:'admin.foodcate',
        url:'/foodcate',
        views:{
            'content@':{
                templateUrl:"../views/admin/foodcate.html",
                controller: 'foodcateCtrl'
            },
        }
    })
    .state({
        name:'admin.foodcate.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/foodcate_add_edit.html",
                controller: 'foodcateAddCtrl'
            },
        }
    })
    .state({
        name:'admin.foodcate.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/foodcate_add_edit.html",
                controller: 'foodcateAddCtrl'
            },
        }
    })
    .state({
        name:'admin.shop',
        url:'/shop',
        views:{
            'content@':{
                templateUrl:"../views/admin/shop.html",
                controller: 'shopCtrl'
            },
        }
    })
    .state({
        name:'admin.shop.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/shop_add_edit.html",
                controller: 'shopAddCtrl'
            },
        }
    })
    .state({
        name:'admin.shop.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/shop_add_edit.html",
                controller: 'shopAddCtrl'
            },
        }
    })
    .state({
        name:'admin.region',
        url:'/region',
        views:{
            'content@':{
                templateUrl:"../views/admin/region.html",
                controller: 'regionCtrl'
            },
        }
    })
    .state({
        name:'admin.region.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/region_add_edit.html",
                controller: 'regionAddCtrl'
            },
        }
    })
    .state({
        name:'admin.region.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/region_add_edit.html",
                controller: 'regionAddCtrl'
            },
        }
    })
    .state({
        name:'admin.news',
        url:'/news',
        views:{
            'content@':{
                templateUrl:"../views/admin/news.html",
                controller: 'newsCtrl'
            },
        }
    })
    .state({
        name:'admin.news.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/news_add_edit.html",
                controller: 'newsAddCtrl'
            },
        }
    })
    .state({
        name:'admin.news.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/news_add_edit.html",
                controller: 'newsAddCtrl'
            },
        }
    })
   
    .state({
        name:'admin.company',
        url:'/company',
        views:{
            'content@':{
                templateUrl:"../views/admin/company.html",
                controller: 'companyCtrl'
            },
        }
    })
    .state({
        name:'admin.company.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/company_add_edit.html",
                controller: 'companyAddCtrl'
            },
        }
    })
    .state({
        name:'admin.company.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/company_add_edit.html",
                controller: 'companyAddCtrl'
            },
        }
    })
    .state({
        name:'admin.link',
        url:'/link',
        views:{
            'content@':{
                templateUrl:"../views/admin/link.html",
                controller: 'linkCtrl'
            },
        }
    })
    .state({
        name:'admin.link.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/link_add_edit.html",
                controller: 'linkAddCtrl'
            },
        }
    })
    .state({
        name:'admin.link.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/link_add_edit.html",
                controller: 'linkAddCtrl'
            },
        }
    })
    .state({
        name:'admin.nav',
        url:'/nav',
        views:{
            'content@':{
                templateUrl:"../views/admin/nav.html",
                controller: 'navCtrl'
            },
        }
    })
    .state({
        name:'admin.nav.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/nav_add_edit.html",
                controller: 'navAddCtrl'
            },
        }
    })
    .state({
        name:'admin.nav.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/nav_add_edit.html",
                controller: 'navAddCtrl'
            },
        }
    })
    .state({
        name:'admin.single',
        url:'/single',
        views:{
            'content@':{
                templateUrl:"../views/admin/single.html",
                controller: 'singleCtrl'
            },
        }
    })
    .state({
        name:'admin.single.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/single_add_edit.html",
                controller: 'singleAddCtrl'
            },
        }
    })
    .state({
        name:'admin.single.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/single_add_edit.html",
                controller: 'singleAddCtrl'
            },
        }
    })
    .state({
        name:'admin.banner',
        url:'/banner',
        views:{
            'content@':{
                templateUrl:"../views/admin/banner.html",
                controller: 'bannerCtrl'
            },
        }
    })
    .state({
        name:'admin.banner.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/banner_add_edit.html",
                controller: 'bannerAddCtrl'
            },
        }
    })
    .state({
        name:'admin.banner.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/banner_add_edit.html",
                controller: 'bannerAddCtrl'
            },
        }
    })
    .state({
        name:'admin.setting',
        url:'/setting',
        views:{
            'content@':{
                templateUrl:"../views/admin/setting.html",
                controller: 'settingCtrl'
            },
        }
    })
    .state({
        name:'admin.setting.add',
        url:'/add',
        views:{
            'content@':{
                templateUrl:"../views/admin/setting_add_edit.html",
                controller: 'settingAddCtrl'
            },
        }
    })
    .state({
        name:'admin.setting.edit',
        url:'/edit/:id',
        views:{
            'content@':{
                templateUrl:"../views/admin/setting_add_edit.html",
                controller: 'settingAddCtrl'
            },
        }
    })
}).run()