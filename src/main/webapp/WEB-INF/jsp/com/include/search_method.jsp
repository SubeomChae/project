<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%	String word_likely = StringUtil.arrayCol(box.get("word_count"),1);
	String caps_ignore = StringUtil.arrayCol(box.get("word_count"),2);
%>
<script language="javascript">
	function showSearchMethod() {
		var obj = $("#imgSearchMethod").offset();
		var xPos = Math.max(obj.left - 300, 100);
		var yPos = Math.max(obj.top - 200, 150);
		if($(".page-window-popup").length > 0) {
			yPos = obj.top;
		}
		$('#divSearchMethodTable').css("left", xPos);
		$('#divSearchMethodTable').css("top", yPos);
		$('#divSearchMethodTable').show();
	}
</script>

<table id="divSearchMethodTable" border="1" class="modal-table-pseudo" style="left:0; top:0; width:300px; display:none;">
	<tr>
		<td class="modal-title-pseudo">문자열 검색방법</td>
		<td class="modal-title-pseudo-x"><button type="button" class="close" onClick="$('#divSearchMethodTable').hide();"></button></td>
	</tr>
	<tr>
		<td colspan="2" class="t-center">
			<select id="word_likely" name="word_likely" title="문자열검색기준" class="bs-select form-control" style="margin-top:5px;width:95%" onChange="setWordCount()">
				<option value=''>일부 문자열 포함(공백포함)</option>
				<option value='A' <%=word_likely.equals("A")?"selected":""%>>일부 문자열 포함(공백무시)</option>
				<option value='B' <%=word_likely.equals("B")?"selected":""%>>전체 문자열 일치(공백포함)</option>
				<option value='C' <%=word_likely.equals("C")?"selected":""%>>전체 문자열 일치(공백무시)</option>
				<option value='2' <%=word_likely.equals("2")?"selected":""%>>2글자 이상 일치</option>
				<option value='3' <%=word_likely.equals("3")?"selected":""%>>3글자 이상 일치</option>
				<option value='4' <%=word_likely.equals("4")?"selected":""%>>4글자 이상 일치</option>
				<option value='5' <%=word_likely.equals("5")?"selected":""%>>5글자 이상 일치</option>
			</select>
			<select name="caps_ignore" title="문자열검색기준" class="bs-select form-control" style="margin-top:5px;width:95%" onChange="setWordCount()">
				<option value=''>대소문자 구분</option>
				<option value='Y' <%=caps_ignore.equals("Y")?"selected":""%>>대소문자 무시</option>
			</select>
			<div class="table-bottom-control t-center" style="margin:5px 0">
				<button type="button" class="btn dark" onClick="$('#divSearchMethodTable').hide();"><img src="/com/img/ico_btn_confirm.png">적용</button>
				<button type="button" class="btn dark" onClick="$('#word_likely').val(''); $('#divSearchMethodTable').hide();"><img src="/com/img/ico_btn_cancel.png">취소</button>
			</div>
			<input type="hidden" name="word_count" value="<%=box.get("word_count")%>">
		</td>
	</tr>
</table>
