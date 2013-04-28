seajs.config({
	
	alias: {
		'util': 'js/util'
	}, 
	
	// 加载 shim 插件
	plugins: ['shim'],

	shim : {
		'jquery': {
			src: 'lib/jquery-1.8.0.js', 
			exports: 'jQuery'
		},
		'bootstrap' : {
			src: 'lib/bootstrap.min.js', 
			deps: ['jquery']
		},
		'form' : {
			src: 'lib/jquery.form.js', 
			deps: ['jquery']
		},
		'pagination' : {
			src: 'lib/jquery.pagination.js', 
			deps: ['jquery']
		},
		'bootstrap.extension' : {
			src: 'lib/jquery.bootstrap.extension.js', 
			deps: ['jquery']
		}
	}

});