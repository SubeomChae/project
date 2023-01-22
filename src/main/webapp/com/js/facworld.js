/********************************************************************************/
/*									GIS 관련 스크립트								*/
/********************************************************************************/
$(function () {
	// Right Panel
	$('.right-panel').rightPanel();
});

// Right Panel
$.fn.rightPanel = function () {
	var $obj = $(this),
		$panelMenu = $obj.find(".panel_menu"),
		$panelCon = $obj.find(".right_contents"),
		$btn_oc_map = $obj.find(".right-panel-menu-wrap"),
		$btn_panelMenu = $panelMenu.find("button"),
		$btn_menu = $panelCon.find(".menu .btn_write"),

		idx = 0,
		num = 0,
		firstFlag = false
	;

	// Panel Open / Close
	$btn_oc_map.on("click", function () {
		$obj.toggleClass("active");
		$('.map-right-panel').toggleClass('sh-active');

		if (firstFlag == false) {
			$panelMenu.find("li").first().find("button").trigger("click");
			firstFlag = true;
		};
	});

	
	// Panel Open / Close And Panel Menu
	$btn_panelMenu.on("click", function () {
		firstFlag = true;
		idx = $(this).parent().index();

		$obj.addClass("active");
		$('.page-content').addClass('sh_active');
		$('.map-right-panel').addClass('sh-active');

		$panelMenu.find("li").removeClass("active");
		$(this).parent().addClass("active");

		$panelCon.removeClass("active");
		$panelCon.eq(idx).addClass("active");
	});

	$btn_menu.on("click", function () {
		$(this).next().toggleClass("active");
	});
};
