/*======================================================
 * Alert, Confirm Define                                
 *====================================================== 
 * example: 
    * Alert Modal Dialog
    *
    * data: 
    *  title:  Title Message (생략가능)
    *  content: Content Message
    *  closeBtn: Header Close Btn(x) (기본값은 버튼없음)

	   messageBox.alert({
	            title: '경고'
	            ,content: 'Object Setting Alert.',
	   });  
	
	   messageBox.alert('Not Object Setting Alert.');   
	   
    * Confirm Modal Dialog
    *
    * data: 
    *  title: Title Message
    *  content: Content Message
    *  ok: Ok Button Click Event function
    *  closeBtn: Header Close Btn(x) (기본값은 버튼없음)

	   messageBox.confirm({
		     title: '확인요청'
			 ,content: '이것을 하시겠습니까?'
		     ,closeBtn:'x'			 
		     ,ok: function(){
		         console.log('확인 클릭');
		     }
	  }); 
 =======================================================*/

var messageBox = {
    /**
    * Dialog Id
    */
    DialogInfo: {
        titleId: 'common-modal-title',
        okBtnId: 'common-modal-ok-btn',
    },
    
    /**
    * Default Item Message
    */
    Message: {
        title: '<i class="fa fa-warning"></i> 알림',
        ok: '<i class="fa fa-check"></i> 확인',
        cancel: '<i class="fa fa-close"></i> 취소'
    },
    
    /**
    * Element 생성
    *
    * @param elementTag Element Tag
    * @param attributeData Set Attribute Object
    * @param appendElement AppendChild Element Object
    * @return Element Object    
    */
    createElement: function(elementTag, attributeData, appendElement){
        // Element 생성
        var elementObj = document.createElement(elementTag);
        // Attrbute 추가
        for(var key in attributeData){
            //console.log(key, attrbutes[key]);
            elementObj.setAttribute(key, attributeData[key]);
        };
        // Element Append        
        if(appendElement){
            appendElement.appendChild(elementObj);
        }
        
        return elementObj;
    },
    
    /**
    * Modal Dialog Make
    */
    makeModalDialog: function(data){
        // UUID 생성
        var uuid;
        if(typeof(Util) === 'object' && typeof(Util.uuid) === 'function'){
            uuid = Util.uuid();
        }else{
            uuid = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
                var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
                return v.toString(16);
            });
        }
        
        // Dialog Id
        data.dialogId = 'common-modal-dialog-' + data.dialogType + '-' + uuid;
        
        /***************************************************************************/
        // ---------------- Modal Main Div ----------------
        var modalDiv = this.createElement('div'
            , {'id': data.dialogId,'class': 'modal fase','tabindex': '-1','role': 'dialog','aria-labelledby': this.DialogInfo.titleId,'aria-hidden': 'true'}
            , document.body);
        var modalDialogDiv = this.createElement('div', {'class': 'modal-dialog', 'style':'margin-top: 15%'}, modalDiv);
        var modalContentDiv = this.createElement('div', {'class': 'modal-content'}, modalDialogDiv);
        
        // ---------------- Modal Header ----------------
        var modalHeaderDiv = this.createElement('div', {'class': 'modal-header'}, modalContentDiv);
        
        // Close Header
        if(data.closeBtn){
            var modalHeaderCloseBtn = this.createElement('button', {'type': 'button', 'class': 'close', 'data-dismiss': 'modal', 'aria-hidden': 'true'}, modalHeaderDiv);
            modalHeaderCloseBtn.innerHTML ='x';
        }
        
        // title
        var modalHeaderTitle = this.createElement('h4', {'class': 'modal-title', 'id': this.DialogInfo.titleId}, modalHeaderDiv);
        modalHeaderTitle.innerHTML = data.title ? data.title : this.Message.title;
        
        // ---------------- Modal Body ----------------
        var modalBodyDiv = this.createElement('div', {'class': 'modal-body', 'style': 'word-break: break-all'}, modalContentDiv);;
        modalBodyDiv.innerHTML = data.content ? data.content : '';
        
        // ---------------- Modal Footer ----------------
        var modalFooterDiv = this.createElement('div', {'class': 'modal-footer'}, modalContentDiv);
        // Cancle Button
        if(data.dialogType == 'confirm'){
            var modalFooterCancleBtn = this.createElement('button', {'type': 'button', 'class': 'btn dark btn-outline', 'data-dismiss': 'modal'}, modalFooterDiv);
            modalFooterCancleBtn.innerHTML = this.Message.cancel;            
        }
        // Ok Button
        var modalFooterOkAttr = {'type': 'button', 'class': 'btn dark btn-outline', 'id': this.DialogInfo.okBtnId};
        if(data.dialogType == 'alert'){
            modalFooterOkAttr['data-dismiss'] = 'modal';
        }
        var modalFooterOkBtn = this.createElement('button', modalFooterOkAttr, modalFooterDiv);
        modalFooterOkBtn.innerHTML = this.Message.ok;
        /***************************************************************************/
        // Modal Default option Setting        
        var modalOption = {
            keyboard: false // ESC 키 눌렀을때 모달을 닫음
            ,backdrop: 'static' // static or boolean
            ,show: false // 초기화 시 모달을 보여줍니다.
        }
        // 사용자 지정 정보 설정
        $.extend(modalOption, data);
        
        // Jquery Dialog 변수 선언
        var dialog = $('#' + data.dialogId);
        
        // Bootstrap Modal Setting
        dialog.modal(modalOption)        
        
        // Modal의 hide가 완료된 이후 Event 실행
        dialog.on('hidden.bs.modal', function(e){
            // Modal Element 제거
            dialog.remove();
        });
        
        // Confirm 일 경우 확인 버튼 클릭 이벤트 지정
        if(data.dialogType == 'confirm'){
            dialog.find(" #" + this.DialogInfo.okBtnId).on('click', function(){
                // ok button event function 실행
                if(data.ok && typeof(data.ok) === 'function'){
                    data.ok();
                }else{
                    console.warn('not function ok event. dialogId: ' + data.dialogId);
                }
                
                // Modal 창 닫기
                dialog.modal('hide');
                // click enevt 제거
                $(this).off('click');
            });    
        }
        
        // Modal Dialog Show
        dialog.modal('show');
    },        
    
    /**
    * Modal Dialog Show
    */
    show: function(type, data){
        if(!data){data = {};}
        data.dialogType = type ? type : 'alert';
        this.makeModalDialog(data);
    },
    
    /**
    * Alert Modal Dialog
    */    
    alert: function(data){
        // data가 Object 가 아니거나 배열인 경우 content 로 설정한다.
        if(typeof(data) != 'object' || data instanceof Array){
            var content = data;
            data = {content: content};
        }
        this.show('alert', data);
    },
    
    /**
    * Confirm Modal Dialog
    */
    confirm: function(data){
        this.show('confirm', data);
    }
};

