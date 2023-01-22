<%@ page language="java"  pageEncoding="UTF-8" %>

<%	String initContents = ((String)request.getAttribute("initContents")).replaceAll("&nbsp;","&amp;nbsp");
	String contentsFldNm = (String)request.getAttribute("contents_fld_nm");
	String formName = (String)request.getAttribute("form_name");
	String editorWidth = (String)request.getAttribute("editor_width");
	String contentWidth = "";
	if (request.getAttribute("content_width") != null) {
		contentWidth = (String)request.getAttribute("content_width");
	}
	String editorHeight = (String)request.getAttribute("editor_height");
	String editorPadding = (String)request.getAttribute("editor_padding");
	String toolbarBasic = FormatUtil.nvl2((String)request.getAttribute("toolbar_basic"),""); 
	String toolbarAdvanced = FormatUtil.nvl2((String)request.getAttribute("toolbar_advanced"),""); 
	
	String myPage = request.getRequestURL().toString();
	String svr_domain = myPage.substring(0, myPage.indexOf("/WEB-INF/"));
	
	String readonly = (String)request.getAttribute("readonly");
	String display = (String)request.getAttribute("display");
%>

<!-- HTML 편집기 시작 -->
<div class="body">
	<div id="tx_trex_container" class="tx-editor-container" style="width:<%=editorWidth%>px;">
		<div id="tx_toolbar_basic" class="tx-toolbar tx-toolbar-basic" style="display:<%=toolbarBasic%>">
			<div class="tx-toolbar-boundary">
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div id="tx_fontfamily" unselectable="on" class="tx-slt-70bg tx-fontfamily"><a href="javascript:;" title="글꼴">굴림</a></div>
						<div id="tx_fontfamily_menu" class="tx-fontfamily-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-42bg tx-fontsize" id="tx_fontsize"><a href="javascript:;" title="글자크기">11pt</a></div>
						<div id="tx_fontsize_menu" class="tx-fontsize-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-font">
					<li class="tx-list"><div unselectable="on" class="tx-btn-lbg tx-bold" id="tx_bold"><a href="javascript:;" class="tx-icon" title="굵게 (Ctrl+B)">굵게</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-bg tx-underline" id="tx_underline"><a href="javascript:;" class="tx-icon" title="밑줄 (Ctrl+U)">밑줄</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-bg tx-italic" id="tx_italic"><a href="javascript:;" class="tx-icon" title="기울임 (Ctrl+I)">기울임</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-bg tx-strike" id="tx_strike"><a href="javascript:;" class="tx-icon" title="취소선 (Ctrl+D)">취소선</a></div></li>
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-tbg tx-forecolor" id="tx_forecolor">
							<a href="javascript:;" class="tx-icon" title="글자색">글자색</a>
							<a href="javascript:;" class="tx-arrow" title="글자색 선택">글자색 선택</a>
						</div>
						<div id="tx_forecolor_menu" class="tx-menu tx-forecolor-menu tx-colorpallete" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-brbg tx-backcolor" id="tx_backcolor">
							<a href="javascript:;" class="tx-icon" title="글자 배경색">글자 배경색</a>
							<a href="javascript:;" class="tx-arrow" title="글자 배경색 선택">글자 배경색 선택</a>
						</div>
						<div id="tx_backcolor_menu" class="tx-menu tx-backcolor-menu tx-colorpallete" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list"><div unselectable="on" class="tx-btn-lbg tx-alignleft" id="tx_alignleft"><a href="javascript:;" class="tx-icon" title="왼쪽정렬 (Ctrl+,)">왼쪽정렬</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-bg tx-aligncenter" id="tx_aligncenter"><a href="javascript:;" class="tx-icon" title="가운데정렬 (Ctrl+.)">가운데정렬</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-bg tx-alignright" id="tx_alignright"><a href="javascript:;" class="tx-icon" title="오른쪽정렬 (Ctrl+/)">오른쪽정렬</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-rbg tx-alignfull" id="tx_alignfull"><a href="javascript:;" class="tx-icon" title="양쪽정렬">양쪽정렬</a></div></li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-tab">
					<li class="tx-list"><div unselectable="on" class="tx-btn-lbg tx-indent" id="tx_indent"><a href="javascript:;" title="들여쓰기 (Tab)" class="tx-icon">들여쓰기</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-rbg tx-outdent" id="tx_outdent"><a href="javascript:;" title="내어쓰기 (Shift+Tab)" class="tx-icon">내어쓰기</a></div></li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-list">
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-31lbg tx-lineheight" id="tx_lineheight">
							<a href="javascript:;" class="tx-icon" title="줄간격">줄간격</a>
							<a href="javascript:;" class="tx-arrow" title="줄간격">줄간격 선택</a>
						</div>
						<div id="tx_lineheight_menu" class="tx-lineheight-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-etc">
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-bg tx-specialchar" id="tx_specialchar"><a href="javascript:;" class="tx-icon" title="특수문자">특수문자</a></div>
						<div id="tx_specialchar_menu" class="tx-specialchar-menu tx-menu"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-bg tx-table" id="tx_table"><a href="javascript:;" class="tx-icon" title="표만들기">표만들기</a></div>
						<div id="tx_table_menu" class="tx-table-menu tx-menu" unselectable="on">
							<div class="tx-menu-inner">
								<div class="tx-menu-preview"></div>
								<div class="tx-menu-rowcol"></div>
								<div class="tx-menu-deco"></div>
								<div class="tx-menu-enter"></div>
							</div>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-rbg tx-horizontalrule" id="tx_horizontalrule"><a href="javascript:;" class="tx-icon" title="구분선">구분선</a></div>
						<div id="tx_horizontalrule_menu" class="tx-horizontalrule-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-undo">
					<li class="tx-list"><div unselectable="on" class="tx-btn-lbg tx-undo" id="tx_undo"><a href="javascript:;" class="tx-icon" title="실행취소 (Ctrl+Z)">실행취소</a></div></li>
					<li class="tx-list"><div unselectable="on" class="tx-btn-rbg tx-redo" id="tx_redo"><a href="javascript:;" class="tx-icon" title="다시실행 (Ctrl+Y)">다시실행</a></div></li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-image">
					<li class="tx-list">
						<div unselectable="on" id="tx_image" class="tx-image tx-btn-trans">
							<a href="javascript:;" title="사진" class="tx-text">사진</a>
						</div>
					</li>
				</ul>
			<% if(!toolbarAdvanced.equals("none")) { %>	
				<ul class="tx-bar tx-bar-right">
					<li class="tx-list"><div unselectable="on" class="tx-btn-nlrbg tx-advanced" id="tx_advanced"><a href="javascript:;" class="tx-icon" title="툴바 더보기">툴바 더보기</a></div></li>
				</ul>
				<ul class="tx-bar tx-bar-right tx-nav-opt">
					<li class="tx-list"><div unselectable="on" class="tx-switchtoggle" id="tx_switchertoggle"><a href="javascript:;" title="에디터 타입">에디터</a></div></li>
				</ul>
			<% } %>	
			</div>
		</div>
		<% if(!toolbarAdvanced.equals("none")) { %>
		<div id="tx_toolbar_advanced" class="tx-toolbar tx-toolbar-advanced">
			<div class="tx-toolbar-boundary">
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list"><div class="tx-tableedit-title"></div></li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-lbg tx-mergecells" id="tx_mergecells"><a href="javascript:;" class="tx-icon2" title="병합">병합</a></div>
						<div id="tx_mergecells_menu" class="tx-mergecells-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-bg tx-insertcells" id="tx_insertcells"><a href="javascript:;" class="tx-icon2" title="삽입">삽입</a></div>
						<div id="tx_insertcells_menu" class="tx-insertcells-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-rbg tx-deletecells" id="tx_deletecells"><a href="javascript:;" class="tx-icon2" title="삭제">삭제</a></div>
						<div id="tx_deletecells_menu" class="tx-deletecells-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list">
						<div id="tx_cellslinepreview" unselectable="on" class="tx-slt-70lbg tx-cellslinepreview"><a href="javascript:;" title="선 미리보기"></a></div>
						<div id="tx_cellslinepreview_menu" class="tx-cellslinepreview-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellslinecolor" unselectable="on" class="tx-slt-tbg tx-cellslinecolor">
							<a href="javascript:;" class="tx-icon2" title="선색">선색</a>
							<div class="tx-colorpallete" unselectable="on"></div>
						</div>
						<div id="tx_cellslinecolor_menu" class="tx-cellslinecolor-menu tx-menu tx-colorpallete" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellslineheight" unselectable="on" class="tx-btn-bg tx-cellslineheight"><a href="javascript:;" class="tx-icon2" title="두께">두께</a></div>
						<div id="tx_cellslineheight_menu" class="tx-cellslineheight-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellslinestyle" unselectable="on" class="tx-btn-bg tx-cellslinestyle"><a href="javascript:;" class="tx-icon2" title="스타일">스타일</a></div>
						<div id="tx_cellslinestyle_menu" class="tx-cellslinestyle-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellsoutline" unselectable="on" class="tx-btn-rbg tx-cellsoutline"><a href="javascript:;" class="tx-icon2" title="테두리">테두리</a></div>
						<div id="tx_cellsoutline_menu" class="tx-cellsoutline-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div id="tx_tablebackcolor" unselectable="on" class="tx-btn-lrbg tx-tablebackcolor" style="background-color:#9aa5ea;"><a href="javascript:;" class="tx-icon2" title="테이블 배경색">테이블 배경색</a></div>
						<div id="tx_tablebackcolor_menu" class="tx-tablebackcolor-menu tx-menu tx-colorpallete" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div id="tx_tabletemplate" unselectable="on" class="tx-btn-lrbg tx-tabletemplate"><a href="javascript:;" class="tx-icon2" title="테이블 서식">테이블 서식</a></div>
						<div id="tx_tabletemplate_menu" class="tx-tabletemplate-menu tx-menu tx-colorpallete" unselectable="on"></div>
					</li>
				</ul>
			</div>
		</div>
		<% } %>
		<div id="tx_canvas" class="tx-canvas">
			<div id="tx_loading" class="tx-loading">
				<div><img src="/com/plugins/daumeditor/images/icon/editor/loading2.png" width="113" height="21" align="absmiddle"/></div>
			</div>
			<div id="tx_canvas_wysiwyg_holder" class="tx-holder" style="display:block;"><iframe id="tx_canvas_wysiwyg" name="tx_canvas_wysiwyg" allowtransparency="true" frameborder="0"></iframe></div>
			<div class="tx-source-deco">
				<div id="tx_canvas_source_holder" class="tx-holder"><textarea id="tx_canvas_source" rows="30" cols="30"></textarea></div>
			</div>
			<div id="tx_canvas_text_holder" class="tx-holder"><textarea id="tx_canvas_text" rows="30" cols="30"></textarea></div>
		</div>
		<div id="tx_attach_div" class="tx-attach-div" style='display:none'>
			<div id="tx_attach_txt" class="tx-attach-txt" style='display:none'>파일 첨부</div>
			<div id="tx_attach_box" class="tx-attach-box" style='display:none'>
				<div class="tx-attach-box-inner">
					<div id="tx_attach_preview" class="tx-attach-preview"><p></p><img src="/com/plugins/daumeditor/images/icon/editor/pn_preview.gif" width="147" height="108" unselectable="on"/></div>
					<div class="tx-attach-main">
						<div id="tx_upload_progress" class="tx-upload-progress">
							<div>0%</div>
							<p>파일을 업로드하는 중입니다.</p>
						</div>
						<ul class="tx-attach-top">
							<li id="tx_attach_delete" class="tx-attach-delete"><a>전체삭제</a></li>
							<li id="tx_attach_size" class="tx-attach-size">파일: <span id="tx_attach_up_size" class="tx-attach-size-up"></span>/<span id="tx_attach_max_size"></span></li>
							<li id="tx_attach_tools" class="tx-attach-tools"></li>
						</ul>
						<ul id="tx_attach_list" class="tx-attach-list"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<textarea id="init_contents_textarea" style="display:none;"><%=initContents%></textarea>
<script type="text/javascript">
	var config = {
		txHost: '<%=svr_domain%>', txPath: '', txService: 'sample', txProject: 'sample', initializedId: "", wrapper: "tx_trex_container",
		form: '<%=formName%>'+"",
		txIconPath: "/com/plugins/daumeditor/images/icon/editor/",
		txDecoPath: "/com/plugins/daumeditor/images/deco/contents/",
		canvas: {
			readonly:<%=readonly%>,
            exitEditor:{},
			styles: {color: "#000000", fontFamily: "바탕체", fontSize: "10pt", backgroundColor: "#fff", lineHeight: "1.5", padding: "<%=FormatUtil.nvl2(editorPadding,"10")%>px"},
			showGuideArea: false
		},
		events: { preventUnload: false },
		sidebar: {
			attachbox: { show: true, confirmForDeleteAll: true }
		},
		<% if (contentWidth.equals("") == false) { %>
		size: { contentWidth: <%=editorWidth%> }
		<% } %>
	};
	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
		Editor.getCanvas().setCanvasSize({height:"<%=editorHeight%>px"});
		document.getElementById("tx_toolbar_basic").style.display = '<%=display%>';
	});
	
	function saveContent() { Editor.save(); }
	function validForm(editor) {
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if(!validator.exists(content)) { return false; }
		return true;
	}
	function setForm(editor) {
        var i, input;
        var form = editor.getForm();
        var content = editor.getContent();
        document.<%=formName%>.<%=contentsFldNm%>.value = content;
        if(content != null) { return; }
	}
	function loadContent() {
		Editor.modify({
			"content": document.getElementById("init_contents_textarea")
		});
	}
	setTimeout("loadContent();",500);
</script>
<!-- HTML 편집기 끝 -->