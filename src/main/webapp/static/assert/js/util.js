
/**
 * global util js
 */
;(function(factory) {
	// CommonJS / NodeJS
	if(typeof require === 'function' && typeof exports === 'object' && typeof module === 'object') {
		factory(require, exports, module);
	}
	// CMD / SeaJS
	else if(typeof define === 'function') {
		define(factory);
	}
	// No module loader
	else {
		factory(function(){}, window, {'exports': window});
	}
	
}(function(require, exports, module) {
	
	var webRoot = "/miniweb";
	
	/**
	 * 获取url参数
	 */
	function getParam(url, name) {
		var re = new RegExp("(/?|&)"+ name +"=([^&]*)(&|$)", "i"), 
			m = url.match(re);
		if(m)
			return m[2];
		else 
			return null;
	}

	/**
	 * 设置url参数
	 */
	function setParam(url, name, value) {
		var re = new RegExp("(/?|&)"+ name +"=([^&]*)(&|$)", "i"), 
			m = url.match(re);
		if(m) {
			return (url.replace(re, function($0, $1, $2) {
				return $0.replace($2, value);
			}));
		} else {
			if (url.indexOf('?') == -1)
				return (url + '?' + name + '=' + value);
			else
				return (url + '&' + name + '=' + value);
		}
	}

	/**
	 * startWith & endsWith
	 */
	if (typeof String.prototype.startsWith != 'function') {
		String.prototype.startsWith = function(str) {
			return this.slice(0, str.length) === str;
		};
	}
	if (typeof String.prototype.endsWith != 'function') {
		String.prototype.endsWith = function (str){
			return this.slice(-str.length) === str;
		};
	}

	/**
	 * html5 图片预览
	 * @param $fileInput file文件上传框
	 * @param $imageToRender 预览的图片对象
	 */
	function imagePreview($fileInput, $imageToRender) {
		$fileInput.change(function() {
			var img = this.files[0], 
				reader = new FileReader();
			
			reader.onload = function(evt) {
				$imageToRender.attr("src", evt.target.result);
			}
			reader.readAsDataURL(img);
		});
	}
	
	
	// exports
	exports.webRoot = webRoot;
	exports.getParam = getParam;
	exports.setParam = setParam;
	exports.imagePreview = imagePreview;
	
}));



