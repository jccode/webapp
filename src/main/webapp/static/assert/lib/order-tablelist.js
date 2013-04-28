
/**
 * table list
 * @param  {[type]} $ [description]
 * @return {[type]}   [description]
 */
jQuery(function ($) {


	$(".table-list .link").click(function (e) {
		var $this = $(this), 
			$tableItem = $this.closest("div.table-item"), 
			expand = $tableItem.hasClass("expand");

		if(!expand) {
			$tableItem.addClass("expand");
			$("div.food-collapse", $tableItem).hide();
			$("div.food-expand", $tableItem).slideDown();
		} else {
			$tableItem.removeClass("expand");
			$("div.food-expand", $tableItem).slideUp(function () {
				$("div.food-collapse", $tableItem).show();
			});
		}
	});


	$(".table-list > ul > li:odd").css("background-color", "#F2F2F2");
});

