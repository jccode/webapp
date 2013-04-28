
/**
 * Button Group
 */
;(function ($) {
	
	var ButtonGroup = function (element) {
		this.$el = $(element);
		this._value0 = this.val(); //old value
	};

	ButtonGroup.prototype.val = function() {
		return $("button.active", this.$el).val();
	};

	ButtonGroup.prototype.click = function(callback) {
		var self = this;
		this.$el.click(function (e) { 
			setTimeout(function () {
				callback.call(self, e);
				self._value0 = self.val();
			}, 0);
		});
	};

	ButtonGroup.prototype.change = function(callback) {
		var self = this;
		this.click(function (e) {
			if(this.val() != this._value0) { //changed
				e.type="change";
				callback.call(self, e);
			}
		});
	};

	$.fn.buttonGroup = function () {
		return new ButtonGroup($(this));
	};

})(jQuery);


/**
 * Validation
 * 
 * Requirement:
 * 1. jquery, bootstrap.tooltip;
 * 
 * Usage:
 * step1. base usage of bootstrap tooltips: 
 * 	I) add the attribute to indicate using tooltip: data-toggle='tooltip'
 *  II) add the attribute which will as the title of the tooltips: data-original-title='some text'
 *  
 * step2. additional of validate
 *  I) add the attribute to indicate to validate the element, and point out how to validate it.
 *     data-validate  or  data-validate='someRule' 
 *     (someRule can be: not-null, file-not-null, postive-number, etc. see Rule definition.)
 *     if the value of data-validate no given, will use 'not-null' by default.
 */
;(function ($) {
	
	/**
	 * Supported types
	 * 
	 * format::
	 * ruleName: checkFunction
	 */
	var Rule = {
		// 	(default)非空
		"not_null": function($el) {
			return !!$el.val();
		}, 
		// 文件非空
		"file_not_rule": function($el) {
			return !!$el.get(0).files[0];
		}, 
		// 正整数,允许为空
		"postive_number": function($el) {
			var p = /^\d+$/;
			return !$el.val() || p.test($el.val());
		}, 
		// 正的浮点数,即小数;允许为空
		"postive_float": function($el) {
			var p = /^\d+(\.\d+)?$/;
			return !$el.val() || p.test($el.val());
		}
	}, 

	validate_selector = "[data-validate]";

	/**
	 * Constructor
	 * @param {object} options 
	 */
	var Validation = function (options) {
		this.options = $.extend({}, $.validation.defaults, options);
	};

	Validation.prototype = {

		constructor: Validation, 

		init: function () {
			this.els = $(validate_selector, this.options["root"]);
			this.els.tooltip({
				trigger: "manual"
			})
			.on("validate", function() {
				_doValidate(this);
			});

			if(this.options.onfocus) {
				this.els.focus(function() {
					_doValidate(this);
				});
			}

			if(this.options.onblur) {
				this.els.blur(function() {
					_doValidate(this);
				});
			};

			return this;
		}, 

		check: function() {
			// $(validate_selector).trigger("validate");
			var pass = true;
			this.els.each(function (idx, el) {
				if(!_doValidate(el)) pass = false;
			});
			return pass;
		}
	};

	function _doValidate(el) {
		var $el = $(el);
		if(!_isPass($el)) {
			$el.tooltip('show');
			return false;
		}
		else {
			$el.tooltip('hide');
			return true;
		}
	}

	/**
	 * check whether pass the validation
	 * @param  {jQuery} $el 
	 * @return {boolean}     pass:true; nopass:false;
	 */
	function _isPass($el) {
		var validates = $el.attr("data-validate") || "not_null", 
			types = validates.split(" ");
		for(var i in types) {
			var type = types[i];
			if(type) {
				if(Rule[type]) {
					if(!Rule[type].call(window, $el)) 
						return false;
				}
				// user custom function
				else {
					try {
						if(!eval(type)) 
							return false;
					} catch(e) {};
				}
			}
			
		}
		return true;
	}

	/**
	 * PLUGIN DEFINITION
	 * @param  {object} options 
	 */
	$.validation = function (options) {
		var root = options && options["root"] || document, 
			$root = $(root), 
			instance = $root.data('validation');
		// singleton
		if(!instance) $root.data('validation', (instance = new Validation(options)));
		return instance;
	};

	$.validation.defaults = {
		onfocus: false, 
		onblur: true, 
		root: document
	};

	$.validation.Constructor = Validation;

})(jQuery);

/**
 * Toggle Button
 */
;(function() {
	
	$.fn.toggleButton = function(callback) {
		var $el = $(this);
		$el.click(function() {
			setTimeout(function() {
				var checked = $el.hasClass("active");
				callback(checked, $el);
			}, 0);
		});
	}
	
})(jQuery);
