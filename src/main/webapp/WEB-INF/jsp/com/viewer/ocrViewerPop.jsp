<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html dir='ltr' mozdisallowselectionprint moznomarginboxes>
<head>
   <meta charset="utf-8" />
   <title id="demoTitle">OCR 분석</title>
   <link rel="shortcut icon" type="image/x-icon" href="Resources/Images/favicon.ico" />
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE8" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />

   <meta name="apple-mobile-web-app-capable" content="yes" />
   <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

   <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> -->
   <link rel="stylesheet" href="/com/leadtools/Common/bootstrap.min.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/DocumentViewerDemo.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/Toolbars.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/ImageViewerStyles.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/ImageViewerThumbnailStyles.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/Sidebar.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/Table.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/dialogs.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/Icons.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/AutomationObjectsList.css" type="text/css" />
   <link rel="stylesheet" href="/com/leadtools/Resources/Styles/spectrum/spectrum.css" type="text/css" />

   <script type="text/javascript">
      // check if HTML5 canvas is supported
      if (!("HTMLCanvasElement" in window)) {
         alert("HTML5 Canvas not supported, redirecting ...");
         location.href = "Resources/NoHTML5Support.html";
      }
   </script>

   <!-- External .js files -->
   <!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
   <script src="/com/leadtools/Common/jquery-1.12.4.min.js"></script>
   <script src="/com/leadtools/Common/bootstrap.min.js"></script>
   <script src="/com/leadtools/Common/spectrum/spectrum.js"></script>
   <!--[if !IE]><!-->
   <script type="text/javascript" src="/com/leadtools/Common/pdfjs/lt.pdf.js"></script>
   <script>
      // Point PDFJS in the direction of the worker file
      if (typeof PDFJS !== "undefined") {
         // We use a custom pdf.worker.js file that does not draw annotations
         PDFJS.workerSrc = "/com/leadtools/Common/pdfjs/lt.pdf.worker.js";
         // Ensure your server hosts cmap files (.bcmap)
         PDFJS.cMapUrl = "/com/leadtools/Resources/Cmaps/";
         PDFJS.cMapPacked = true;
      }
   </script>
   <script type="text/javascript" src="/com/leadtools/Common/pdfjs/lt.pdf.compatibility.js"></script>
   <!--<![endif]-->
   <!-- Leadtools .js files -->
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Controls.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Annotations.Engine.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Annotations.Designers.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Annotations.Rendering.JavaScript.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Annotations.Automation.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Document.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Document.Viewer.js"></script>

   <!-- DocumentViewerDemo .js fies -->
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Demos.js"></script>
   <script type="text/javascript" src="/com/leadtools/Common/Leadtools.Demos.Annotations.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/CommandBinder.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.File.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.Edit.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.View.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.Page.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.Interactive.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.Annotations.js"></script>
   <script type="text/javascript" src="/com/leadtools/Main/Main.Preferences.js"></script>
   <script type="text/javascript" src="/com/leadtools/Converter/DocumentConverterFormats.js"></script>
   <script type="text/javascript" src="/com/leadtools/Converter/Dialogs/DocumentConverterDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Converter/Dialogs/DocumentFormatOptionsDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Converter/Dialogs/AdvancedPdfOptionsDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Converter/Dialogs/SaveToDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/OpenDocumentDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/PagesDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/PageRotationDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/DocumentPropertiesDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/ProcessingPagesDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/CustomRenderModeDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/InputDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/DocumentViewerOptionsDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/LinkValueDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/LoadingDlg.js"></script>
   <script type="text/javascript" src="/com/leadtools/Dialogs/PrintDlg.js"></script>

   <!-- DriverHelper -->
   <script type="text/javascript" src="/com/leadtools/DriveHelper/DriveHelper.js"></script>
   <script type="text/javascript" src="/com/leadtools/DriveHelper/SharePointService.js"></script>
   <script type="text/javascript" src="/com/leadtools/DriveHelper/SharePointPickerDlg.js"></script>
   <script type="text/javascript" src="/com/js/jquery.table2excel.js"></script>
   <script type="text/javascript" src="/com/js/sinjin.common.js"></script>
   <script>
		window["fileUrlText"] = "<%=request.getParameter("targetUrl")%>";
		function goExcelDown() {
			var trArr = $("#dlgTextResults_Results").val().split("\n");
			var tmpTable = "<table id='excelTable'>";
			for(var i=0; i < trArr.length; i++) {
				tmpTable += "<tr>";
				
				var tdArr = trArr[i].split(" ");
				for(var j=0; j < tdArr.length; j++) {
					tmpTable += "<td>" + tdArr[j] + "</td>";
				}
				
				tmpTable += "</tr>"
			}
			tmpTable += "</table>";
			$("#excelDiv").html(tmpTable);
			screenToExcel("#excelTable", "", "분석결과")
		}
		
		function copyClipBoard() {
			// $("#dlgTextResults_Results").select();
			document.execCommand('copy')
		}
   </script>
</head>
<body>
   <!-- Create a header toolbar -->
   <div id="excelDiv" style="display:none;"></div>
   <div id="headerToolbarContainer" class="toolbar headerToolbarDiv hide-for-print">
      <!-- Create header toolbar tabs -->
      <div class="headerToolbarTabs">
         <ul class="nav">
            <!-- File Menu -->
            <li class="dropdown">
               <a id="fileMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">파일 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <li>
                     <button id="uploadDocument" class="menuItem" title="Open a local document...">
                        <span class="icon icon-sm openIcon"></span>
                        <span class="text">파일열기</span>
                     </button>
                  </li>
                  <li>
                     <button id="openDocumentFromUrl" class="menuItem" title="Open a document from a URL...">
                        <span class="icon icon-sm openUrlIcon"></span>
                        <span class="text">URL로 파일열기</span>
                     </button>
                  </li>
                  <li>
                     <button id="loadDocumentFromCache" class="menuItem" title="Open a document and annotations previously saved to the server...">
                        <span class="icon icon-sm openIcon"></span>
                        <span class="text">캐시에서 열기</span>
                     </button>
                  </li>
                  <li>
                     <button id="openFromDocumentStorage" class="menuItem" title="Open a document from a cloud storage service...">
                        <span class="icon icon-sm server"></span>
                        <span class="text">클라우드 저장소에서 열기</span>
                     </button>
                  </li>
                  <li class="divider fileMenuDivider"></li>
                  <!-- Save/Convert document -->
                  <li>
                     <button id="saveDocument" class="menuItem" title="Export/Convert document...">
                        <span class="icon icon-sm saveIcon"></span>
                        <span class="text">내보내기</span>
                     </button>
                  </li>
                  <!-- Save to cache -->
                  <li>
                     <button id="saveToCache" class="menuItem" title="Save the document and annotations to the server cache" style="display:none;">
                        <span class="icon icon-sm saveIcon"></span>
                        <span class="text">캐시로 저장</span>
                     </button>
                  </li>
                  <!-- Open in Comparison Demo -->
                  <!-- <li>
                     <a id="openInComparison" href="javascript:void(0);" target="_blank" rel="noopener noreferrer" class="menuItem demo-link">
                        <span class="icon icon-sm showLinksIcon"></span>
                        <span class="text">비교</span>
                     </a>
                  </li> -->
                  <!-- Open in Virtual Document Demo -->
                  <!-- <li>
                     <a id="openInVirtualDocument" href="javascript:void(0);" target="_blank" rel="noopener noreferrer" class="menuItem demo-link">
                        <span class="icon icon-sm showLinksIcon"></span>
                        <span class="text">조정</span>
                     </a>
                  </li> -->
                  <!-- Print  -->
                  <li>
                     <button id="print" class="menuItem" title="Print">
                        <span class="icon icon-sm print"></span>
                        <span class="text">인쇄</span>
                     </button>
                  </li>
                  <!-- Close document -->
                  <li>
                     <button id="closeDocument" class="menuItem">
                        <span class="icon icon-sm closeIcon"></span>
                        <span class="text">닫기</span>
                     </button>
                  </li>
                  <li class="divider fileMenuDivider"></li>
                  <!-- Export text -->
                  <li>
                     <button id="exportText" class="menuItem">
                        <span class="icon icon-sm singlePageExportTextIcon"></span>
                        <span class="text">문자 추출</span>
                     </button>
                  </li>
                  <!-- Show document properties dialog -->
                  <li>
                     <button id="documentProperties" class="menuItem">
                        <span class="icon icon-sm propertiesIcon"></span>
                        <span class="text">속성</span>
                     </button>
                  </li>
                  
               </ul>
            </li>
            <!-- Edit Menu -->
            <li class="dropdown">
               <a id="editMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">편집 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <!-- Undo -->
                  <li>
                     <button id="undo" class="menuItem annotations">
                        <span class="icon icon-sm undoIcon"></span>
                        <span class="text">뒤로</span>
                     </button>
                  </li>
                  <!-- Redo -->
                  <li>
                     <button id="redo" class="menuItem annotations">
                        <span class="icon icon-sm redoIcon"></span>
                        <span class="text">앞으로</span>
                     </button>
                  </li>
                  <li class="divider annotations"></li>
                  <!-- Delete Selected Annotation -->
                  <li>
                     <button id="deleteAnnotation" class="menuItem annotations">
                        <span class="icon icon-sm closeIcon"></span>
                        <span class="text">주석 삭제</span>
                     </button>
                  </li>
                  <li class="divider annotations"></li>
                  <!-- Select all text -->
                  <li>
                     <button id="selectAllText" class="menuItem" title="Select all text in the document">
                        <span class="icon icon-sm selectAllTextIcon"></span>
                        <span class="text">전체 선택</span>
                     </button>
                  </li>
                  <!-- Select all annotations -->
                  <li>
                     <button id="selectAllAnnotations" class="menuItem annotations">
                        <span class="icon icon-sm selectAllAnnotationsIcon"></span>
                        <span class="text">전체 주석 선택</span>
                     </button>
                  </li>
                  <!-- Clear selection -->
                  <li>
                     <button id="clearSelection" class="menuItem">
                        <span class="icon icon-sm clearSelectionIcon"></span>
                        <span class="text">선택 초기화</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <li>
                     <button id="copyText" class="menuItem" title="Copy selected text">
                        <span class="icon icon-sm copyTextIcon"></span>
                        <span class="text">텍스트 복사</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Find text -->
                  <li>
                     <button id="findText" class="menuItem" title="Find text in the document">
                        <span class="icon icon-sm findTextIcon"></span>
                        <span class="text">텍스트 찾기</span>
                     </button>
                  </li>
               </ul>
            </li>
            <!-- View Menu -->
            <li class="dropdown">
               <a id="viewMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">화면 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <!-- Rotate Counter Clockwise -->
                  <li>
                     <button id="rotateCounterClockwise" class="menuItem">
                        <span class="icon icon-sm rotateCounterClockwiseIcon"></span>
                        <span class="text">반시계 방향으로 회전</span>
                     </button>
                  </li>
                  <!-- Rotate Clockwise -->
                  <li>
                     <button id="rotateClockwise" class="menuItem">
                        <span class="icon icon-sm rotateClockwiseIcon"></span>
                        <span class="text">시계 방향으로 회전</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Zoom Out -->
                  <li>
                     <button id="zoomOut" class="menuItem">
                        <span class="icon icon-sm zoomOutIcon"></span>
                        <span class="text">축소</span>
                     </button>
                  </li>
                  <!-- Zoom In -->
                  <li>
                     <button id="zoomIn" class="menuItem">
                        <span class="icon icon-sm zoomInIcon"></span>
                        <span class="text">확대</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Page size: actualSize, fit, or fit width -->
                  <li>
                     <button id="actualSize" class="menuItem">
                        <span class="icon icon-sm actualPageSizeIcon"></span>
                        <span class="text">실제 크기</span>
                     </button>
                  </li>
                  <li>
                     <button id="fit" class="menuItem">
                        <span class="icon icon-sm page-FitIcon"></span>
                        <span class="text">페이지에 맞춤</span>
                     </button>
                  </li>
                  <li>
                     <button id="fitWidth" class="menuItem">
                        <span class="icon icon-sm fitWidthIcon"></span>
                        <span class="text">너비에 맞춤</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- View pages as pdf (if possible) or svg or image -->
                  <li>
                     <button id="viewAsSVG" class="menuItem">
                        <span class="icon icon-sm svgViewIcon"></span>
                        <span class="text">SVG로</span>
                     </button>
                  </li>
                  <li>
                     <button id="viewAsImage" class="menuItem">
                        <span class="icon icon-sm imageViewIcon"></span>
                        <span class="text">이미지로</span>
                     </button>
                  </li>
               </ul>
            </li>
            <!-- Page Menu -->
            <li class="dropdown">
               <a id="pageMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">페이지 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <!-- First page -->
                  <li>
                     <button id="firstPage" class="menuItem">
                        <span class="icon icon-sm firstPageIcon"></span>
                        <span class="text">첫번쨰 페이지</span>
                     </button>
                  </li>
                  <!-- Previous page -->
                  <li>
                     <button id="previousPage" class="menuItem">
                        <span class="icon icon-sm previousIcon"></span>
                        <span class="text">이전 페이지</span>
                     </button>
                  </li>
                  <!-- Next page -->
                  <li>
                     <button id="nextPage" class="menuItem">
                        <span class="icon icon-sm nextIcon"></span>
                        <span class="text">다음 페이지</span>
                     </button>
                  </li>
                  <!-- Last page -->
                  <li>
                     <button id="lastPage" class="menuItem">
                        <span class="icon icon-sm lastPageIcon"></span>
                        <span class="text">마지막 페이지</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Get text from current page or from all pages -->
                  <li>
                     <button id="currentPageGetText" class="menuItem">
                        <span class="icon icon-sm singlePageExportTextIcon"></span>
                        <span class="text">현재 페이지 텍스트 가져오기</span>
                     </button>
                  </li>
                  <li>
                     <button id="allPagesGetText" class="menuItem">
                        <span class="icon icon-sm multiPagesExportTextIcon"></span>
                        <span class="text">전체 페이지 텍스트 가져오기</span>
                     </button>
                  </li>
                  <li>
                     <button id="readPageBarcodes" class="menuItem" style="display:none;">
                        <span class="icon icon-sm barcodeIcon"></span>
                        <span class="text">현재 페이지 바코드 읽기</span>
                     </button>
                  </li>
                  <li>
                     <button id="readAllBarcodes" class="menuItem" style="display:none;">
                        <span class="icon icon-sm barcodeIcon"></span>
                        <span class="text">전체 페이지 바코드 읽기</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Rotate pages -->
                  <li>
                     <button id="rotateCurrentPageClockwise" class="menuItem" title="Rotate the current page by 90 degrees clockwise">
                        <span class="icon icon-sm rotateClockwiseIcon"></span>
                        <span class="text">시계방향으로 페이지 회전</span>
                     </button>
                  </li>
                  <li>
                     <button id="rotateCurrentPageCounterClockwise" class="menuItem" title="Rotate the current page by 90 degrees counter-clockwise">
                        <span class="icon icon-sm rotateCounterClockwiseIcon"></span>
                        <span class="text">반시계방향으로 페이지 회전</span>
                     </button>
                  </li>
                  <li>
                     <button id="rotatePages" class="menuItem" title="Rotate multiple pages">
                        <span class="icon icon-sm multiPagesExportTextIcon"></span>
                        <span class="text">전체 회전</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <li>
                     <button id="markPageDisabled" class="menuItem" title="Mark the current page as disabled in the document">
                        <span class="icon icon-sm disableIcon"></span>
                        <span class="text">페이지를 사용 중지 된 것으로 표시</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Document pages display -->
                  <li>
                     <button id="singlePageDisplay" class="menuItem" title="Single page display">
                        <span class="icon icon-sm singleLayoutIcon"></span>
                        <span class="text">한장씩</span>
                     </button>
                  </li>
                  <li>
                     <button id="doublePagesDisplay" class="menuItem" title="Double page display">
                        <span class="icon icon-sm doubleLayoutIcon"></span>
                        <span class="text">두장씩</span>
                     </button>
                  </li>
                  <li>
                     <button id="verticalPagesDisplay" class="menuItem" title="Vertical page display">
                        <span class="icon icon-sm verticalLayoutIcon"></span>
                        <span class="text">수직으로</span>
                     </button>
                  </li>
                  <li>
                     <button id="horizontalPagesDisplay" class="menuItem" title="Horizontal page display">
                        <span class="icon icon-sm horizontalLayoutIcon"></span>
                        <span class="text">수평으로</span>
                     </button>
                  </li>
               </ul>
            </li>
            <!-- Interactive Menu -->
            <li class="dropdown">
               <a id="interactiveMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">조작   <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <li>
                     <button id="panZoomMode" class="menuItem">
                        <span class="icon icon-sm panZoomIcon"></span>
                        <span class="text">이동 및 확대/축소</span>
                     </button>
                  </li>
                  <li>
                     <button id="panMode" class="menuItem">
                        <span class="icon icon-sm panIcon"></span>
                        <span class="text">이동</span>
                     </button>
                  </li>
                  <li>
                     <button id="zoomMode" class="menuItem">
                        <span class="icon icon-sm zoomIcon"></span>
                        <span class="text">확대/축소</span>
                     </button>
                  </li>
                  <li>
                     <button id="zoomToMode" class="menuItem">
                        <span class="icon icon-sm zoomToIcon"></span>
                        <span class="text">영역으로 확대</span>
                     </button>
                  </li>
                  <li>
                     <button id="magnifyGlassMode" class="menuItem">
                        <span class="icon icon-sm magnifyGlassIcon"></span>
                        <span class="text">Magnify glass</span>
                     </button>
                  </li>
                  <li>
                     <button id="selectTextMode" class="menuItem">
                        <span class="icon icon-sm selectTextIcon"></span>
                        <span class="text">텍스트 선택</span>
                     </button>
                  </li>
                  <li>
                     <button id="rubberBandInteractiveMode" class="menuItem interactiveMode" style="display:none;">
                        <span class="icon icon-sm selectAreaIcon"></span>
                        <span class="text"></span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <!-- Enable/disable auto pan -->
                  <li>
                     <button id="autoPan" class="menuItem">
                        <span class="icon icon-sm autoPanIcon"></span>
                        <span class="text">자동 이동</span>
                     </button>
                  </li>
                  <!-- Enable/disable inertia scroll -->
                  <li>
                     <button id="inertiaScroll" class="menuItem">
                        <span class="icon icon-sm inertiaScrollIcon"></span>
                        <span class="text">관성 스크롤</span>
                     </button>
                  </li>
               </ul>
            </li>
            <!-- Annotations Menu -->
            <li class="dropdown">
               <a id="annotationsMenuItem" class="dropdown-toggle annotations" data-toggle="dropdown" role="button" aria-expanded="false">주석 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <!-- User modes : run, design, and render -->
                  <li>
                     <button id="runUserMode" class="menuItem" title="Allows running the annotations objects and clicking the hyperlinks">
                        <span class="icon icon-sm runModeIcon"></span>
                        <span class="text">Run mode</span>
                     </button>
                  </li>
                  <li>
                     <button id="designUserMode" class="menuItem" title="Allows editing of the annotations objects">
                        <span class="icon icon-sm designModeIcon"></span><span class="text">Design mode</span>
                     </button>
                  </li>
                  <li>
                     <button id="renderUserMode" class="menuItem" title="Render the annotations only. No editing and no running">
                        <span class="icon icon-sm renderModeIcon"></span>
                        <span class="text">Render mode</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <li>
                     <button id="customizeRenderMode" class="menuItem">
                        <span class="icon icon-sm renderModeSettingsIcon"></span>
                        <span class="text">Customize render mode...</span>
                     </button>
                  </li>
                  <!-- Align -->
                  <li>
                     <button id="bringToFront" class="menuItem">
                        <span class="icon icon-sm bringToFrontIcon"></span>
                        <span class="text">Bring to front</span>
                     </button>
                  </li>
                  <li>
                     <button id="sendToBack" class="menuItem">
                        <span class="icon icon-sm sendToBackIcon"></span>
                        <span class="text">Send to back</span>
                     </button>
                  </li>
                  <li>
                     <button id="bringToFirst" class="menuItem">
                        <span class="icon icon-sm bringToFirstIcon"></span>
                        <span class="text">Bring to first</span>
                     </button>
                  </li>
                  <li>
                     <button id="sendToLast" class="menuItem">
                        <span class="icon icon-sm sendToLastIcon"></span>
                        <span class="text">Send to last</span>
                     </button>
                  </li>
                  <!-- Flip -->
                  <li>
                     <button id="verticalFlip" class="menuItem">
                        <span class="icon icon-sm flipIcon"></span>
                        <span class="text">Vertical flip</span>
                     </button>
                  </li>
                  <li>
                     <button id="horizontalFlip" class="menuItem">
                        <span class="icon icon-sm reverseIcon"></span>
                        <span class="text">Horizontal flip</span>
                     </button>
                  </li>
                  <!-- Group -->
                  <li>
                     <button id="groupSelectedObjects" class="menuItem">
                        <span class="icon icon-sm groupIcon"></span>
                        <span class="text">Group selected objects</span>
                     </button>
                  </li>
                  <li>
                     <button id="ungroup" class="menuItem">
                        <span class="icon icon-sm ungroupIcon"></span>
                        <span class="text">Ungroup</span>
                     </button>
                  </li>
                  <!-- Security -->
                  <li>
                     <button id="lockObject" class="menuItem">
                        <span class="icon icon-sm lockIcon"></span>
                        <span class="text">Lock object...</span>
                     </button>
                  </li>
                  <li>
                     <button id="unlockObject" class="menuItem">
                        <span class="icon icon-sm unlockIcon"></span>
                        <span class="text">Unlock object...</span>
                     </button>
                  </li>
                  <!--  Annotation object properties -->
                  <li>
                     <button id="annotationsProperties" class="menuItem">
                        <span class="icon icon-sm propertiesIcon"></span>
                        <span class="text">Annotations properties...</span>
                     </button>
                  </li>
                  <!-- Options -->
                  <li>
                     <button id="addStampTimeLabels" class="menuItem">
                        <span class="icon icon-sm rubberStampIcon"></span>
                        <span class="text">Add time labels to stamps</span>
                     </button>
                  </li>
                  <li>
                     <button id="resetRotatePoint" class="menuItem">
                        <span class="icon icon-sm resetRotatePointIcon"></span>
                        <span class="text">Reset rotate point</span>
                     </button>
                  </li>
                  <li>
                     <button id="useRotateThumb" class="menuItem">
                        <span class="icon icon-sm rotateThumbIcon"></span>
                        <span class="text">Use rotate thumb</span>
                     </button>
                  </li>
                  <li>
                     <button id="renderOnThumbnails" class="menuItem">
                        <span class="icon icon-sm renderOnThumbnailsIcon"></span>
                        <span class="text">Render on thumbnails</span>
                     </button>
                  </li>
                  <li>
                     <button id="deselectOnDown" class="menuItem">
                        <span class="icon icon-sm"></span>
                        <span class="text">Deselect on down</span>
                     </button>
                  </li>
                  <li>
                     <button id="rubberbandSelect" class="menuItem">
                        <span class="icon icon-sm"></span>
                        <span class="text">Rubberband select</span>
                     </button>
                  </li>
               </ul>
            </li>
            <!-- Preferences Menu -->
            <li class="dropdown">
               <a id="preferencesMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">환경설정 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <li>
                     <button id="userNameMenuItem" class="menuItem" title="Change the current user name used with the document">
                        <span class="icon icon-sm userNameIcon"></span>
                        <span class="text">사용자 이름</span>
                     </button>
                  </li>
                  <li class="divider"></li>
                  <li>
                     <button id="showTextIndicators" class="menuItem" title="Show the text indicators on the pages">
                        <span class="icon icon-sm showTextIndicatorsIcon"></span>
                        <span class="text">텍스트 표시기 표시</span>
                     </button>
                  </li>
                  <li>
                     <button id="showLinks" class="menuItem" title="Highlight document external and internal links">
                        <span class="icon icon-sm showLinksIcon"></span>
                        <span class="text">링크 표시</span>
                     </button>
                  </li>
                  <li>
                     <button id="documentViewerOptions" class="menuItem">
                        <span class="icon icon-sm settingsIcon"></span>
                        <span class="text">문서 뷰어 옵션</span>
                     </button>
                  </li>
               </ul>
            </li>
            <!-- Help Menu -->
            <li class="dropdown">
               <a id="helpMenuItem" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">정보 <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
                  <li>
                     <button id="about" class="menuItem">
                        <span class="icon icon-sm helpIcon"></span>
                        <span class="text">정보</span>
                     </button>
                  </li>
               </ul>
            </li>
         </ul>
      </div>
      <div class="shortcutsbar">
         <!-- Previous page -->
         <button id="previousPage_shortcut" title="Go to previous page in the document">
            <span class="icon icon-sm previousIcon"></span>
         </button>
         <!-- Next page -->
         <button id="nextPage_shortcut" title="Go to next page in the document">
            <span class="icon icon-sm nextIcon"></span>
         </button>
         <div class="inputGroupContainer">
            <div class="input-group">
               <input id="pageNumber" type="text" class="form-control input-xs" title="Current page number" style="width: 50px; padding: 0; text-align: center" />
               <span id="pageCount" class="input-group-addon"></span>
            </div>
         </div>
         <span class="verticalDivider"></span>
         <!-- Zoom Out -->
         <button id="zoomOut_shortcut" title="Zoom out">
            <span class="icon icon-sm zoomOutIcon"></span>
         </button>
         <div class="inputGroupContainer">
            <div class="input-group">
               <select id="zoomValues" class="form-control input-xs">
                  <option id="currentZoomValue" style="display: none; visibility: hidden;" disabled></option>
                  <option>10%</option>
                  <option>25%</option>
                  <option>50%</option>
                  <option>75%</option>
                  <option>100%</option>
                  <option>125%</option>
                  <option>200%</option>
                  <option>400%</option>
                  <option>800%</option>
                  <option>1600%</option>
                  <option>2400%</option>
                  <option>3200%</option>
                  <option>6400%</option>
                  <option>Actual Size</option>
                  <option>Fit Page</option>
                  <option>Fit Width</option>
                  <option>Fit Height</option>
               </select>
            </div>
         </div>
         <!-- Zoom In -->
         <button id="zoomIn_shortcut" title="Zoom in">
            <span class="icon icon-sm zoomInIcon"></span>
         </button>
         <span class="verticalDivider"></span>
         <!-- Page size: actualSize, fit, or fit width -->
         <button id="actualSize_shortcut" title="Show the actual size of the page">
            <span class="icon icon-sm actualPageSizeIcon"></span>
         </button>
         <button id="fit_shortcut" title="Fit the image into the window">
            <span class="icon icon-sm page-FitIcon"></span>
         </button>
         <button id="fitWidth_shortcut" title="Fit the image width into the window">
            <span class="icon icon-sm fitWidthIcon"></span>
         </button>
         <span class="verticalDivider"></span>
         <!-- Document pages display -->
         <button id="singlePageDisplay_shortcut" title="Single page display">
            <span class="icon icon-sm singleLayoutIcon"></span>
         </button>
         <button id="doublePagesDisplay_shortcut" title="Double page display">
            <span class="icon icon-sm doubleLayoutIcon"></span>
         </button>
         <button id="verticalPagesDisplay_shortcut" title="Vertical page display">
            <span class="icon icon-sm verticalLayoutIcon"></span>
         </button>
         <button id="horizontalPagesDisplay_shortcut" title="Horizontal page display">
            <span class="icon icon-sm horizontalLayoutIcon"></span>
         </button>
         <span class="verticalDivider"></span>
         <!-- Interactive mode -->
         <button id="panZoomMode_shortcut" title="Pan and zoom">
            <span class="icon icon-sm panZoomIcon"></span>
         </button>
         <button id="panMode_shortcut" title="Pan">
            <span class="icon icon-sm panIcon"></span>
         </button>
         <button id="zoomMode_shortcut" title="Zoom">
            <span class="icon icon-sm zoomIcon"></span>
         </button>
         <button id="zoomToMode_shortcut" title="Zoom to">
            <span class="icon icon-sm zoomToIcon"></span>
         </button>
         <button id="magnifyGlassMode_shortcut" title="Magnify glass">
            <span class="icon icon-sm magnifyGlassIcon"></span>
         </button>
         <button id="selectTextMode_shortcut" title="Select text">
            <span class="icon icon-sm selectTextIcon"></span>
         </button>
         <button id="rubberBandInteractiveMode_shortcut">
            <span class="icon icon-sm selectAreaIcon"></span>
         </button>
         <button id="ocrSave_shortcut" title="Recognize document">
            <span class="icon icon-sm runModeIcon"></span>
         </button>
         <button id="processAllPages_shortcut" style="display:none;">
            <span class="icon icon-sm runModeIcon"></span>
         </button>
      </div>
   </div>

   <div id="navigationbar" class="navigationbar hide-for-print">
      <button id="showThumbnails" class="navigationbarBtn">
         <span class="icon thumbnailsIcon"></span>
      </button>
      <button id="showBookmarks" class="navigationbarBtn">
         <span class="icon bookmarksIcon"></span>
      </button>
      <button id="showAnnotationsListControls" class="navigationbarBtn annotations">
         <span class="icon annotationsIcon"></span>
      </button>
   </div>

   <div id="thumbnailsControl" class="affectedContainers hide-for-print">
      <div class="controlHeader">
         <label>Pages</label>
      </div>
      <div id="thumbnails">
      </div>
   </div>

   <div id="bookmarksControl" class="affectedContainers hide-for-print">
      <div class="controlHeader">
         <label>Bookmarks</label>
      </div>
      <div id="bookmarks">
         <ul id="bookmarksTree" class="tree"></ul>
      </div>
   </div>

   <div id="annotationsListControls" class="annotations hide-for-print">
      <div id="annotationslist" class="annotationsListContainer">

      </div>
   </div>

   <div id="annotationObjectBtnsContainer" class="annotations footerToolbar hide-for-print" style="height:auto;">
      <button class="annotationObjectBtn" title="Select" value="-1">
         <span class="icon selectIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Line" value="-2">
         <span class="icon lineIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Rectangle" value="-3">
         <span class="icon rectangleIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Ellipse" value="-4">
         <span class="icon ellipseIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Polyline" value="-5">
         <span class="icon polylineIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Polygon" value="-6">
         <span class="icon polygonIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Curve" value="-7">
         <span class="icon curveIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Closed Curve" value="-8">
         <span class="icon closedCurveIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Pointer" value="-9">
         <span class="icon pointerIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Freehand" value="-10">
         <span class="icon freehandIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Hilite" value="-11">
         <span class="icon hiliteIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text" value="-12">
         <span class="icon textIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text Pointer" value="-14">
         <span class="icon textPointerIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Note" value="-15">
         <span class="icon noteIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Stamp" value="-16">
         <span class="icon stampIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Rubber Stamp" value="-17">
         <span class="icon rubberStampIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Hotspot" value="-18">
         <span class="icon hotspotIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Freehand Hotspot" value="-19">
         <span class="icon freehandHotspotIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Point" value="-21">
         <span class="icon pointIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Redaction" value="-22">
         <span class="icon redactionIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Ruler" value="-23">
         <span class="icon rulerIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Poly Ruler" value="-24">
         <span class="icon polyRulerIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Protractor" value="-25">
         <span class="icon protractorIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Cross Product" value="-26">
         <span class="icon crossProductIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text Rollup" value="-13">
         <span class="icon textRollupIcon "></span>
      </button>
      <button class="annotationObjectBtn" title="Audio" value="-28">
         <span class="icon audioIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Video" value="-30">
         <span class="icon videoIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Encrypt" value="-27">
         <span class="icon lockIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text Hilite" value="-33">
         <span class="icon textHiliteIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text Strikeout" value="-34">
         <span class="icon textStrikeoutIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text Underline" value="-35">
         <span class="icon textUnderlineIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Text Redaction" value="-36">
         <span class="icon textRedactionIcon"></span>
      </button>
      <button class="annotationObjectBtn" title="Sticky Note" value="-32">
         <span class="icon stickyNoteIcon"></span>
      </button>
   </div>
   <div id="thumbnailsContextMenuParent" class="hide-for-print" tabindex="-1">
   </div>
   <div id="viewContextMenuParent" class="hide-for-print" tabindex="-1">
   </div>
   <!-- find text div -->
   <div id="findTextPanel" class="hide-for-print">
      <div class="inputGroupContainer">
         <div class="btn-group">
            <!-- Find options button -->
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Find Options">
               <span class="icon icon-sm settingsIcon"></span>
            </button>
            <!-- Menu Items -->
            <ul class="dropdown-menu" role="menu">
               <li>
                  <a>
                     <label class="checkbox-inline" style="width:100%;">
                        <input id="matchCase" type="checkbox" />
                        <label for="matchCase">Match case</label>
                     </label>
                  </a>
               </li>
               <li>
                  <a>
                     <label class="checkbox-inline" style="width:100%;">
                        <input id="wholeWordsOnly" type="checkbox" />
                        <label for="wholeWordsOnly">Whole words only</label>
                     </label>
                  </a>
               </li>
               <li class="divider"></li>
               <li>
                  <a>
                     <label class="checkbox-inline" style="width:100%;">
                        <input id="findInCurrentPageOnly" type="checkbox" />
                        <label id="findInCurrentPageOnlyLabel" for="findInCurrentPageOnly">Restrict to current page only</label>
                     </label>
                  </a>
               </li>
               <li>
                  <a>
                     <label class="checkbox-inline" style="width:100%;">
                        <input id="getTextForFind" type="checkbox" checked />
                        <label for="getTextForFind">Get text for pages as needed</label>
                     </label>
                  </a>
               </li>
               <li class="divider"></li>
               <li>
                  <a>
                     <label class="checkbox-inline" style="width:100%;">
                        <input id="findAllMatches" type="checkbox" checked />
                        <label for="findAllMatches">Highlight all</label>
                     </label>
                  </a>
               </li>
               <li>
                  <a>
                     <label class="checkbox-inline" style="width:100%;">
                        <input id="findLoop" type="checkbox" checked />
                        <label for="findLoop">Loop back to start</label>
                     </label>
                  </a>
               </li>
            </ul>
         </div>
         <div class="input-group inputGroupClose">
            <!-- Text to find input -->
            <input id="textToFind" type="text" class="form-control" placeholder="Find..." autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" />
            <div class="input-group-btn">
               <!-- Live search -->
               <button id="findLive" class="btn btn-default" title="Update results immediately while typing or changing options">
                  <span class="icon icon-sm rotateClockwiseIcon"></span>
               </button>
            </div>
         </div>
         <div class="btn-group">
            <!-- Find previous -->
            <button id="findPrevious" class="btn btn-default" title="Find Previous">
               <span class="icon icon-xs previous-xs-Icon"></span>
            </button>
            <!-- Find next -->
            <button id="findNext" class="btn btn-default" title="Find Next">
               <span class="icon icon-xs next-xs-Icon"></span>
            </button>
         </div>
         <div class="btn-group">
            <!-- Close find Panel -->
            <button id="closeFindPanel" class="btn btn-default">Close</button>
         </div>
      </div>
   </div>
   <div id="imageViewerContainer" class="affectedContainers hide-for-print">
      <!-- The viewer will be dynamically created inside imageViewerDiv -->
      <div id="imageViewerDiv">
      </div>
      <div id="tooltip" class="link-tooltip hide-for-print" tabindex="-1">
         <div id="tooltip_Title" class="link-tooltip-title">N/A</div>
         <div id="tooltip_Tip" class="link-tooltip-tip"><code>CTRL</code> <strong>&#43;</strong> <code>click</code> to follow link</div>
      </div>
   </div>
   <div data-comment="dialogs">
      <!-- About dialog -->
      <div id="dlgAbout" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3 id="dlgAbout_Title">Leadtools Document Viewer Demo</h3>
            </header>
            <div class="dlg-body modal-body">
               <div id="demoDescription" style="display:none">
                  <ul style="list-style-type:square">
                     <li>Upload and view any document, such as PDF, DOCX or TIFF</li>
                     <li>Convert and download to any supported document</li>
                     <li>View pages as SVG or raster image</li>
                     <li>Annotations support</li>
                     <li>Parse and select text using SVG and OCR technologies</li>
                     <li>Interactive modes including pan zoom, magnify glass, auto-pan and more</li>
                     <li>Multi-touch and gesture support for mobile devices and tablets</li>
                  </ul>
               </div>
               <div class="inline-center">
                  <div>Copyright © 1991-2018 All Rights Reserved.</div>
                  <div>LEAD Technologies, Inc.</div>
                  <img src="/com/leadtools/Resources/Images/LEAD.png" alt="LEADTOOLS" />
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Text results dialog -->
      <div id="dlgTextResults" class="dlg-container container">
         <div class="dlg-box dlg-desktop-l">
            <header>
               <h4 id="dlgTextResults_Title"></h4>
            </header>
            <div class="dlg-body modal-body">
               <textarea id="dlgTextResults_Results" rows="30"></textarea>
            </div>
            <div class="modal-footer">
<!--                <button class="btn btn-default dlg-rslt-convert">변환</button> -->
               <button class="btn btn-default" onClick="copyClipBoard();">복사</button>
               <button class="btn btn-default" onClick="goExcelDown();">엑셀다운로드</button>
               <button class="btn btn-default dlg-close">닫기</button>
            </div>
         </div>
      </div>
      <!-- Upload document dialog -->
      <div id="dlgUploadDoc" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>파일 열기</h3>
            </header>
            <div class="dlg-body modal-body">
               <div>
                  <h4 class="header-underline">문서</h4>
                  <div class="top-push">
                     <input id="dlgUploadDoc_DocumentFile" type="file" class="full-width">
                  </div>
               </div>
               <div class="top-push annotations">
                  <h4 class="header-underline">주석</h4>
                  <div class="form">
                     <div class="bottom-push">
                        <div class="radio">
                           <label><input type="radio" name="dlgUploadDoc_AnnotationsLoadOptions" value="0" checked>Do not load any annotations</label>
                        </div>
                        <div class="offset-right help-block">
                           <p>Annotations will not be loaded.</p>
                        </div>
                     </div>
                     <div class="bottom-push">
                        <div class="radio">
                           <label><input type="radio" name="dlgUploadDoc_AnnotationsLoadOptions" value="1">Load the annotations embedded in the document</label>
                        </div>
                        <div class="offset-right help-block">
                           <p>Some document formats such as PDF and TIFF can have embedded annotations inside the file itself. Select this option to load these annotations if they exist.</p>
                        </div>
                     </div>
                     <div>
                        <div class="radio">
                           <label><input type="radio" name="dlgUploadDoc_AnnotationsLoadOptions" value="2">Load the annotations from a local file</label>
                        </div>
                        <div class="offset-right help-block">
                           <p>Select this option if the annotations are stored in a local file, such as LEADTOOLS annotations stored in an XML file.</p>
                           <div>
                              <input id="dlgUploadDoc_AnnotationsFile" class="input-xs" type="file" style="width:100%;" disabled>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgUploadDoc_Upload" class="btn btn-default">Upload</button>
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Open from url dialog -->
      <div id="dlgOpenUrl" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Open From URL</h3>
            </header>
            <div class="dlg-body modal-body openFromUrl">
               <div class="form">
                  <div class="bottom-push">
                     <div class="radio">
                        <label><input type="radio" name="dlgOpenUrl_UrlOptions" value="0" checked>Select a sample document</label>
                     </div>
                     <div class="offset-right">
                        <select id="dlgOpenUrl_FileSelect" class="form-control">
                           <!-- Filled dynamically -->
                        </select>
                     </div>
                  </div>
                  <div class="bottom-push">
                     <div class="radio">
                        <label><input type="radio" name="dlgOpenUrl_UrlOptions" value="1">Enter a URL</label>
                     </div>
                     <div class="offset-right">
                        <div class="bottom-push">
                           <input id="dlgOpenUrl_FileUrl" type="text" class="form-control" value="https://demo.leadtools.com/images/pdf/leadtools.pdf" disabled />
                        </div>
                        <div class="bottom-push">
                           <h4 class="header-underline">Annotations</h4>
                           <div class="bottom-push">
                              <div class="radio">
                                 <label><input type="radio" name="dlgOpenUrl_AnnotationsLoadOptions" value="0" checked>Do not load any annotations</label>
                              </div>
                              <div class="offset-right">
                                 <p class="help-block">Annotations will not be loaded.</p>
                              </div>
                           </div>
                           <div class="bottom-push">
                              <div class="radio">
                                 <label><input type="radio" name="dlgOpenUrl_AnnotationsLoadOptions" value="1">Load the annotations embedded in the document</label>
                              </div>
                              <div class="offset-right">
                                 <p class="help-block">Some document formats such as PDF and TIFF can have embedded annotations inside the file itself. Select this option to load these annotations if they exist.</p>
                              </div>
                           </div>
                           <div class="bottom-push">
                              <div class="radio">
                                 <label><input type="radio" name="dlgOpenUrl_AnnotationsLoadOptions" value="2">Load the annotations from an external address</label>
                              </div>
                              <div class="offset-right">
                                 <p class="help-block">Select this option if the annotations are stored in an external address, such as LEADTOOLS annotations stored in an XML file.</p>
                                 <label for="dlgOpenUrl_AnnotationsUrl">Annotations URL:</label>
                                 <input id="dlgOpenUrl_AnnotationsUrl" type="text" class="form-control" disabled />
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgOpenUrl_Load" class="btn btn-default">Load</button>
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Print dialog -->
      <div id="dlgPrint" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Print Document</h3>
            </header>
            <div class="dlg-body modal-body">
               <div>
                  <h4 class="header-underline bottom-push">Pages</h4>
                  <p id="dlgPrint_MessageContainer"></p>
                  <div class="form">
                     <div class="radio">
                        <label><input id="dlgPrint_PageOption_0" type="radio" name="dlgPrint_PageOption" value="0" checked>Print All</label>
                     </div>
                     <div class="radio">
                        <label><input type="radio" name="dlgPrint_PageOption" value="1">Print Current<span id="dlgPrint_CurrentPageLabel"></span></label>
                     </div>
                     <div class="radio">
                        <div>
                           <label style="width:100%;">
                              <input type="radio" name="dlgPrint_PageOption" value="2">
                              <input id="dlgPrint_Pages" type="text" placeholder="e.g. 1-3, 5" class="form-control input-xs" />
                           </label>
                        </div>
                     </div>
                     <div class="radio">
                        <label><input type="radio" name="dlgPrint_PageOption" value="3">Print Visible Area<span id="dlgPrint_VisiblePagesLabel"></span></label>
                     </div>
                  </div>
               </div>
               <div class="top-push">
                  <h4 class="header-underline">Sizing</h4>
                  <p class="help-block">
                     The size of first page is<span id="dlgPrint_DocumentSize"></span>.
                     Pages are scaled to fit and centered within the container.
                  </p>
                  <div class="input-group">
                     <span class="input-group-addon">Page Size:</span>
                     <select id="dlgPrint_PageSize" class="form-control"></select>
                  </div>
               </div>
               <div class="top-push">
                  <h4 class="header-underline">Orientation</h4>
                  <div class="input-group">
                     <span class="input-group-addon">Container Orientation:</span>
                     <select id="dlgPrint_Orientation" class="form-control">
                        <option selected="selected" value="0">Portrait</option>
                        <option value="1">Landscape</option>
                     </select>
                  </div>
                  <p class="help-block">
                     The browser's print dialog will need to have an orientation set to match the above value.
                  </p>
                  <div class="top-push">
                     <input id="dlgPrint_Orientation_AutoRotate" type="checkbox" checked />
                     <label for="dlgPrint_Orientation_AutoRotate">Rotate page for best fit within container</label>
                  </div>
               </div>
               <div class="top-push">
                  <h4 class="header-underline">Additional Options</h4>
                  <div class="input-group top-push">
                     <span class="input-group-addon">DPI:</span>
                     <input id="dlgPrint_PageDpi" type="number" class="form-control" />
                  </div>
                  <div id="dlgPrint_ShowAnnotationsContainer" class="top-push">
                     <input id="dlgPrint_ShowAnnotations" type="checkbox" checked />
                     <label for="dlgPrint_ShowAnnotations">Show Annotations</label>
                  </div>
                  <div id="dlgPrint_RemoveMarginsContainer" class="top-push">
                     <input id="dlgPrint_RemoveMargins" type="checkbox" checked />
                     <label for="dlgPrint_RemoveMargins">Remove Margins</label>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgPrint_Print" class="btn btn-default">Print</button>
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Open from cloud storage dialog -->
      <div id="dlgOpenCloud" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Open From Cloud Storage</h3>
            </header>
            <div class="dlg-body modal-body">
               <p id="dlgOpenCloud_InfoText" class="text-center alert alert-warning"></p>
               <div class="top-push">
                  <h4 class="header-underline">Document</h4>
                  <div class="top-push">
                     <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                           <button id="dlgOpenCloud_Document_OneDrive" type="button" class="btn btn-default">OneDrive</button>
                        </div>
                        <div class="btn-group">
                           <button id="dlgOpenCloud_Document_SharePoint" type="button" class="btn btn-default">SharePoint</button>
                        </div>
                        <div class="btn-group">
                           <button id="dlgOpenCloud_Document_GoogleDrive" type="button" class="btn btn-default">Google Drive</button>
                        </div>
                     </div>
                     <p id="dlgOpenCloud_Document_File" class="top-push inline-center"></p>
                  </div>
               </div>
               <div class="top-push">
                  <h4 class="header-underline">Annotations</h4>
                  <div class="form">
                     <div class="bottom-push">
                        <div class="radio">
                           <label><input type="radio" name="dlgOpenCloud_Annotations_LoadOptions" value="0" checked>Do not load any annotations</label>
                        </div>
                        <div class="offset-right help-block">
                           <p>Annotations will not be loaded.</p>
                        </div>
                     </div>
                     <div class="bottom-push">
                        <div class="radio">
                           <label><input type="radio" name="dlgOpenCloud_Annotations_LoadOptions" value="1">Load the annotations embedded in the document</label>
                        </div>
                        <div class="offset-right help-block">
                           <p>Some document formats such as PDF and TIFF can have embedded annotations inside the file itself. Select this option to load these annotations if they exist.</p>
                        </div>
                     </div>
                     <div>
                        <div class="radio">
                           <label><input type="radio" name="dlgOpenCloud_Annotations_LoadOptions" value="2">Load the annotations from a local file</label>
                        </div>
                        <div class="offset-right help-block">
                           <p>Select this option if the annotations are stored in a local file, such as LEADTOOLS annotations stored in an XML file.</p>
                           <div class="btn-group btn-group-justified">
                              <div class="btn-group">
                                 <button id="dlgOpenCloud_Annotations_OneDrive" type="button" class="btn btn-default" disabled>OneDrive</button>
                              </div>
                              <div class="btn-group">
                                 <button id="dlgOpenCloud_Annotations_SharePoint" type="button" class="btn btn-default" disabled>SharePoint</button>
                              </div>
                              <div class="btn-group">
                                 <button id="dlgOpenCloud_Annotations_GoogleDrive" type="button" class="btn btn-default" disabled>Google Drive</button>
                              </div>
                           </div>
                           <p id="dlgOpenCloud_Annotations_File" class="top-push inline-center"></p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgOpenCloud_Load" class="btn btn-default">Load</button>
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!--  Document converter dialog -->
      <div id="dlgConvert" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>문서 내보내기</h3>
            </header>
            <div class="dlg-body modal-body">
               <ul class="nav nav-tabs">
                  <li class="active"><a id="dlgConvert_TabBtn_Document" href="#dlgConvert_DocumentTab" data-toggle="tab">문서</a></li>
                  <li><a id="dlgConvert_TabBtn_Options" href="#dlgConvert_OptionsTab" data-toggle="tab">옵션</a></li>
                  <li class="dlg-tab-btn"><a id="dlgConvert_TabBtn_Quick" href="#dlgConvert_QuickBtn" data-toggle="tab">빠른 내보내기</a></li>
               </ul>
               <div class="tab-content top-push">
                  <div class="tab-pane active" id="dlgConvert_DocumentTab">
                     <h4 class="header-underline">페이지</h4>
                     <div>
                        <!-- <p class="help-block top-push inline-center">
                           This demo application has a conversion limit of 10 pages.
                           This limit can be removed via the service configuration file.
                           Disabled pages are not included in conversion.
                        </p> -->
                        <div class="input-group top-push">
                           <span class="input-group-addon">시작 페이지:</span>
                           <input id="dlgConvert_Input_Start" type="number" class="form-control" value="1">
                           <span class="input-group-btn">
                              <button id="dlgConvert_Input_MakeFirst" class="btn btn-default" type="button">Reset</button>
                           </span>
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">마지막 페이지:</span>
                           <input id="dlgConvert_Input_End" type="number" class="form-control">
                           <span class="input-group-btn">
                              <button id="dlgConvert_Input_MakeLast" class="btn btn-default" type="button">Reset</button>
                           </span>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">포맷</h4>
                        <div class="top-push">
                           <div class="input-group bottom-push-inner">
                              <span class="input-group-addon">타입:</span>
                              <select id="dlgConvert_Format_TypeSelect" class="form-control">
                                 <option selected="selected" value="document">문서</option>
                                 <option value="raster">래스터 이미지</option>
                              </select>
                           </div>
                           <div id="dlgConvert_Format_DocumentContainer" class="input-group dlg-convert-mobile-sm">
                              <select id="dlgConvert_Format_DocumentSelect" class="form-control"></select>
                              <span class="input-group-btn">
                                 <button class="btn btn-default" id="dlgConvert_Format_DocumentOptions">옵션</button>
                              </span>
                           </div>
                           <div id="dlgConvert_Format_RasterContainer">
                              <select id="dlgConvert_Format_RasterSelect" class="form-control"></select>
                           </div>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">주석</h4>
                        <div class="top-push">
                           <select id="dlgConvert_AnnotationsSelect" class="form-control">
                              <option value="0">내보내지 않음</option>
                              <option value="1">외부파일로 내보내기</option>
                              <option value="2">덮어씌우기 (래스터 이미지 포맷만)</option>
                              <option value="3">출력 파일에 내용 포함 (PDF 와 TIF만)</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgConvert_OptionsTab">
                     <div>
                        <h4 class="header-underline">일반</h4>
                        <div class="top-push">
                           <div class="input-group">
                              <span class="input-group-addon">작업 이름:</span>
                              <input id="dlgConvert_Options_JobName" type="text" class="form-control" />
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">빈페이지 처리:</span>
                              <select id="dlgConvert_Options_EmptyPageMode" class="form-control">
                                 <option value="0">아무것도 하지 않음</option>
                                 <option value="1">스킵</option>
                                 <option value="2">스킵 및 주석 무시</option>
                              </select>
                           </div>
                           <div class="top-push">
                              <input id="dlgConvert_Options_JobErrorMode" type="checkbox" />
                              <label for="dlgConvert_Options_JobErrorMode">복구가능한 에러 발생시 계속 변환</label>
                           </div>
                           <div class="input-group dlg-convert-mobile-sm top-push">
                              <span class="input-group-addon">넘버링:</span>
                              <input id="dlgConvert_Options_PageNumberingTemplate" type="text" class="form-control" />
                           </div>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">SVG</h4>
                        <div>
                           <div class="top-push">
                              <input id="dlgConvert_Options_UseSvgConversion" type="checkbox" />
                              <label for="dlgConvert_Options_UseSvgConversion">가능한 경우 SVG 변환</label>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">SVG 이미지 인식:</span>
                              <select id="dlgConvert_Options_SvgImagesRecognitionMode" class="form-control">
                                 <option value="0">자동</option>
                                 <option value="1">사용안함</option>
                                 <option value="2">항상사용</option>
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">보정</h4>
                        <div>
                           <input id="dlgConvert_Options_PreprocessorDeskew" type="checkbox" />
                           <label for="dlgConvert_Options_PreprocessorDeskew">기울기 보정</label>
                        </div>
                        <div>
                           <input id="dlgConvert_Options_PreprocessorInvert" type="checkbox" />
                           <label for="dlgConvert_Options_PreprocessorInvert">뒤집힘 보정</label>
                        </div>
                        <div>
                           <input id="dlgConvert_Options_PreprocessorOrient" type="checkbox" />
                           <label for="dlgConvert_Options_PreprocessorOrient">회전 보정</label>
                        </div>
                     </div>
                     <div>
                        <hr />
                        <button id="dlgConvert_Options_RevertToDefaults" type="button" class="btn btn-default">기본설정으로 변환</button>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgConvert_QuickBtn">
                     <h4 class="header-underline">빠른 내보내기</h4>
                     <p>문서 또는 주석의 캐시로 변환 없이 빠르게 다운받을 수 있습니다.</p>
                     <p>캐시 식별자: <strong id="dlgConvert_Quick_Id"></strong></p>
                     <div class="top-push">
                        <div class="content-space">
                           <input id="dlgConvert_Quick_IncludeDocument" type="checkbox" checked />
                           <label for="dlgConvert_Quick_IncludeDocument">문서 포함</label>
                        </div>
                        <div class="content-space">
                           <input id="dlgConvert_Quick_IncludeAnnotations" type="checkbox" checked />
                           <label for="dlgConvert_Quick_IncludeAnnotations">주석 포함</label>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgConvert_Convert" class="btn btn-default">내보내기</button>
               <a id="dlgConvert_Quick_LinkBtn" href="javascript:void(0);" target="_blank" rel="noopener noreferrer" class="btn btn-default">빠르게 내보내기</a>
               <button class="btn btn-default dlg-close">닫기</button>
            </div>
         </div>
      </div>
      <!-- Document formats options dialog -->
      <div id="dlgDocFormatOpts" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>문서 포맷 옵션</h3>
               <h4 id="dlgDocFormatOpts_Title"></h4>
            </header>
            <div class="dlg-body modal-body">
               <div id="dlgDocFormatOpts_PDF" class="dlg-format-opts-container">
                  <div class="input-group">
                     <span class="input-group-addon">PDF 타입:</span>
                     <select id="dlgDocFormatOpts_PDF_DocumentSelect" class="form-control">
                        <option value="0">Pdf</option>
                        <option value="1">PdfA</option>
                        <option value="2">Pdf12</option>
                        <option value="3">Pdf13</option>
                        <option value="4">Pdf15</option>
                        <option value="5">Pdf16</option>
                     </select>
                  </div>
                  <div class="top-push">
                     <input id="dlgDocFormatOpts_PDF_ImageOverText" type="checkbox" />
                     <label for="dlgDocFormatOpts_PDF_ImageOverText">텍스트 오버 이미지</label>
                  </div>
                  <div class="top-push">
                     <button id="dlgDocFormatOpts_PDF_AdvancedOptions" type="button" class="btn btn-default">고급</button>
                  </div>
               </div>
               <div id="dlgDocFormatOpts_DOCX" class="dlg-format-opts-container">
                  <div>
                     <input id="dlgDocFormatOpts_DOCX_FrameText" type="checkbox" />
                     <label for="dlgDocFormatOpts_DOCX_FrameText">프레임 텍스트</label>
                  </div>
                  <p class="help-block inline-center">
                     	이 형식은 텍스트 흐름을 사용합니다. 프레임을 사용하면 문서 작성자가 절대 (X 및 Y) 위치 매개 변수를 사용하여 객체를 배치 할 수 있기 때문에 입력 문서와 생성 된 문서 사이의 유사성을 극대화 할 수 있습니다.
                  </p>
               </div>
               <div id="dlgDocFormatOpts_RTF" class="dlg-format-opts-container">
                  <div>
                     <input id="dlgDocFormatOpts_RTF_FrameText" type="checkbox" />
                     <label for="dlgDocFormatOpts_RTF_FrameText">프레임 텍스트</label>
                  </div>
                  <p class="help-block inline-center">
                     	이 형식은 텍스트 흐름을 사용합니다. 프레임을 사용하면 문서 작성자가 절대 (X 및 Y) 위치 매개 변수를 사용하여 객체를 배치 할 수 있기 때문에 입력 문서와 생성 된 문서 사이의 유사성을 극대화 할 수 있습니다.
                  </p>
               </div>
               <div id="dlgDocFormatOpts_TXT" class="dlg-format-opts-container">
                  <div class="input-group">
                     <span class="input-group-addon">인코딩:</span>
                     <select id="dlgDocFormatOpts_TXT_DocumentSelect" class="form-control">
                        <option value="0">Ansi</option>
                        <option value="1">Unicode</option>
                        <option value="2">Unicode Big Endian</option>
                        <option value="3">UTF8</option>
                     </select>
                  </div>
                  <div class="top-push">
                     <input id="dlgDocFormatOpts_TXT_AddPageNumber" type="checkbox" />
                     <label for="dlgDocFormatOpts_TXT_AddPageNumber">페이지 번호 추가</label>
                  </div>
                  <div class="top-push">
                     <input id="dlgDocFormatOpts_TXT_AddPageBreak" type="checkbox" />
                     <label for="dlgDocFormatOpts_TXT_AddPageBreak">페이지 나누기 추가</label>
                  </div>
                  <div class="top-push">
                     <input id="dlgDocFormatOpts_TXT_Formatted" type="checkbox" />
                     <label for="dlgDocFormatOpts_TXT_Formatted">서식 지정됨</label>
                  </div>
               </div>
               <div id="dlgDocFormatOpts_DOC" class="dlg-format-opts-container">
                  <div>
                     <input id="dlgDocFormatOpts_DOC_FrameText" type="checkbox" />
                     <label for="dlgDocFormatOpts_DOC_FrameText">프레임 텍스트</label>
                  </div>
                  <p class="help-block inline-center">
                     	이 형식은 텍스트 흐름을 사용합니다. 프레임을 사용하면 문서 작성자가 절대 (X 및 Y) 위치 매개 변수를 사용하여 객체를 배치 할 수 있기 때문에 입력 문서와 생성 된 문서 사이의 유사성을 극대화 할 수 있습니다.
                  </p>
               </div>
               <div id="dlgDocFormatOpts_HTM" class="dlg-format-opts-container">
                  <div class="input-group">
                     <span class="input-group-addon">폰트 삽입모드:</span>
                     <select id="dlgDocFormatOpts_HTM_EmbedFontMode" class="form-control">
                        <option value="0">없음</option>
                        <option value="1">자동</option>
                        <option value="2">강제</option>
                        <option value="3">전체</option>
                     </select>
                  </div>
                  <div class="top-push">
                     <input id="dlgDocFormatOpts_HTM_UseBackgroundColor" type="checkbox" />
                     <label for="dlgDocFormatOpts_HTM_UseBackgroundColor">배경 색깔</label>
                  </div>
                  <div class="top-push">
                     <input id="dlgDocFormatOpts_HTM_BackgroundColor" readonly>
                  </div>
               </div>
               <div id="dlgDocFormatOpts_EMF" class="dlg-format-opts-container">
                  <p class="help-block inline-center">
						EMF 형식은 여러 페이지를 지원하지 않습니다. 여러 페이지로 된 문서를 EMF에 저장하면 결과는 마지막 페이지에만 적용됩니다.
                  </p>
               </div>
               <div id="dlgDocFormatOpts_NONE" class="dlg-format-opts-container">
                  <p class="help-block inline-center">
                   		이 형식에는 추가 옵션이 없습니다.
                  </p>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgDocFormatOpts_Apply" class="btn btn-default">적용</button>
               <button class="btn btn-default dlg-close">닫기</button>
            </div>
         </div>
      </div>
      <!--  Advanced PDF options dialog -->
      <div id="dlgAdvancedPDF" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>PDF 고급 옵션</h3>
            </header>
            <div class="dlg-body modal-body">
               <ul id="dlgAdvancedPDF_Tabs" class="nav nav-tabs">
                  <li class="active"><a href="#dlgAdvancedPDF_DescriptionTab" data-toggle="tab">설명</a></li>
                  <li><a href="#dlgAdvancedPDF_FontTab" data-toggle="tab">폰트</a></li>
                  <li><a href="#dlgAdvancedPDF_SecurityTab" data-toggle="tab">보안</a></li>
                  <li><a href="#dlgAdvancedPDF_CompressionTab" data-toggle="tab">압축</a></li>
                  <li><a href="#dlgAdvancedPDF_InitialViewTab" data-toggle="tab">초기 화면</a></li>
               </ul>
               <div class="tab-content top-push">
                  <div class="tab-pane active" id="dlgAdvancedPDF_DescriptionTab">
                     <h4 class="header-underline">설명</h4>
                     <div class="top-push">
                        <div class="input-group">
                           <span class="input-group-addon">표제</span>
                           <input id="dlgAdvancedPDF_Desc_Title" type="text" class="form-control" />
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">제목</span>
                           <input id="dlgAdvancedPDF_Desc_Subject" type="text" class="form-control" />
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">저자</span>
                           <input id="dlgAdvancedPDF_Desc_Author" type="text" class="form-control" />
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">키워드</span>
                           <input id="dlgAdvancedPDF_Desc_Keywords" type="text" class="form-control" />
                        </div>
                        <p class="help-block">
							키워드는 쉼표 또는 점으로 구분할 수 있습니다.
                        </p>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgAdvancedPDF_FontTab">
                     <h4 class="header-underline">폰트</h4>
                     <div class="top-push">
                        <div class="input-group">
                           <span class="input-group-addon">방식</span>
                           <select id="dlgAdvancedPDF_Font_FontEmbedding" class="form-control">
                              <option value="0">없음</option>
                              <option value="1">자동</option>
                              <option value="2">강제</option>
                              <option value="3">전체</option>
                           </select>
                        </div>
                        <div class="top-push">
                           <input id="dlgAdvancedPDF_Font_Linearized" type="checkbox" />
                           <label for="dlgAdvancedPDF_Font_Linearized">빠른 웹뷰 (Linearized PDF)</label>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgAdvancedPDF_SecurityTab">
                     <h4 class="header-underline">보안</h4>
                     <div class="top-push">
                        <div>
                           <input id="dlgAdvancedPDF_Security_ProtectedDocument" type="checkbox" class="dlg-advanced-pdf-security" />
                           <label for="dlgAdvancedPDF_Security_ProtectedDocument">문서 보호</label>
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">암호화 모드</span>
                           <select id="dlgAdvancedPDF_Security_EncryptionMode" class="form-control dlg-advanced-pdf-security">
                              <option value="0">RC40Bit</option>
                              <option value="1">RC128Bit</option>
                           </select>
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">사용자 비밀번호</span>
                           <input id="dlgAdvancedPDF_Security_UserPassword" type="password" class="form-control dlg-advanced-pdf-security" />
                        </div>
                        <div class="input-group top-push">
                           <span class="input-group-addon">Owner 비밀번호</span>
                           <input id="dlgAdvancedPDF_Security_OwnerPassword" type="password" class="form-control dlg-advanced-pdf-security" />
                        </div>
                        <div class="top-push">
                           <div>
                              <input id="dlgAdvancedPDF_Security_CopyEnabled" type="checkbox" class="dlg-advanced-pdf-security dlg-advanced-pdf-security-permissions" />
                              <label for="dlgAdvancedPDF_Security_CopyEnabled">문서 및 텍스트 추출에 사본 사용</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Security_EditEnabled" type="checkbox" class="dlg-advanced-pdf-security dlg-advanced-pdf-security-permissions" />
                              <label for="dlgAdvancedPDF_Security_EditEnabled">문서 편집 사용</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Security_AnnotationsEnabled" type="checkbox" class="dlg-advanced-pdf-security dlg-advanced-pdf-security-permissions" />
                              <label for="dlgAdvancedPDF_Security_AnnotationsEnabled">첨언 및 주석 사용</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Security_PrintEnabled" type="checkbox" class="dlg-advanced-pdf-security dlg-advanced-pdf-security-permissions" />
                              <label for="dlgAdvancedPDF_Security_PrintEnabled">인쇄 사용</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Security_AssemblyEnabled" type="checkbox" class="dlg-advanced-pdf-security dlg-advanced-pdf-security-permissions" />
                              <label for="dlgAdvancedPDF_Security_AssemblyEnabled">문서 어셈블리 사용</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Security_HighQualityPrintEnabled" type="checkbox" class="dlg-advanced-pdf-security dlg-advanced-pdf-security-permissions" />
                              <label for="dlgAdvancedPDF_Security_HighQualityPrintEnabled">고품질 인쇄 사용</label>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgAdvancedPDF_CompressionTab">
                     <div>
                        <h4 class="header-underline">압축</h4>
                        <div class="top-push">
                           <div class="input-group">
                              <span class="input-group-addon">1-Bit 이미지:</span>
                              <select id="dlgAdvancedPDF_Compress_OneBitImageCompression" class="form-control">
                                 <option value="0">Flate</option>
                                 <option value="1">FaxG31D</option>
                                 <option value="2">faxG32D</option>
                                 <option value="3">faxG4</option>
                                 <option value="4">Lzw</option>
                                 <option value="5">Jbig2</option>
                              </select>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">컬러 이미지:</span>
                              <select id="dlgAdvancedPDF_Compress_ColoredImageCompression" class="form-control">
                                 <option value="0">FlateJpeg</option>
                                 <option value="1">LzwJpeg</option>
                                 <option value="2">Flate</option>
                                 <option value="3">Lzw</option>
                                 <option value="4">Jpeg</option>
                                 <option value="5">FlateJpx</option>
                                 <option value="6">LzwJpx</option>
                                 <option value="7">Jpx</option>
                              </select>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">품질 계수:</span>
                              <input id="dlgAdvancedPDF_Compress_QualityFactor" type="text" class="form-control" />
                           </div>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">이미지 오버 텍스트 압축</h4>
                        <div class="top-push">
                           <div class="input-group">
                              <span class="input-group-addon">사이즈:</span>
                              <select id="dlgAdvancedPDF_Compress_ImageOverTextSize" class="form-control">
                                 <option value="0">원본</option>
                                 <option value="1">절반</option>
                                 <option value="2">1/4</option>
                              </select>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">모드:</span>
                              <select id="dlgAdvancedPDF_Compress_ImageOverTextMode" class="form-control">
                                 <option value="0">없음</option>
                                 <option value="1">엄격</option>
                                 <option value="2">느슨</option>
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgAdvancedPDF_InitialViewTab">
                     <div>
                        <h4 class="header-underline">레이아웃 및 페이지 모드</h4>
                        <div class="top-push">
                           <div class="input-group">
                              <span class="input-group-addon">페이지 모드:</span>
                              <select id="dlgAdvancedPDF_Init_DocumentPageModeType" class="form-control">
                                 <option value="0">페이지만</option>
                                 <option value="1">페이지 와 북마크</option>
                                 <option value="2">페이지와 썸네일</option>
                                 <option value="3">전체 화면</option>
                                 <option value="4">레이어와 페이지</option>
                                 <option value="5">페이지와 첨부파일</option>
                              </select>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">페이지 레이아웃:</span>
                              <select id="dlgAdvancedPDF_Init_DocumentPageLayoutType" class="form-control">
                                 <option value="0">단일 페이지 표시</option>
                                 <option value="1">한개 컬럼 표시</option>
                                 <option value="2">두개 컬럼 왼쪽 표시</option>
                                 <option value="3">두개 컬럼 오른쪽 표시</option>
                                 <option value="4">두개 페이지 왼쪽</option>
                                 <option value="5">두개 페이지 오른쪽</option>
                              </select>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">페이지 맞춤:</span>
                              <select id="dlgAdvancedPDF_Init_DocumentPageFitType" class="form-control">
                                 <option value="0">기본값</option>
                                 <option value="1">너비에 맞춤</option>
                                 <option value="2">높이에 맞춤</option>
                                 <option value="3">너비 경계에 맞춤</option>
                                 <option value="4">높이 경계에 맞춤</option>
                                 <option value="5">경계에 맞춤</option>
                                 <option value="25">25 %</option>
                                 <option value="50">50 %</option>
                                 <option value="75">75 %</option>
                                 <option value="100">100 %</option>
                                 <option value="125">125 %</option>
                                 <option value="150">150 %</option>
                                 <option value="200">200 %</option>
                                 <option value="400">400 %</option>
                                 <option value="800">800 %</option>
                                 <option value="1600">1600 %</option>
                                 <option value="2400">2400 %</option>
                                 <option value="3200">3200 %</option>
                                 <option value="6400">6400 %</option>
                              </select>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">페이지 열기:</span>
                              <input id="dlgAdvancedPDF_Init_InitialPageNumber" type="number" class="form-control" />
                              <span id="dlgAdvancedPDF_Init_TotalPages" class="input-group-addon"></span>
                           </div>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">창</h4>
                        <div class="top-push">
                           <div>
                              <input id="dlgAdvancedPDF_Init_FitWindow" type="checkbox" />
                              <label for="dlgAdvancedPDF_Init_FitWindow">초기 페이지 크기로 창을 변환</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Init_CenterWindow" type="checkbox" />
                              <label for="dlgAdvancedPDF_Init_CenterWindow">화면 중앙 창</label>
                           </div>
                           <div class="input-group top-push">
                              <span class="input-group-addon">표시:</span>
                              <select id="dlgAdvancedPDF_Init_DisplayDocTitle" class="form-control">
                                 <option value="0">파일 이름</option>
                                 <option value="1">문서 표제</option>
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="top-push">
                        <h4 class="header-underline">유저 인터페이스</h4>
                        <div class="top-push">
                           <div>
                              <input id="dlgAdvancedPDF_Init_HideMenubar" type="checkbox" />
                              <label for="dlgAdvancedPDF_Init_HideMenubar">숨김 메뉴바</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Init_HideToolbar" type="checkbox" />
                              <label for="dlgAdvancedPDF_Init_HideToolbar">숨김 툴바</label>
                           </div>
                           <div>
                              <input id="dlgAdvancedPDF_Init_HideWindowUI" type="checkbox" />
                              <label for="dlgAdvancedPDF_Init_HideWindowUI">숨김 창 컨트롤</label>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgAdvancedPDF_Apply" class="btn btn-default">적용</button>
               <button class="btn btn-default dlg-close">닫기</button>
            </div>
         </div>
      </div>
      <!--  Save to dialog -->
      <div id="dlgExportSave" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Export Items</h3>
            </header>
            <div class="dlg-body modal-body">
               <h4 id="dlgExportSave_Cache_Header" class="header-underline">Cache</h4>
               <div id="dlgExportSave_Cache">
                  <p class="help-block">This conversion result was added to the cache with the below identifier.</p>
                  <input id="dlgExportSave_Cache_Input" class="form-control" type="text" readonly />
               </div>
               <div id="dlgExportSave_Export_Header" class="top-push"><h4 class="header-underline">Export</h4></div>
               <div id="dlgExportSave_Export">
                  <div class="input-group">
                     <span class="input-group-addon">Name:</span>
                     <input id="dlgExportSave_FileName" type="text" class="form-control" />
                  </div>
                  <p class="help-block">This name will be used for all options except Local Save.</p>
                  <p id="dlgExportSave_Message" class="text-center alert alert-warning top-push"></p>
                  <div id="dlgExportSave_Group" class="btn-group btn-group-justified top-push">
                     <div class="btn-group">
                        <button type="button" id="dlgExportSave_LocalSave" class="btn btn-default">Local Save</button>
                     </div>
                     <div class="btn-group">
                        <button type="button" id="dlgExportSave_SaveToOneDrive" class="btn btn-default">OneDrive</button>
                     </div>
                     <div class="btn-group">
                        <button type="button" id="dlgExportSave_SaveToSharePoint" class="btn btn-default">SharePoint</button>
                     </div>
                     <div class="btn-group">
                        <button type="button" id="dlgExportSave_SaveToGoogleDrive" class="btn btn-default">Google Drive</button>
                     </div>
                  </div>
                  <div class="top-push">
                     <div class="inline-center">
                        <img id="dlgExportSave_FileSaving" src="/com/leadtools/Resources/Images/Loading.gif" />
                     </div>
                     <div id="dlgExportSave_GoogleSaveContainer" class="input-group">
                        <p class="help-block">
                           If you experience issues saving to Google Drive, you may need to disable ad blocker browser plugins or change your browser cookie restrictions.
                           Disabling browser plugins may cause the browser page to refresh, so save this document locally first or copy the document's cache ID.
                        </p>
                        <div id="googleSaveButtonContainer"></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgExportSave_CloseNext" class="btn btn-default">Close</button>
            </div>
         </div>
      </div>
      <!-- Export Job Dialog -->
      <div id="dlgExportJob" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Export</h3>
            </header>
            <div class="dlg-body modal-body">
               <div>
                  <h4 class="header-underline">URI</h4>
                  <p class="help-block">
                     This conversion result was added to the cache with the below identifier.
                     Click "Load" to unload the current document, close this dialog, and load this conversion result.
                  </p>
                  <div class="input-group">
                     <input id="dlgExportJob_Uri_Input" class="form-control" type="text" readonly />
                     <span class="input-group-btn">
                        <button id="dlgExportJob_Uri_Load" class="btn btn-default" type="button">Load</button>
                     </span>
                  </div>
               </div>
               <div class="top-push">
                  <h4 class="header-underline">Export</h4>
                  <a id="dlgExportJob_LocalSave" href="javascript:void(0);" target="_blank" rel="noopener noreferrer" class="btn btn-default">Local Save</a>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Pages Rotation dialog -->
      <div id="dlgPageRotation" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Page Rotation</h3>
            </header>
            <div class="dlg-body modal-body">
               <div class="bottom-push">
                  <p class="help-block">
                     Page rotations will be saved to the cache and applied during document export.
                  </p>
               </div>
               <div>
                  <h4 class="header-underline">Direction</h4>
                  <div class="offset-right">
                     <select id="dlgPageRotation_DirectionSelect" class="form-control"></select>
                  </div>
               </div>
               <div class="top-push bottom-push">
                  <h4 class="header-underline bottom-push">Range</h4>
                  <div class="form offset-right">
                     <div class="radio">
                        <label><input type="radio" name="dlgPageRotation_RangeOption" value="0" checked>All Pages (<span id="dlgPageRotation_PageCount">N/A</span>)</label>
                     </div>
                     <div class="radio">
                        <label><input type="radio" name="dlgPageRotation_RangeOption" value="1">Current (Page <span id="dlgPageRotation_CurrentPage">N/A</span>)</label>
                     </div>
                     <div class="radio">
                        <label style="width:100%;">
                           <input type="radio" name="dlgPageRotation_RangeOption" value="2">
                           <input id="dlgPageRotation_CustomRange" type="text" placeholder="e.g. 1-3, 5" class="form-control input-xs" />
                        </label>
                     </div>
                     <div class="top-push">
                        <h5 class="header-underline">Range Conditions</h5>
                        <div class="bottom-push"><select id="dlgPageRotation_Condition_EvenOddSelect" class="form-control"></select></div>
                        <div><select id="dlgPageRotation_Condition_OrientationSelect" class="form-control"></select></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgPageRotation_Apply" class="btn btn-default">Apply</button>
               <button class="btn btn-default dlg-close">Cancel</button>
            </div>
         </div>
      </div>
      <!--  Pages dialog -->
      <div id="dlgPages" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3 id="dlgPages_Title">Pages</h3>
            </header>
            <div class="dlg-body modal-body">
               <div class="bottom-push">
                  <p id="dlgPages_Description"></p>
               </div>
               <div class="bottom-push">
                  <input id="dlgPages_AllPages" type="checkbox" />
                  <label for="dlgPages_AllPages">Run on all pages (<span id="dlgPages_PageCount">N/A</span>)</label>
               </div>
               <div class="input-group">
                  <label for="dlgPages_PageNumberInput" class="input-group-addon">Page Number (Current: <span id="dlgPages_CurrentPage">N/A</span>)</label>
                  <input id="dlgPages_PageNumberInput" type="text" class="form-control" />
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgPages_Apply" class="btn btn-default">Apply</button>
               <button class="btn btn-default dlg-close">Cancel</button>
            </div>
         </div>
      </div>
      <!-- Document properties dialog -->
      <div id="dlgDocumentProperties" class="dlg-container container">
         <div class="dlg-box dlg-desktop-l">
            <header>
               <h3>Document Properties</h3>
            </header>
            <div class="dlg-body modal-body">
               <ul class="nav nav-tabs">
                  <li class="active"><a href="#dlgDocumentProperties_PropertiesTab" data-toggle="tab">Properties</a></li>
                  <li><a href="#dlgDocumentProperties_MetadataTab" data-toggle="tab">Metadata</a></li>
               </ul>
               <div class="tab-content">
                  <div class="tab-pane active" id="dlgDocumentProperties_PropertiesTab">
                     <div class="table-responsive top-push">
                        <table class="table table-bordered">
                           <thead>
                              <tr>
                                 <td>Key</td>
                                 <td>Value</td>
                              </tr>
                           </thead>
                           <tbody id="dlgDocumentProperties_Properties"></tbody>
                        </table>
                     </div>
                  </div>
                  <div class="tab-pane" id="dlgDocumentProperties_MetadataTab">
                     <div class="table-responsive top-push">
                        <table class="table table-bordered">
                           <thead>
                              <tr>
                                 <td>Key</td>
                                 <td>Value</td>
                              </tr>
                           </thead>
                           <tbody id="dlgDocumentProperties_Metadata"></tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Processing pages dialog (Barcode results) -->
      <div id="dlgProcessPages" class="dlg-container container dlg-process-pages">
         <div class="dlg-box dlg-desktop-l">
            <header>
               <h3><strong class="process-name">[Process]</strong> for <strong class="process-pages">#</strong> page(s)</h3>
            </header>
            <div class="dlg-body modal-body">
               <h4><span class="process-status"></span><img id="documentLoading" class="process-loading" src="/com/leadtools/Resources/Images/Loading.gif" /></h4>
               <h5 class="process-summary"></h5>
               <div class="process-content"></div>
               <button class="process-cancel btn btn-default">Cancel</button>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!--  Custom Render Mode dialog -->
      <div id="dlgCustomRenderMode" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Customize Render Mode</h3>
            </header>
            <div class="dlg-body modal-body">
               <div class="form-group">
                  Use the two lists below to customize which annotations objects should be visible in the render mode.
                  For example, you can modify the render mode to only show the redaction objects used to hide text from users without the correct security privileges.
               </div>
               <div class="row">
                  <div class="col-xs-6">
                     <label class="pull-left">Visible Objects</label>
                     <select id="dlgCustomRenderMode_VisibleObjectSelect" class="form-control listbox form-group" multiple="multiple" size="15"></select>
                     <button id="dlgCustomRenderMode_MoveToInvisible" type="button" class="btn btn-default pull-right">&gt;&gt;</button>
                  </div>
                  <div class="col-xs-6">
                     <label class="pull-right">Invisible Objects</label>
                     <select id="dlgCustomRenderMode_InvisibleObjectSelect" class="form-control listbox form-group" multiple="multiple" size="15"></select>
                     <button id="dlgCustomRenderMode_MoveToVisible" type="button" class="btn btn-default pull-left">&lt;&lt;</button>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgCustomRenderMode_Apply" class="btn btn-default">Apply</button>
               <button class="btn btn-default dlg-close">Cancel</button>
            </div>
         </div>
      </div>
      <!--  Automation update object dialog -->
      <div id="dlgAutomationUpdate" class="dlg-container container">
         <div class="dlg-box dlg-desktop-l">
            <header>
               <h3>Annotation Properties</h3>
            </header>
            <div class="dlg-body modal-body">
               <ul class="dlg-tabs">
                  <li id="dlgAutomationUpdate_PropertiesTab">Properties</li>
                  <li id="dlgAutomationUpdate_ContentTab">Content</li>
                  <li id="dlgAutomationUpdate_ReviewsTab">Reviews</li>
               </ul>
               <div class="dlg-tabview">
                  <div id="dlgAutomationUpdate_PropertiesPage"></div>
                  <div id="dlgAutomationUpdate_ContentPage">
                     <div class="content-textarea-holder">
                        <textarea id="contentTextArea" class="content-textarea" rows="7"></textarea>
                     </div>
                  </div>
                  <div id="dlgAutomationUpdate_ReviewsPage"></div>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Input Dialog -->
      <div id="dlgInput" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3 id="dlgInput_Title">Input</h3>
            </header>
            <div class="dlg-body modal-body">
               <p id="dlgInput_Description"></p>
               <div>
                  <input id="dlgInput_Input" class="form-control" />
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgInput_Apply" class="btn btn-default">Apply</button>
               <button id="dlgInput_Hide" class="btn btn-default">Cancel</button>
            </div>
         </div>
      </div>
      <!-- Cache Dialog -->
      <div id="dlgCache" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3 id="dlgCache_Title">Cache</h3>
            </header>
            <div class="dlg-body modal-body">
               <div class="bottom-push">
                  <p id="dlgCache_Description"></p>
               </div>
               <div class="bottom-push">
                  <button id="dlgCache_PasteCurrentForLoad" class="btn btn-default btn-sm">Paste current document cache identifier<strong id="dlgCache_PasteCurrentForLoad_Synced"> (Not Synced)</strong></button>
               </div>
               <div>
                  <input id="dlgCache_Input" class="form-control" />
               </div>
               <div class="top-push">
                  <button id="dlgCache_ReloadCurrentFromSave" class="btn btn-default">Reload this document from the cache</button>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgInput_Load" class="btn btn-default">Load</button>
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Document viewer options dialog -->
      <div id="dlgOptions" class="dlg-container container">
         <div class="dlg-box dlg-desktop-xl">
            <header>
               <h3>Document Viewer Options</h3>
            </header>
            <div class="dlg-body modal-body">
               <div class="container-fluid">
                  <div class="row">
                     <div class="col-lg-6 dlg-option-section">
                        <h4 class="header-underline">Client-Side PDF</h4>
                        <div class="top-push">
                           <div>
                              <div>
                                 <input id="dlgOptions_UsePDFRendering" type="checkbox" />
                                 <label for="dlgOptions_UsePDFRendering">Use client-side PDF rendering <sup>1</sup></label>
                              </div>
                              <p>
                                 If the document is not a PDF, normal viewing preferences are used.
                              </p>
                           </div>
                           <div>
                              <div>
                                 <input id="dlgOptions_UsePDFText" type="checkbox" />
                                 <label for="dlgOptions_UsePDFText">Use client-side PDF text retrieval</label>
                              </div>
                              <p>
                                 If the document is not a PDF, text is retrieved from the DocumentService.
                              </p>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-6 dlg-option-section">
                        <h4 class="header-underline">AJAX</h4>
                        <div class="top-push">
                           <div>
                              <div>
                                 <input id="dlgOptions_HookPrepareAjax" type="checkbox" />
                                 <label for="dlgOptions_HookPrepareAjax">Hook DocumentViewer.prepareAjax</label>
                              </div>
                              <p>Use <code>DocumentViewer.prepareAjax</code> to output into the console information on every call made to the DocumentService.</p>
                           </div>
                           <div>
                              <div>
                                 <input id="dlgOptions_UseAjaxImageLoading" type="checkbox" />
                                 <label for="dlgOptions_UseAjaxImageLoading">Use AJAX image loading <sup>1</sup></label>
                              </div>
                              <p>Use AJAX to load all images in this instance of document viewer instead of typical <code>image.src</code>. Using AJAX supports sending custom headers with each request to the server through <code>DocumentFactory.prepareAjax</code>.</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-6 dlg-option-section">
                        <h4 class="header-underline">Upload &amp; Export</h4>
                        <div class="top-push">
                           <div>
                              <div>
                                 <input id="dlgOptions_VerifyUploadedMimeTypes" type="checkbox" />
                                 <label for="dlgOptions_VerifyUploadedMimeTypes">Verify uploaded documents before loading</label>
                              </div>
                              <p>
                                 Before loading an uploaded document from the cache for the first time, verify that it is an accepted format.
                                 The service must be configured to support this feature.
                              </p>
                           </div>
                           <div>
                              <div>
                                 <input id="dlgOptions_Export_UseStatus" type="checkbox" checked />
                                 <label for="dlgOptions_Export_UseStatus">Use Status Query Requests</label>
                              </div>
                              <p>
                                 Make periodic requests to the service to query the status of the document export.
                              </p>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-6 dlg-option-section">
                        <h4 class="header-underline">Network</h4>
                        <div class="top-push">
                           <div>
                              <div>
                                 <input id="dlgOptions_Heartbeat_Enabled" type="checkbox" />
                                 <label for="dlgOptions_Heartbeat_Enabled">Check Service Heartbeat</label>
                              </div>
                              <p>
                                 Make periodic requests to the service to check that it is still up and running. Show a message
                                 when the service is down.
                              </p>
                              <ul style="list-style-type:none;">
                                 <li>
                                    <div class="input-group input-group-sm content-space">
                                       <span for="dlgOptions_Heartbeat_Start" class="input-group-addon">Start Timer (in ms):</span>
                                       <input id="dlgOptions_Heartbeat_Start" type="text" class="form-control" />
                                    </div>
                                    <div class="input-group input-group-sm content-space">
                                       <span for="dlgOptions_Heartbeat_Interval" class="input-group-addon">Interval Timer (in ms):</span>
                                       <input id="dlgOptions_Heartbeat_Interval" type="text" class="form-control" />
                                    </div>
                                    <div class="input-group input-group-sm">
                                       <span for="dlgOptions_Heartbeat_AutoPause" class="input-group-addon">Inactivity Timer (in ms):</span>
                                       <input id="dlgOptions_Heartbeat_AutoPause" type="text" class="form-control" />
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-6 dlg-option-section">
                        <h4 class="header-underline">View</h4>
                        <div class="top-push">
                           <div class="input-group">
                              <label for="dlgOptions_View_NumberOfWorkers" class="input-group-addon">Number of Workers: <sup>2</sup></label>
                              <input id="dlgOptions_View_NumberOfWorkers" type="text" class="form-control" />
                           </div>
                           <div class="content-space">
                              <input id="dlgOptions_View_LazyLoad" type="checkbox" />
                              <label for="dlgOptions_View_LazyLoad">Lazy Load <sup>2</sup></label>
                           </div>
                           <div class="content-space">
                              <input id="dlgOptions_View_CSSTransitions" type="checkbox" />
                              <label for="dlgOptions_View_CSSTransitions">CSS3 Transitions</label>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-6 dlg-option-section">
                        <h4 class="header-underline">Thumbnails</h4>
                        <div class="top-push">
                           <div class="input-group">
                              <label for="dlgOptions_Thumbs_NumberOfWorkers" class="input-group-addon">Number of Workers: <sup>2</sup></label>
                              <input id="dlgOptions_Thumbs_NumberOfWorkers" type="text" class="form-control" />
                           </div>
                           <div class="content-space">
                              <input id="dlgOptions_Thumbs_LazyLoad" type="checkbox" />
                              <label for="dlgOptions_Thumbs_LazyLoad">Lazy Load <sup>2</sup></label>
                           </div>
                           <div class="content-space">
                              <input id="dlgOptions_Thumbs_UseGrids" type="checkbox" />
                              <label for="dlgOptions_Thumbs_UseGrids">Use Grids <sup>1, 2</sup></label>
                           </div>
                           <ul style="list-style-type:none;">
                              <li>
                                 <div class="input-group input-group-sm">
                                    <span for="dlgOptions_Thumbs_PixelSize" class="input-group-addon">Pixel Size: </span>
                                    <input id="dlgOptions_Thumbs_PixelSize" type="text" class="form-control" />
                                 </div>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
               <div>
                  <hr />
                  <div>
                     <strong><sup>1</sup></strong> Changes made to this option will take effect the next time you load a document. All other changes take effect immediately.
                  </div>
                  <div>
                     <strong><sup>2</sup></strong> This option may be automatically overwritten if client-side PDF rendering is enabled and available for the loaded document.
                     Lazy loading is enabled, view and thumbnails workers are disabled, and the thumbnail grids feature is disabled.
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button id="dlgOptions_Apply" class="btn btn-default">Apply</button>
               <button class="btn btn-default dlg-close">Cancel</button>
            </div>
         </div>
      </div>
      <!-- Link Value Dialog -->
      <div id="dlgLinkValue" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3>Open Link</h3>
            </header>
            <div class="dlg-body modal-body">
               <p>
                  Standard security practices prevent this page from automatically opening this link.
                  Click the link manually below (automatically opens in a new tab):
               </p>
               <div class="content-space">
                  <a id="dlgLinkValue_Link" class="btn btn-default"></a>
               </div>
               <div>
                  <input id="dlgLinkValue_AlwaysOpenLinks" type="checkbox" />
                  <label for="dlgLinkValue_AlwaysOpenLinks">Always open external links (Do not show this message again)</label>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Link Message Dialog -->
      <div id="dlgLinkMessage" class="dlg-container container">
         <div class="dlg-box">
            <header>
               <h3 id="dlgLinkMessage_Title"></h3>
            </header>
            <div class="dlg-body modal-body">
               <p id="dlgLinkMessage_Message"></p>
               <div class="content-space">
                  <a id="dlgLinkMessage_Link" class="btn btn-default"></a>
               </div>
            </div>
            <div class="modal-footer">
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- SharePoint picker -->
      <div id="dlgSharePointPicker" class="dlg-container container dlg-sharepoint-picker">
         <div class="dlg-box">
            <header>
               <h3 id="dlgSharePointPicker_Title"></h3>
               <h5 id="dlgSharePointPicker_Directory_CurrentPath"></h5>
            </header>
            <div class="dlg-body modal-body">
               <div id="dlgSharePointPicker_Properties">
                  <div>
                     <h4 class="header-underline">Server Address</h4>
                     <div>
                        <p class="top-push">Enter the site root. Only the "Shared Documents" folder will be accessible by default.</p>
                        <div>
                           <input id="dlgSharePointPicker_Properties_Server" type="text" class="form-control" placeholder="Example: http://myserver/mysite" spellcheck="false" />
                        </div>
                     </div>
                  </div>
                  <div class="top-push">
                     <h4 class="header-underline">Credentials</h4>
                     <div class="top-push">
                        <div>
                           <input id="dlgSharePointPicker_Credentials_Use" type="checkbox" />
                           <label for="dlgSharePointPicker_Credentials_Use">Use server credentials</label>
                        </div>
                        <div class="input-group top-push">
                           <label for="dlgSharePointPicker_Credentials_Username" class="input-group-addon">Username</label>
                           <input id="dlgSharePointPicker_Credentials_Username" type="text" class="form-control sharePointCredentials" spellcheck="false" />
                        </div>
                        <div class="input-group top-push">
                           <label for="dlgSharePointPicker_Credentials_Password" class="input-group-addon">Password</label>
                           <input id="dlgSharePointPicker_Credentials_Password" type="password" class="form-control sharePointCredentials" />
                        </div>
                        <div class="input-group top-push">
                           <label for="dlgSharePointPicker_Credentials_Domain" class="input-group-addon">Domain</label>
                           <input id="dlgSharePointPicker_Credentials_Domain" type="text" class="form-control sharePointCredentials" spellcheck="false" />
                        </div>
                     </div>
                  </div>
               </div>
               <div id="dlgSharePointPicker_Directory">
                  <div class="sharepoint-table-scroll">
                     <table class="table">
                        <tbody id="dlgSharePointPicker_Directory_Body"></tbody>
                     </table>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <img id="dlgSharePointPicker_Loading" src="/com/leadtools/Resources/Images/Loading.gif" />
               <button type="button" id="dlgSharePointPicker_SetProperties" class="btn btn-default pull-left">
                  <span class="icon icon-sm server"></span>
                  <span class="text">Disconnect</span>
               </button>
               <button id="dlgSharePointPicker_Go" class="btn btn-default">Connect</button>
               <button class="btn btn-default dlg-close">Close</button>
            </div>
         </div>
      </div>
      <!-- Loading dialog -->
      <div id="dlgLoading" class="hide-for-print dlg-container container">
         <div class="dlg-box loading-dialog">
            <div class="dlg-body modal-body">
               <header>
                  <h4 id="dlgLoading_ProcessText"></h4>
                  <h5 id="dlgLoading_ProcessSubText" class="bottom-push-inner"></h5>
               </header>
               <div class="progress">
                  <div id="dlgLoading_ProgressBar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                     <span id="dlgLoading_ProgressPercentage"></span>
                  </div>
               </div>
            </div>
            <div id="dlgLoading_CancelDiv" class="modal-footer">
               <button id="dlgLoading_Cancel" class="btn btn-default">Cancel</button>
            </div>
         </div>
      </div>
   </div>
   <div>
      <!-- Print containers -->
      <div id="printDiv" class="lt-print print-div">
      </div>
      <iframe id="printFrame" class="lt-print print-frame"></iframe>
   </div>
</body>
</html>