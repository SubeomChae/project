// Menu script 시작
$(function() {
	initGnbNavi();

	// 메뉴 기능 시작
	function initGnbNavi() {
		showMenu();
		hideMenu();
		gnbMenuMouseEvnet();
	}

	function showMenu(num) {
		var currentMenu = $('.nav .title').eq(num); // 현재 선택된 메뉴
		var currentNaviDept = $('.navi-depth').eq(num); // 현재 선택된 메뉴

		// 선택된 메뉴와 나머지 메뉴들 이미지 롤오버
		$('.depth-group > ul').removeClass('on');
		$('.depth-group > ul').eq(num).addClass('on');

		// 선택된 메뉴와 나머지 메뉴들 이미지 롤오버
		$('.nav .title').removeClass('on');
		$('.nav .title').eq(num).addClass('on');

		// 선택된 메뉴와 나머지 메뉴들 이미지 롤오버
		$('.depth-ul').removeClass('on');
		$('.depth-ul').eq(num).addClass('on');
	}

	function hideMenu(num) {
		var currentMenu = $('.nav .title').eq(num); // 현재 선택된 메뉴
		var currentNaviDept = $('.navi-depth').eq(num); // 현재 선택된 메뉴

		// 선택된 메뉴와 나머지 메뉴들 이미지 롤오버
		$('.depth-group > ul').eq(num).addClass('on');
		$('.depth-group > ul').removeClass('on');

		// 선택된 메뉴와 나머지 메뉴들 이미지 롤오버
		$('.nav .title').eq(num).addClass('on');
		$('.nav .title').removeClass('on');
	}

	function gnbMenuMouseEvnet() {
		var pageContent = $('.page-content-wrapper, .page-footer, .depth-group-close');
		var gnbMenu = $('.nav');
		var gnbMenuEle = $('.nav .title');
		var gnbMenuEleLink = $('.nav .title > a');
		var gnbNaviDepthEle = $('.navi-depth');
		var gnbNaviDepthEleUl = $('.depth-ul');
		var gnbNaviDepthDropdown = $('.dropdown-menu');
		var gnbNaviDepthDropdownHover = $('.page-header.navbar .hor-menu .navbar-nav > li.classic-menu-dropdown:hover > .dropdown-menu');
		var allMenu = $('.all-menu-btn');

		gnbMenuEle.click(function() {
			var index = gnbMenuEle.index(this);
			var depthUl = $('.depth-group');
			depthUl.show();

			$(this).addClass('on');
			var currentMenu = $(this).index(); // a 부모 li의 인덱스(순서)
			showMenu(currentMenu);
		});

		pageContent.click(function() {
			gnbNaviDepthEle.removeClass('on');
			allMenu.removeClass('all-menu-btn-close');
			allMenu.attr('data-click-state', 0);
			gnbNaviDepthDropdown.removeClass('dropdown-menu-none');
		});

		var __isGnbMouseOver = false;
		gnbMenuEle.mouseover(function() {
			__isGnbMouseOver = true;
			setTimeout(function() {
				if(__isGnbMouseOver) {
					gnbNaviDepthEle.addClass('on');
					gnbNaviDepthEleUl.addClass("on");
				}
			}, 500);
			allMenu.addClass('all-menu-btn-close');
			allMenu.attr('data-click-state', 1);
			var connectNavi = $(this).index();// a 부모 li의 인덱스(순서)
			showMenu(connectNavi);
		});

		gnbMenuEle.mouseout(function() {
			__isGnbMouseOver = false;
			gnbNaviDepthEle.removeClass('on');
			gnbNaviDepthEleUl.removeClass("on");
			var connectNavi = $(this).index();// a 부모 li의 인덱스(순서)
			allMenu.removeClass('all-menu-btn-close');
			allMenu.attr('data-click-state', 0);
			gnbNaviDepthDropdown.removeClass('dropdown-menu-none');
			hideMenu(connectNavi);
		});

		gnbNaviDepthEle.mouseover(function() {
			gnbNaviDepthEle.addClass('on');
			allMenu.addClass('all-menu-btn-close');
			allMenu.attr('data-click-state', 1);
		});

		gnbNaviDepthEle.mouseout(function() {
			gnbNaviDepthEle.removeClass('on');
			allMenu.removeClass('all-menu-btn-close');
			allMenu.attr('data-click-state', 0);
		});

		gnbNaviDepthEleUl.mouseover(function() {
			gnbMenuEle.addClass("on");
			var connectNaviDept = $(this).index();// a 부모 li의 인덱스(순서)
			showMenu(connectNaviDept);
		});

		gnbNaviDepthEleUl.mouseout(function() {
			gnbMenuEle.removeClass("on");
			var connectNaviDept = $(this).index();// a 부모 li의 인덱스(순서)
			hideMenu(connectNaviDept);
		});

		allMenu.on('click',function() {
			if($(this).attr('data-click-state') == 1) {
				$(this).attr('data-click-state', 0)
				gnbNaviDepthEle.removeClass('on');
				gnbNaviDepthDropdown.removeClass('dropdown-menu-none');
				allMenu.removeClass('all-menu-btn-close');
			} else {
				$(this).attr('data-click-state', 1)
				gnbNaviDepthEle.addClass('on');
				gnbNaviDepthDropdown.addClass('dropdown-menu-none');
				allMenu.addClass('all-menu-btn-close');
			}
		});
	}
});

var isNN = (navigator.appName.indexOf("Netscape")!=-1); 
function autoTab(input,len, e) { 
    try {
    	var keyCode = (isNN) ? e.which : e.keyCode; 
    	var filter = (isNN) ? [0,8,9] : [0,8,9,16,17,18,37,38,39,40,46]; 
    	if(input.value.length >= len && !containsElement(filter,keyCode)) { 
    		input.value = input.value.slice(0, len); 
    		input.form[(getIndex(input)+1) % input.form.length].focus(); 
    	} 
    } catch(e) {}
	return true; 
} 

function containsElement(arr, ele) { 
	var found = false, index = 0; 
	try {
    	while(!found && index < arr.length) 
    	if(arr[index] == ele) 
    	found = true; 
    	else 
    	index++; 
    } catch(e) {}
	return found; 
} 

function getIndex(input) { 
	var index = -1, i = 0, found = false; 
	try {
    	while (i < input.form.length && index == -1) 
    	if (input.form[i] == input)index = i; 
    	else i++; 
    } catch(e) {}
	return index; 
} 

function MM_swapImgRestore() {
  	var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() {
  	var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) {
  	var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  	if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  	if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() {
  	var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   	if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function setCookie( name, value, expiredays ) {
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}

// 브라우저 줌/아웃
$(function() {
	// Set initial zoom level
	var zoom_level=100;

	// Click events
	$('#zoom_in').click(function() { zoom_page(10, $(this)) });
	$('#zoom_out').click(function() { zoom_page(-10, $(this)) });
	$('#zoom_reset').click(function() { zoom_page(0, $(this)) });

	// Zoom function
	function zoom_page(step, trigger) {
		// Zoom just to steps in or out
		if(zoom_level>=120 && step>0 || zoom_level<=80 && step<0) return;

		// Set / reset zoom
		if(step==0) zoom_level=100;
		else zoom_level=zoom_level+step;

		// Set page zoom via CSS
		$('body').css({
			transform: 'scale('+(zoom_level/100)+')', // set zoom
			transformOrigin: '50% 0' // set transform scale base
		});

		// Adjust page to zoom width
		if(zoom_level>100) $('body').css({ width: (zoom_level*1.2)+'%' });
		else $('body').css({ width: '100%' });

		// Activate / deaktivate trigger (use CSS to make them look different)
		if(zoom_level>=120 || zoom_level<=80) trigger.addClass('disabled');
		else trigger.parents('ul').find('.disabled').removeClass('disabled');
		if(zoom_level!=100) $('#zoom_reset').removeClass('disabled');
		else $('#zoom_reset').addClass('disabled');
	}
});

// 프린트 (IE9이상 인쇄미리보기)
$(function() {
	$('#print-preview').click(function() { pagePrintPreview(); });

	function pagePrintPreview() {
		var browser = navigator.userAgent.toLowerCase();
		if(browser.indexOf('chrome') != -1) {
			window.print();
		}else if(browser.indexOf('trident') != -1) {
			try {
				// 웹 브라우저 컨트롤 생성, 참고로 IE 5.5 이상에서만 동작함
				var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
				// 웹 페이지에 객체 삽입
				document.body.insertAdjacentHTML('beforeEnd', webBrowser);
				// ExexWB 메쏘드 실행 (7 : 미리보기 , 8 : 페이지 설정 , 6 : 인쇄하기(대화상자))
				previewWeb.ExecWB(7, 1);
				// 객체 해제
				previewWeb.outerHTML = "";
			}catch(e) {
				alert("- 도구 > 인터넷 옵션 > 보안 탭 > 신뢰할 수 있는 사이트 선택\n   1. 사이트 버튼 클릭 > 사이트 추가\n   2. 사용자 지정 수준 클릭 > 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 (사용)으로 체크\n\n※ 위 설정은 프린트 기능을 사용하기 위함임");
			}
		}
	}
});

// 프린트 (특정 DIV만 인쇄) script 시작
// $(function() {
//
//   $('#print-preview').click(function() { open_print(); });
//
// 	function open_print() {
//		 var initBody;
//
//		 //인쇄하기전 출력되는 내용
//		 window.onbeforeprint = function () {
//
//			 initBody = document.body.innerHTML;																//기존 내용저장
//			 document.body.innerHTML = document.getElementById('print-body').innerHTML;	//프린트할 내용 저장
//
//	 	};
//
//		 //인쇄가 끝난후 출력되는 내용
//		 window.onafterprint = function () {
//			 document.body.innerHTML = initBody;		//기존 내용표시
//	 	};
//
//		 window.print();
//
// 	}
//
// });

$(document).ready(function() {
	$('.search_box').height($('.page-content-wrapper').outerHeight());
	$('#all_menu').click(function() {
		//$(this).addClass('active');
		$('.nav_area').show();
		$('.page-container').click(function() { $('.nav_area').hide(); });
	});

	$('.nav_close').click(function() {
		$('.nav_area').hide();
		$(this).removeClass('active');
	});

	$('.menu-toggler a').click(function() {
		$(this).toggleClass('active');
	});

	$('.btn_search').click(function() {
		$(this).toggleClass('active');
		$('.search_inner').toggle();
		$('.page-content').toggleClass('sh_active');
	});
});


// 퀵메뉴
$(document).ready(function () {
	var currentPosition = parseInt($(".quick-sidebar-wrapper").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
		var sum = position + currentPosition+"px";
		$(".quick-sidebar-wrapper").stop().animate({top:sum},500);
	});
});

var $selectMenu = [];
