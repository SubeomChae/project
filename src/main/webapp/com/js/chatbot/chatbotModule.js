/**
 * 
 */
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

var ChatbotModule =
(function () {
	function ChatbotModule() {
		var _this = this;
		
		this.isOpen = false;
		this._chatbot_id = null;
		
		// 챗봇 메시지 DIV
		this._incoming_msgDiv = null;
		
		// 사용자 메시지 DIV
		this._outgoing_msgDiv = null;
		
		// 챗봇 버튼 DIV
		this._chat_btn_area = null;
		
		// 챗봇 버튼
		this._chat_btn = null;
		
		this.el = {};
		this.el._sendMessage = null;
		this.el._chatbox = null;
		this.el._sendForm = null;
		this._submitUrl = null;
		this._reqListUrl = null;
		this._ansLogUrl = null;
		
		// 네이버 chatbot URL
		this._chatbot_send_url = 'https://h2bqlk7k1x.apigw.ntruss.com/message/chatbot/';
		// 네이버 chatbot secret
		this._secret = 'elVISldzcUZ5TVNIT1NWSmptdXNyQlNMeEljUlJuVXE=';
		this._defualtUserId = 'Anonymous';
		this._defualtUserIp = '0.0.0.0';
	}
	
	var ansLog = {
		log_no:null,
		ans_content:null,
		ans_result:null,
		error_msg:null
	}
	
	ChatbotModule.prototype.init = function(properties) {
		var _this = this;
		
		this.el._sendMessage = properties.sendMessage;
		this.el._chatbox = properties.chatbox;
		this.el._sendForm = properties.sendForm;
		this._submitUrl = "/chatbt/data/send.do";
		this._reqListUrl = "/chatbt/data/req_list.do";
		this._ansLogUrl = "/chatbt/data/ans_log.do";
		this.isOpen = true;
		this._chatbot_id = this.guid();
		
		this._incoming_msgDiv = $('<li class="in incoming_msg"><img class="avatar" alt="" src="/com/img/logo_chat_bot.png"><span class="name">관리자</span><div class="message"><span class="arrow"></span><span class="body received_msg"><p></p></span></div><span class="datetime time_date"></span></li>');
		this._outgoing_msgDiv = $('<li class="out outgoing_msg"><img class="avatar" alt="" src="/com/img/avatar.png"><span class="name">사용자</span><div class="message"><span class="arrow"></span><span class="body sent_msg"><p></p></span></div><span class="datetime time_date"></span></li>');
		this._chat_btn_area = $('<div class="form-list chat_btn_area"></div>');
		this._chat_btn = $('<div class="chat_btn"><button class="t-left" type="button"></button></div>');
		
		if(properties.user_id) this._outgoing_msgDiv.find(".name").text(properties.user_id);
		
		this._user_id = properties.user_id;
		this._user_ip = properties._user_ip;
		this._crypto_function = properties.crypto_function;
		this._encode_function = properties.encode_function;
		this._encode_context = properties.encode_context;
		
		this.bindEvent();
	}
	
	ChatbotModule.prototype.close = function() {
		this.isOpen = false;
		this._chatbot_id = null; 
	}
	
	ChatbotModule.prototype.guid = function() {
		  function s4() {
		    return Math.floor((1 + Math.random()) * 0x10000)
		      .toString(16)
		      .substring(1);
		  }
		  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
		    s4() + '-' + s4() + s4() + s4();
	}
	
	ChatbotModule.prototype.bindEvent = function() {
		var _this = this;
		$(this.el._chatbox).append(this.incomingMsg("안녕하세요. 환영합니다."));
		$(this.el._sendMessage).on("keydown",function(event){
			if(event.keyCode == 13){
				_this.sendChatbot();
			}
		});
		$(this.el._sendMessage).closest(".chat-form").find(".btn-cont .btn").on("click",function(){
			_this.sendChatbot();
		});
	}
	
	ChatbotModule.prototype.sendChatbot = function() {
		var _this = this;
		
		var $sendMessage = $(this.el._sendMessage);
		var $chatbox = $(this.el._chatbox);
		$chatbox.append(this.outgoingMsg($sendMessage.val()));
		
		var cForm = $("<form></form>");
		cForm.hide();
		cForm.append($sendMessage.clone(true));
		cForm.append('<input type="hidden" name="chatbot_id" value="'+this._chatbot_id+'" />');
		
		var sendObject = this.makeSendObject($sendMessage.val());
		var jsondata = JSON.stringify(sendObject);
		var cryptoObject = this._crypto_function(jsondata,this._secret);
		var endcodeStr = this._encode_function.call(this._encode_context,cryptoObject);
		
		var _this = this;
		cForm.ajaxForm({
		    url : this._submitUrl,
		    dataType : "json",
		    success : function(responseJson){
		    	sendRequest.call(_this,responseJson);
		    }
		});
		
		cForm.appendTo("body");
		cForm.submit();
		cForm.remove();
		$sendMessage.val("");
		
		var sendRequest = function(responseJson) {
			var logNo = responseJson.log_no;
			
			$.ajax({
				url : this._chatbot_send_url,
				contentType:'application/json; charset=utf-8',
			    dataType : "json",
			    type:"post",
			    data: jsondata,
			    crossOrigin : true,
			    beforeSend : function(xhr){
		            xhr.setRequestHeader("X-NCP-CHATBOT_SIGNATURE", endcodeStr);
		        },
			    success: function(res) {
			    	sendCallbackFunction.call(_this,res,logNo);
			    },
			    error: function(err) {
			    	console.log(err);
			    }
			});
		}
		
		var sendCallbackFunction = function(responseJson,logNo) {
			var receiveMsgDiv;
	    	var logNo = logNo;
	    	var bubbles = responseJson.bubbles[0];
	    	responseJson.log_no = logNo;
	    	
	    	switch (bubbles.type) {
			case chatbotType.text:
				var receiveMessage = bubbles.data.description;
		    	receiveMsgDiv = _this.incomingMsg(receiveMessage);
		    	// 응답로그
		    	_this.ansLogResp(responseJson);
				break;
				
			case chatbotType.template:
				var bubblesData = bubbles.data;
				receiveMsgDiv = _this.incomingList(bubblesData);
				// 응답로그
		    	_this.ansLogResp(responseJson,receiveMsgDiv);
				break;

			default:
				break;
			}
	    	
	    	$(receiveMsgDiv).appendTo($chatbox);
	    	QuickSidebar.init();
	    	$chatbox.closest(".scroller").slimScroll({
	    		scrollTo:$chatbox[0].scrollHeight,
	    		alwaysVisible: true
	    	});
	    	
		}
		
		/*var sendFunction = function(res) {
			cForm.ajaxForm({
			    url : this._submitUrl,
			    dataType : "json",
			    success : function(responseJson){
			    	var receiveMsgDiv;
			    	var logNo = responseJson.log_no;
			    	var bubbles = responseJson.bubbles[0];
			    	
			    	switch (bubbles.type) {
					case chatbotType.text:
						var receiveMessage = bubbles.data.description;
				    	receiveMsgDiv = _this.incomingMsg(receiveMessage);
				    	// 응답로그
				    	_this.ansLogResp(responseJson);
						break;
						
					case chatbotType.template:
						var bubblesData = bubbles.data;
						receiveMsgDiv = _this.incomingList(bubblesData);
						// 응답로그
				    	_this.ansLogResp(responseJson,receiveMsgDiv);
						break;

					default:
						break;
					}
			    	
			    	$(receiveMsgDiv).appendTo($chatbox);
			    	QuickSidebar.init();
			    	$chatbox.closest(".scroller").slimScroll({
			    		scrollTo:$chatbox[0].scrollHeight,
			    		alwaysVisible: true
			    	});
			    }
			});
			
			cForm.appendTo("body");
			cForm.submit();
			cForm.remove();
			$sendMessage.val("");
		}*/
		
	}
	
	ChatbotModule.prototype.outgoingMsg = function(msg) {
		var $msgDiv = this._outgoing_msgDiv.clone(true);
		var $p = $msgDiv.find(".sent_msg p");
		$p.html(this.replaceMsg(msg));
		var $time = $msgDiv.find(".time_date");
		$time.text(this.nowChatTime());	
		
		return $msgDiv
	}
	
	ChatbotModule.prototype.replaceMsg = function(msg){
		// 개행 문자
		var msgList = msg.split("\n");
		var i = 0;
		var len = msgList.length;
		var returnMsg = "";
		for(i; i< len; i++){
			var msgShort = msgList[i];
			returnMsg += msgShort
			if(i !== len-1) returnMsg += "<br>";
		}
		
		return returnMsg;
	}
	
	ChatbotModule.prototype.nowChatTime = function() {
		return new Date().format("a/p hh시 mm분");
	}
	
	var chatbotType = {
		image : "image",	
		text : "text",
		template : "template",
		button : "button",
		basic : "basic",
		postback : "postback",
		link : "link",
	};
	
	ChatbotModule.prototype.incomingList = function(bubbleData) {
		var _this = this;
		
		var $msgDiv = this._incoming_msgDiv.clone(true);
		var $btnListDiv = this._chat_btn_area.clone(true);
		var $p = $msgDiv.find(".received_msg p");
		
		var cover = bubbleData.cover;
		var contentTable = bubbleData.contentTable;
		var $btnDiv = $(this._chat_btn_area).clone(true);

		// cover 처리 - 1Depth
		var type = cover.type;
		
		switch (type) {
		case chatbotType.image:
			var msg = cover.data.description;
			$p.html(this.replaceMsg(msg));
			var $time = $msgDiv.find(".time_date");
			$time.text(this.nowChatTime());
			$p.before("<div class='chat_image_area'><div class='image_align_center'><img src='"+cover.data.imageUrl+"'></div></div>");
			
			break;
		case chatbotType.text:
			var msg = cover.data.description;
			$p.html(this.replaceMsg(msg));
			var $time = $msgDiv.find(".time_date");
			$time.text(this.nowChatTime());
			break;

		default:
			break;
		}
		
		// 공통 contentTable 처리 - 1Depth
		var i = 0, len = contentTable.length;
		for(i; i<len; i++) {
			// 공통 contentTable data 처리
			var tableRow = contentTable[i];
			var j = 0, jlen = tableRow.length;
			for(j; j<jlen; j++) {
				var tableDataObj = tableRow[j];
				//TODO rowSpan, colSpan 처리 없음, 추후 수정 가능
				// contentData - 2Depth
				var tableData = tableDataObj.data;
				
				switch (tableData.type) {
				case chatbotType.button:
					var $btnDiv = $(this._chat_btn).clone(true);
					var $btn = $btnDiv.find("button");
					var title = tableData.title;
					$btn.text(title);
					
					// basicData - 3Depth
					var basicData = tableData.data;
					switch (basicData.type) {
					case chatbotType.basic:
						// actionData - 4Depth
						var actionData = basicData.action;
						switch (actionData.type) {
						case chatbotType.postback:
							$btn.attr("postback",actionData.data.postback);
							$btn.on("click",function(){
								_this.sendChatbtn(this);
							});
							break;
						case chatbotType.link:
							$btn.on("click",function(){
								window.open(actionData.data.url, '_blank'); 
							});
							break;
						}
						break;
					default:
						break;	
					}
					$btnListDiv.append($btnDiv);
					break;
				default:
					break;
				}
				
			}
			
		}
		$p.after($btnListDiv);
		
		
		return $msgDiv;
	}
	
	ChatbotModule.prototype.sendChatbtn = function(btn) {
		var _this = this;
		
		var $sendMessage = $(this.el._sendMessage);
		var $btn = $(btn);
		var $chatbox = $(this.el._chatbox);
		$chatbox.append(this.outgoingMsg($btn.text()));
		
		var cForm = $("<form></form>");
		cForm.hide();
		cForm.append($sendMessage.clone(true).val($btn.attr("postback")));
		
		
		
		cForm.ajaxForm({
		    url : this._submitUrl,
		    dataType : "json",
		    success : function(responseJson){
		    	var receiveMsgDiv;
		    	var bubbles = responseJson.bubbles[0];
		    	
		    	switch (bubbles.type) {
				case chatbotType.text:
					var receiveMessage = responseJson.bubbles[0].data.description;
			    	receiveMsgDiv = _this.incomingMsg(receiveMessage);
					break;
					
				case chatbotType.template:
					var bubblesData = responseJson.bubbles[0].data;
					receiveMsgDiv = _this.incomingList(bubblesData);
					break;

				default:
					break;
				}
		    	
		    	$(receiveMsgDiv).appendTo($chatbox);
		    	QuickSidebar.init();
		    	$chatbox.closest(".scroller").slimScroll({
		    		scrollTo:$chatbox[0].scrollHeight,
		    		alwaysVisible: true
		    	});
		    }
		});
		
		cForm.appendTo("body");
		cForm.submit();
		cForm.remove();
	}
	
	ChatbotModule.prototype.incomingMsg = function(msg) {
		var $msgDiv = this._incoming_msgDiv.clone(true);
		var $p = $msgDiv.find(".received_msg p");
		$p.html(this.replaceMsg(msg));
		var $time = $msgDiv.find(".time_date");
		$time.text(this.nowChatTime());	
		
		return $msgDiv
	}
	

	ChatbotModule.prototype.getReqJson = function(reqNo, callback) {
		$.ajax({
			url : this._reqListUrl,
			data : {"req_no" : reqNo},
		    dataType : "json",
		    async : false
		})
		.done(function(responseJson){
	    	if(typeof callback == "function") {
	    		callback(responseJson);
	    	}
	    });
	}
	
	var ansResultCode = {
		success : "success",
		fail : "fail"
	}
	
	ChatbotModule.prototype.ansLogResp = function(responseJson,receiveMsgDiv) {
		var logData = {};
		$.extend(true,logData,ansLog);
		var logNo = responseJson.log_no;
    	var bubbles = responseJson.bubbles[0];
    	var ansResult = ansResultCode.success;
		
		logData.log_no = logNo;
		
		if(responseJson.code) {
			ansResult = responseJson.code;
			logData.error_msg = responseJson.message;
		} else {
			if(receiveMsgDiv) logData.ans_content = receiveMsgDiv.html();
			else logData.ans_content = bubbles.data.description;
		}
		
		logData.ans_result = ansResult;
	
		$.ajax({
			url : this._ansLogUrl,
			data : logData,
		    dataType : "json",
		    async : false
		})
		.done(function(responseJson){
	    });
	}
	
	
	ChatbotModule.prototype.makeSendObject = function(sendMessage) {
		/*
		 * API spec v2.0
		 * {
			"version": "v2",
			"userId": "U47b00b58c90f8e47428af8b7bddcda3d",
			"userIp": "8.8.8.8",
			"timestamp": 1545022426038,
			"bubbles": [{
			    "type": "text",
			    "data" : {
			      "description" : "시설물관리대장은 언제까지 제출하면 되나요"
			    }
			  }],
			"event": "send"
			}
		 * 
		 */
		var sendObject = {};
		var textContent = {};
		var dataContent = {};
		var bubblesArray = [];

		sendObject.event = 'send';
		
		var cVersion = 'v2';
		var cType;
		
		if(!cType) {
			cType = "text";
		}
		var userId = (this._user_id) ?  this._defualtUserId : userId;
		var userIp = (this._user_ip) ?  this._defualtUserIp : userIp;
		
		sendObject.version = cVersion;
		
		switch (cVersion) {
		case 'v1':
			break;
		case 'v2':
			sendObject.userId = userId;
			sendObject.userIp = userIp;
			sendObject.timestamp = new Date().getTime();
			
			textContent.type = cType;
			dataContent.description = sendMessage;
			textContent.data = dataContent;
			bubblesArray.push(textContent);
			sendObject.bubbles = bubblesArray;
			break;
		default:
			break;
		}
		
		return sendObject;
	}
	
	return ChatbotModule;
}());

var chatbotModule = new ChatbotModule();
