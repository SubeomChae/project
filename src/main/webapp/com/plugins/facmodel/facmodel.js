function getTmpObjsAsEntityIdAndObjectNm(entity_id, objectNm){
	var tmpTmpObj = null;
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].entity_id == entity_id 
				&& facilObjTreeList[h].object_nm == objectNm){
			tmpTmpObj = facilObjTreeList[h];
			break;
		}
	}
	return tmpTmpObj;
}

function getTmpArrObjsAsObjectNo(objectNo){
	var tmpTmpArrObjs = [];
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].object_no == objectNo){
			tmpTmpArrObjs.push(facilObjTreeList[h]);
		}
	}
	return tmpTmpArrObjs;
}

function hasObjectNo(objectNo){
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].object_no == objectNo){
			return true;
		}
	}
	return false;
}

function getTmpArrObjs(_entity_id){
	var tmpTmpArrObjs = [];
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].entity_id == _entity_id){
			tmpTmpArrObjs.push(facilObjTreeList[h]);
		}
	}
	return tmpTmpArrObjs;
}

function getTmpArrObjsWithLvl(_entity_id, _object_lvl){
	var tmpTmpArrObjs = [];
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].entity_id == _entity_id
				&& facilObjTreeList[h].object_lvl == _object_lvl){
			tmpTmpArrObjs.push(facilObjTreeList[h]);
		}
	}
	return tmpTmpArrObjs;
}

function getTmpArrObjsWithRanking(_entity_id, _object_lvl){
	var tmpTmpArrObjs = [];
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].entity_id == _entity_id
				&& facilObjTreeList[h].ranking == _object_lvl){
			tmpTmpArrObjs.push(facilObjTreeList[h]);
		}
	}
	return tmpTmpArrObjs;
}

function getTmpArrObjsAsUpperNo(_upper_no){
	var tmpTmpArrObjs = [];
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].upper_no == _upper_no){
			tmpTmpArrObjs.push(facilObjTreeList[h]);
		}
	}
	return tmpTmpArrObjs;
}

function replaceObjectNo(targetObjectNo, idx, replaceChar){
	var newObjectNo = targetObjectNo.substring(0, idx) + replaceChar + targetObjectNo.substring(idx+1);
	var obj = null;
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].object_no == newObjectNo){
			obj = facilObjTreeList[h];
			break;
		}
	}
	if(obj == null){
		obj = {
			object_no : '',
			object_nm : '',
			abbr_nm : ''
		};
	}
	return obj;
}

function getChildsAsPreObjectNo(pre_object_no, _entity_id){
	var tmpTmpArrObjs = [];
	for(var h = 0 ; h < facilObjTreeList.length ; h++){
		if(facilObjTreeList[h].object_no.substring(0, pre_object_no.length) == pre_object_no
				&& facilObjTreeList[h].entity_id == _entity_id){
			tmpTmpArrObjs.push(facilObjTreeList[h]);
		}
	}
	return tmpTmpArrObjs;
}

/*********************************************
*              	    교량(BR)
**********************************************/
function facil_BR_getSpansAsSpecLabel(facilObjTreeList){
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : '거더',	
		width : 20,
		height : 3,
		depth : 24,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0xA566FF
	};
	
	var arrSpanParts = [];
	var __startX = 0;
	var pre_object_no, arrObjs, replaceObj;
	var spans = getTmpArrObjs('BRSP11');
	var apPoints = getTmpArrObjs('BRSP12');
	
	var __spanAllLength = 0;
	for(var s = 0 ; s < spans.length ; s++){
		__spanAllLength += Number(spans[s].ext_length);
	}
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	console.log('__spanAllLength', __spanAllLength + ' ,  lenFact = ' + lenFact);
	
	for(var sp = 0 ; sp < spans.length ; sp++){
		//Number(spans[sp].ext_length)
		var _spanLengh = Number(spans[sp].ext_length);
		pre_object_no = spans[sp].object_no;
		arrObjs = getTmpArrObjsAsUpperNo(pre_object_no);
		for(var ar = 0 ; ar < arrObjs.length ; ar++){
			replaceObj = arrObjs[ar];
			if(replaceObj.entity_id == 'BRBJ2101'){ //바닥판
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0x368AFF,
					model_width  	: _spanLengh / lenFact,
					model_height 	: 3,
					model_depth  	: 20,
					coord_x	   		: __startX,
					coord_y	   		: 17,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
			}else if(replaceObj.entity_id == 'BRBJ2102'){ //거더
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0xA566FF,
					model_width  	: _spanLengh / lenFact,
					model_height 	: 3,
					model_depth  	: 24,
					coord_x	   		: __startX,
					coord_y	   		: 20,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
			}else if(replaceObj.entity_id == 'BRBJ2111'){ //케이블
				
				var spanLenghPrev = 0;
				var spanLenghNext = 0;
				
				if(sp == 0){
					spanLenghPrev = 0;
				}else{
					spanLenghPrev = (Number(spans[sp-1].ext_length) / lenFact);
				}
				if(sp == (spans.length - 1)){
					spanLenghNext = 0;
				}else{
					spanLenghNext = _spanLengh / lenFact;
				}
				
				var __mw = Math.sqrt(Math.pow(22, 2) + Math.pow(spanLenghPrev / 2, 2));
				
				if(spanLenghPrev != 0){
					_bujeObj = {
						object_no 		: replaceObj.object_no,
						entity_id  		: replaceObj.entity_id,
						model_type 		: 'CIRCLE',
						model_fact 		: 1,
						object_nm  		: replaceObj.object_nm,	
						abbr_nm 		: replaceObj.abbr_nm,
						model_color  	: 0xC4B73B,
						model_width  	: __mw,
						model_height 	: 1,
						model_depth  	: 1,
						coord_x	   		: __startX - (spanLenghPrev / 2) - 4,
						coord_y	   		: 33,
						coord_z	   		: 4,
						angle_x			: 0,
						angle_y			: 0,
						angle_z			: 360 - Math.sin( 16 / __mw) * 100
					};
					arrSpanParts.push(_bujeObj);
				}
				
				if(spanLenghNext != 0){
					__mw = Math.sqrt(Math.pow(22, 2) + Math.pow((_spanLengh / lenFact) / 2, 2));
					_bujeObj = {
							object_no 		: replaceObj.object_no,
							entity_id  		: replaceObj.entity_id,
							model_type 		: 'CIRCLE',
							model_fact 		: 1,
							object_nm  		: replaceObj.object_nm,	
							abbr_nm 		: replaceObj.abbr_nm,
							model_color  	: 0xC4B73B,
							model_width  	: __mw,
							model_height 	: 1,
							model_depth  	: 1,
							coord_x	   		: __startX - 4,
							coord_y	   		: 33,
							coord_z	   		: 4,
							angle_x			: 0,
							angle_y			: 0,
							angle_z			: Math.sin( 16 / __mw) * 100
						};
					arrSpanParts.push(_bujeObj);
				}
				
				
				
			}
		}
		
		__startX += (_spanLengh / lenFact);
	}
	
	
	__startX = 0;
	for(var ap = 0 ; ap < apPoints.length ; ap++){
		pre_object_no = apPoints[ap].object_no;
		arrObjs = getTmpArrObjsAsUpperNo(pre_object_no);
		var _spanLengh = 0;
		try{
			_spanLengh = Number(spans[ap].ext_length);
		}catch(e){
		}
		
		for(var ar = 0 ; ar < arrObjs.length ; ar++){
			
			replaceObj = arrObjs[ar];
			if(replaceObj.entity_id == 'BRBJ2202'){ //기초
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0x993800,
					model_width  	: 8,
					model_height 	: 3,
					model_depth  	: 14,
					coord_x	   		: __startX - 4,
					coord_y	   		: 0,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
			}else if(replaceObj.entity_id == 'BRBJ220101' 
					|| replaceObj.entity_id == 'BRBJ220102'
					|| replaceObj.entity_id == 'BRBJ2203'){ //교대, 교각, 주탑(높이 2.5배)
				
				var pHeight = 14;
				if(replaceObj.entity_id == 'BRBJ2203'){
					pHeight = 42;
				}
				
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0xA6A6A6,
					model_width  	: 4,
					model_height 	: pHeight,
					model_depth  	: 12,
					coord_x	   		: __startX - 2,
					coord_y	   		: 3,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
			}else if(replaceObj.entity_id == 'BRBJ2301'){ //교량받침
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0x5D5D5D,
					model_width  	: 8,
					model_height 	: 3,
					model_depth  	: 14,
					coord_x	   		: __startX - 4,
					coord_y	   		: 14,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
			}
			
			
		}
		
		__startX += (_spanLengh / lenFact);
	}
	
	
	for(var a = 0 ; a < arrSpanParts.length ; a++){
		arrSpanParts[a].coord_x -= (__spanAllLength / lenFact / 2);
	}
	
	return arrSpanParts;
}


/*********************************************
*              	    복개구조물(CS)
**********************************************/
function facil_CS_getSpansAsSpecLabel(facilObjTreeList){
	
	var arrSpanParts = [];
	var allSpanLength = 0;
	var arrSpansInfo = [];
	var defaultSpanLength = 50;
	
	//color는 Decimal 형태 (https://www.rapidtables.com/convert/number/hex-to-decimal.html?x=0x368AFF)
	//var pierCnt = 15; //다리갯수
	//attr = [width, height, depth]
	var br_base_attr 		= [8, 3, 14, 0x993800, '기초', 'D']; //기초
	var br_abutment_attr 	= [4, 14, 12, 0x2F9D27, '교대', 'D']; //교대
	var br_pier_attr 		= [4, 14, 12, 0x747474, '교각', 'D']; //교각
	var br_girder_attr 		= [20, 3, 18, 0xA566FF, '거더', 'U']; //거더
	var br_slab_attr 		= [br_girder_attr[0], 3, 24, 0x368AFF, '바닥판', 'U']; //바닥판
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : '거더',	
		width : 20,
		height : 3,
		depth : 24,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0xA566FF
	};
	
	var __spanAllLengthBR = 0;
	var __spanAllLengthTU = 0;
	
	var arrSpanPartsBR = getTmpArrObjsAsUpperNo('BR01');
	var arrSpanPartsTU = getTmpArrObjsAsUpperNo('TU01');
	
	var __startX = 0;
	var __spanAllLength = arrSpanPartsTU.length * defaultSpanLength;
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	var __forCenter = __spanAllLength / lenFact / 2;
	
	var tunnelWidth = 30;
	
	var replaceObj = null;
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	for(var sl = 0 ; sl < arrSpanPartsTU.length ; sl++){
		var __spanLen = defaultSpanLength / lenFact;
		replaceObj = arrSpanPartsTU[sl];
		var pre_object_no = replaceObj.object_no;
		
		var _bujeObj = null;
		_bujeObj = {
			object_no 		: pre_object_no + '-0051',
			entity_id  		: 'TUBJ1601',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '바닥면',	
			abbr_nm 		: 'B',
			model_color  	: 0x993800,
			model_width  	: __spanLen,
			model_height 	: 3,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'TUBJ1101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '천장부',	
			abbr_nm 		: '',
			model_color  	: 0x6B9900,
			model_width  	: __spanLen,
			model_height 	: 2,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 28,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'TUBJ1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: 'W',
			model_color  	: 0x4641D9,
			model_width  	: 3,
			model_height 	: 25,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter) + defaultSpanLength -3,
			coord_y	   		: 3,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0061',
			entity_id  		: 'TUBJ1701',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '기둥부',	
			abbr_nm 		: 'C',
			model_color  	: 0x5CD1E5,
			model_width  	: 5,
			model_height 	: 25,
			model_depth  	: 5,
			coord_x	   		: financial(__startX - __forCenter) + (defaultSpanLength / 2),
			coord_y	   		: 3,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		var object_nm = replaceObj.object_nm;
		var tmpTmpObj = getTmpObjsAsEntityIdAndObjectNm('CSSP11', object_nm);
		if(tmpTmpObj != null){
			_bujeObj = {
				object_no 		: tmpTmpObj.object_no + '-0022',
				entity_id  		: 'BRBJ220102',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '교각',	
				abbr_nm 		: 'P',
				model_color  	: 0xA6A6A6,
				model_width  	: 5,
				model_height 	: 22,
				model_depth  	: tunnelWidth,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 8,
				coord_z	   		: 0,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: tmpTmpObj.object_no + '-0001',
				entity_id  		: 'BRBJ2101',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '바닥판',	
				abbr_nm 		: '',
				model_color  	: 0xA566FF,
				model_width  	: __spanLen,
				model_height 	: 3,
				model_depth  	: tunnelWidth,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 30,
				coord_z	   		: 0,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: tmpTmpObj.object_no + '-0002',
				entity_id  		: 'BRBJ2102',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '거더',	
				abbr_nm 		: '',
				model_color  	: 0xCCA63D,
				model_width  	: __spanLen,
				model_height 	: 3,
				model_depth  	: tunnelWidth + 6,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 33,
				coord_z	   		: 0,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: tmpTmpObj.object_no + '-0023',
				entity_id  		: 'BRBJ2202',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '기초',	
				abbr_nm 		: 'P',
				model_color  	: 0xCCA63D,
				model_width  	: 10,
				model_height 	: 5,
				model_depth  	: tunnelWidth,
				coord_x	   		: financial(__startX - __forCenter) - (5 / 2),
				coord_y	   		: 3,
				coord_z	   		: 0,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
		}
		
		__startX += __spanLen;
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   터널(TU)
**********************************************/
function facil_TU_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var tunnelWidth = 28;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 1,
		depth : 10,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var SPAN_LEN_ADJUST_ENTITY_ID = 'TUSP11';
	var __startX = 0;
	var __spanAllLength = 0;
	for(var f = 0 ; f < facilObjTreeList.length ; f++){
		if(facilObjTreeList[f].entity_id === SPAN_LEN_ADJUST_ENTITY_ID){
			_arrSpanLens.push(facilObjTreeList[f]);
			if(facilObjTreeList[f].ext_length == ''){
				__spanAllLength += _DEFAULT_BUJE_OBJ.width;
			}else{
				__spanAllLength += Number(facilObjTreeList[f].ext_length);
			}
		}
	}
	__spanAllLength = financial(__spanAllLength);
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	for(var sl = 0 ; sl < _arrSpanLens.length ; sl++){
		var __spanLen = Number(_arrSpanLens[sl].ext_length) / lenFact;
		var _bujeObj = null;
		pre_object_no = _arrSpanLens[sl].object_no;
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'TUBJ1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: 'W',
			model_color  	: _DEFAULT_BUJE_OBJ.color,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.depth,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: -(tunnelWidth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'TUBJ1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: 'W',
			model_color  	: _DEFAULT_BUJE_OBJ.color,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.depth,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: (tunnelWidth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'TUBJ1101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '천장부',	
			abbr_nm 		: '',
			model_color  	: 0xD1B2FF,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: _DEFAULT_BUJE_OBJ.depth,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0051',
			entity_id  		: 'TUBJ160101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '바닥면',	
			abbr_nm 		: 'B',
			model_color  	: 0xFFBB00,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		__startX += __spanLen * facilLenFact;
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   지하차도(UR)
**********************************************/
function facil_UR_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var tunnelWidth = 28;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 1,
		depth : 10,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var SPAN_LEN_ADJUST_ENTITY_ID = 'TUSP11';
	var __startX = 0;
	var __spanAllLength = 0;
	for(var f = 0 ; f < facilObjTreeList.length ; f++){
		if(facilObjTreeList[f].entity_id === SPAN_LEN_ADJUST_ENTITY_ID){
			_arrSpanLens.push(facilObjTreeList[f]);
			if(facilObjTreeList[f].ext_length == ''){
				__spanAllLength += _DEFAULT_BUJE_OBJ.width;
			}else{
				__spanAllLength += Number(facilObjTreeList[f].ext_length);
			}
		}
	}
	__spanAllLength = financial(__spanAllLength);
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	for(var sl = 0 ; sl < _arrSpanLens.length ; sl++){
		var __spanLen = Number(_arrSpanLens[sl].ext_length) / lenFact;
		var _bujeObj = null;
		pre_object_no = _arrSpanLens[sl].object_no;
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'TUBJ1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: 'W',
			model_color  	: _DEFAULT_BUJE_OBJ.color,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.depth,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: -(tunnelWidth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'TUBJ1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: 'W',
			model_color  	: _DEFAULT_BUJE_OBJ.color,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.depth,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: (tunnelWidth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'TUBJ1101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '천장부',	
			abbr_nm 		: '',
			model_color  	: 0xD1B2FF,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: _DEFAULT_BUJE_OBJ.depth,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0051',
			entity_id  		: 'TUBJ160101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '바닥면',	
			abbr_nm 		: 'B',
			model_color  	: 0xFFBB00,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		__startX += __spanLen * facilLenFact;
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   갑문시설(HL)
**********************************************/
function facil_HL_getSpansAsSpecLabel(facilObjTreeList){
	var arrSpanParts = [];
	var partSizeWidth = 20;
	var partSizeDepth = 20;
	
	var replaceObj = null;
	
	var offsetY = 0;
	
	var gabguSisulGap = 30;
	var gabguSisul = getTmpArrObjsWithLvl('HLBJ11', '3');
	for(var g = 0 ; g < gabguSisul.length ; g++){
		var gabWalls = getTmpArrObjsAsUpperNo(gabguSisul[g].object_no);
		for(var w = 0 ; w < gabWalls.length ; w++){
			var parts = getTmpArrObjsAsUpperNo(gabWalls[w].object_no);
			for(var p = 0 ; p < parts.length ; p++){
				replaceObj = parts[p];
				//console.log(replaceObj); //W10N-01 ~ W10N-0
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0003',
					entity_id  		: 'HLBJ11010111',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '기초부',	
					abbr_nm 		: '',
					model_color  	: 0xCCA63D,
					model_width  	: partSizeWidth, 
					model_height 	: 5, 
					model_depth  	: partSizeDepth, 
					coord_x	   		: (-(partSizeWidth * parts.length) / 2) + (partSizeWidth * p),
					coord_y	   		: 0,
					coord_z	   		: offsetY,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0002',
					entity_id  		: 'HLBJ11010102',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '본체부',	
					abbr_nm 		: '',
					model_color  	: 0xD5D5D5,
					model_width  	: partSizeWidth * 2 / 3, 
					model_height 	: 15, 
					model_depth  	: partSizeDepth * 2 / 3, 
					coord_x	   		: (-(partSizeWidth * parts.length) / 2) + (partSizeWidth * p) + (partSizeWidth / 6),
					coord_y	   		: 5,
					coord_z	   		: offsetY,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0001',
					entity_id  		: 'HLBJ11010101',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '상부공',	
					abbr_nm 		: '',
					model_color  	: 0x8C8C8C,
					model_width  	: partSizeWidth, 
					model_height 	: 5, 
					model_depth  	: partSizeDepth, 
					coord_x	   		: (-(partSizeWidth * parts.length) / 2) + (partSizeWidth * p),
					coord_y	   		: 20,
					coord_z	   		: offsetY,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
					
			}
			offsetY += partSizeDepth;
		}
		offsetY += (partSizeDepth * 2);
	}
	
	for(var ar = 0 ; ar < arrSpanParts.length ; ar++){
		arrSpanParts[ar].coord_z -= ((offsetY/2) - (partSizeDepth * 2));
	}
	
	return arrSpanParts;
}

/*********************************************
*              	   계류시설(HM)
**********************************************/
function facil_HM_getSpansAsSpecLabel(facilObjTreeList){
	var arrSpanParts = [];
	var partSizeWidth = 10;
	var partSizeDepth = 30;
	
	var replaceObj = null;
	
	var offsetY = 0;
	
	var gabguSisulGap = 30;
	var gabguSisul = getTmpArrObjsWithLvl('HMSP11', '2');
	for(var g = 0 ; g < gabguSisul.length ; g++){
		var gabWalls = getTmpArrObjsAsUpperNo(gabguSisul[g].object_no);
		if(0 < gabWalls.length && gabWalls[0].entity_id != 'HMSP21'){
			
		}else{
			for(var p = 0 ; p < gabWalls.length ; p++){
				replaceObj = gabWalls[p];
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0301',
					entity_id  		: 'HMBJ2103',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '기초부',	
					abbr_nm 		: '',
					model_color  	: 0xCCA63D,
					model_width  	: partSizeWidth, 
					model_height 	: 5, 
					model_depth  	: partSizeDepth, 
					coord_x	   		: (-(partSizeWidth * gabWalls.length) / 2) + (partSizeWidth * p),
					coord_y	   		: 0,
					coord_z	   		: offsetY,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0102',
					entity_id  		: 'HMBJ210102',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '본체부',	
					abbr_nm 		: '',
					model_color  	: 0xD5D5D5,
					model_width  	: partSizeWidth * 2 / 3, 
					model_height 	: 15, 
					model_depth  	: partSizeDepth * 2 / 3, 
					coord_x	   		: (-(partSizeWidth * gabWalls.length) / 2) + (partSizeWidth * p) + (partSizeWidth / 6),
					coord_y	   		: 5,
					coord_z	   		: offsetY,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0101',
					entity_id  		: 'HMBJ210101',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '상부공',	
					abbr_nm 		: '',
					model_color  	: 0x8C8C8C,
					model_width  	: partSizeWidth, 
					model_height 	: 5, 
					model_depth  	: partSizeDepth, 
					coord_x	   		: (-(partSizeWidth * gabWalls.length) / 2) + (partSizeWidth * p),
					coord_y	   		: 20,
					coord_z	   		: offsetY,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
			}
			offsetY += partSizeWidth;
		}
		offsetY += (partSizeDepth * 2);
	}
	
	for(var ar = 0 ; ar < arrSpanParts.length ; ar++){
		arrSpanParts[ar].coord_z -= ((offsetY/2) - (partSizeDepth * 2));
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   방파제,파제제 및 호안(HB)
**********************************************/
function facil_HB_getSpansAsSpecLabel(facilObjTreeList){
	var arrSpanParts = [];
	var partSizeWidth = 20;
	var partSizeDepth = 20;
	
	var replaceObj = null;
	
	var offsetX = 0;
	var offsetY = 0;
	
	var gabguSisulGap = 30;
	var gabguSisul = getTmpArrObjsWithLvl('HBSP11', '2');
	
	var __spanAllLength = 0;
	for(var g = 0 ; g < gabguSisul.length ; g++){
		var gabWalls = getTmpArrObjsAsUpperNo(gabguSisul[g].object_no);
		for(var p = 0 ; p < gabWalls.length ; p++){
			__spanAllLength += partSizeWidth;
		}
	}
	
	var __startX = 0;
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	console.log(__spanAllLength + ' , ' + lenFact);
	
	for(var g = 0 ; g < gabguSisul.length ; g++){
		var gabWalls = getTmpArrObjsAsUpperNo(gabguSisul[g].object_no);
		if(0 < gabWalls.length && gabWalls[0].entity_id != 'HBSP21'){
			
		}else{
			for(var p = 0 ; p < gabWalls.length ; p++){
				replaceObj = gabWalls[p];
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0105',
					entity_id  		: 'HBBJ1105',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '기초부',	
					abbr_nm 		: '',
					model_color  	: 0xCCA63D,
					model_width  	: partSizeWidth / lenFact, 
					model_height 	: 5, 
					model_depth  	: partSizeDepth, 
					coord_x	   		: financial(__startX - __forCenter),
					coord_y	   		: 0,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0102',
					entity_id  		: 'HBBJ1102',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '직립부',	
					abbr_nm 		: '',
					model_color  	: 0xD5D5D5,
					model_width  	: partSizeWidth / lenFact * 2 / 3, 
					model_height 	: 15, 
					model_depth  	: partSizeDepth * 2 / 3, 
					coord_x	   		: financial(__startX - __forCenter),
					coord_y	   		: 5,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				_bujeObj = {
					object_no 		: replaceObj.object_no + '-0101',
					entity_id  		: 'HBBJ1101',
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: '상부공',	
					abbr_nm 		: '',
					model_color  	: 0x8C8C8C,
					model_width  	: partSizeWidth / lenFact, 
					model_height 	: 5, 
					model_depth  	: partSizeDepth, 
					coord_x	   		: financial(__startX - __forCenter),
					coord_y	   		: 20,
					coord_z	   		: 0,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				__startX += (partSizeWidth / lenFact);
			}
			//offsetY += partSizeWidth;
		}
		//offsetY += (partSizeDepth);
	}
	
	for(var ar = 0 ; ar < arrSpanParts.length ; ar++){
		arrSpanParts[ar].coord_z -= ((offsetY/2) - (partSizeDepth * 2));
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   댐(DA)
**********************************************/
function facil_DA_getSpansAsSpecLabel(facilObjTreeList){
	
	var spillwayWidth = 60; //여수로 넓이
	var wallWidth = 3; //벽 넓이
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 1,
		depth : 10,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};

	var start = 0;
	var arrSpanParts = [];
	//댐마루,상류사면,하류사면
	var tmpArrObjs = [];
	var _bujeObj = null;
	var replaceObj = null;
	
	start = 0;
	///////////// 댐마루, 상류사면(강쪽에 있는), 하류사면 //////////
	tmpArrObjs = getTmpArrObjs('DABJ110101');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 댐마루 ///////////
		_bujeObj = {
			object_no 		: tmpArrObjs[c].object_no,
			entity_id  		: 'DABJ110101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: tmpArrObjs[c].object_nm,	
			abbr_nm 		: tmpArrObjs[c].abbr_nm,
			model_color  	: 0xCC723D,
			model_width  	: 20,
			model_height 	: 5,
			model_depth  	: 20,
			coord_x	   		: start,
			coord_y	   		: 40,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		///// 하류사면 ///////////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 10, '3');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ110103',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0x8C8C8C,
			model_width  	: 20,
			model_height 	: 5,
			model_depth  	: 60,
			coord_x	   		: start,
			coord_y	   		: 18,
			coord_z	   		: 27,
			angle_x			: 5,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
			
		///// 상류사면 ///////////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 10, '2');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ110102',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0xC4B73B,
			model_width  	: 20,
			model_height 	: 5,
			model_depth  	: 60,
			coord_x	   		: start,
			coord_y	   		: 18,
			coord_z	   		: -27,
			angle_x			: 310,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
			
		start += 20;
	}
	
	var arrSpanPartsLen = arrSpanParts.length;
	for(var a = arrSpanPartsLen-1 ; a >= 0 ; a--){
		if(!hasObjectNo(arrSpanParts[a].object_no)){
			arrSpanParts.splice(a, 1);
		}
	}
	
	/////////// 댐에 강 표시 ///////////////
	_bujeObj = {
		object_no 		: 'LAKE',
		entity_id  		: '',
		model_type 		: 'BOX',
		model_fact 		: 1,
		object_nm  		: '호수',
		abbr_nm 		: '',
		model_color  	: 0xB2CCFF,
		model_width  	: spillwayWidth+start,
		model_height 	: 35,
		model_depth  	: 80,
		coord_x	   		: -spillwayWidth,
		coord_y	   		: 0,
		coord_z	   		: -40,
		angle_x			: 0,
		angle_y			: 0,
		angle_z			: 0
	};
	arrSpanParts.push(_bujeObj);
	
	start = 0;
	/////////// 접근수로 ///////////////
	tmpArrObjs = getTmpArrObjs('DABJ11020103');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var depth = 20;
		///// 바닥슬래브 ///////////
		_bujeObj = {
			object_no 		: tmpArrObjs[c].object_no,
			entity_id  		: 'DABJ11020103',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: tmpArrObjs[c].object_nm,	
			abbr_nm 		: tmpArrObjs[c].abbr_nm,
			model_color  	: 0x8C8C8C,
			model_width  	: spillwayWidth,
			model_height 	: 3,
			model_depth  	: depth / tmpArrObjs.length,
			coord_x	   		: -spillwayWidth,
			coord_y	   		: 35,
			coord_z	   		: -(depth / 2 / 2) + (depth / tmpArrObjs.length) * c,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		///// 좌측벽체 ///////////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '4');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ11020104',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0x997000,
			model_width  	: wallWidth,
			model_height 	: 7,
			model_depth  	: depth / tmpArrObjs.length,
			coord_x	   		: -wallWidth,
			coord_y	   		: 35 + 3,
			coord_z	   		: -(depth / 2 / 2) + (depth / tmpArrObjs.length) * c,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		///// 우측벽체 ///////////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '5');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ11020105',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0x997000,
			model_width  	: wallWidth,
			model_height 	: 7,
			model_depth  	: depth / tmpArrObjs.length,
			coord_x	   		: -spillwayWidth,
			coord_y	   		: 35 + 3,
			coord_z	   		: -(depth / 2 / 2) + (depth / tmpArrObjs.length) * c,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	
	/////////// 급경사수로 ///////////////
	tmpArrObjs = getTmpArrObjs('DABJ11020303');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var depth = 20;
		///// 바닥슬래브 ///////////
		_bujeObj = {
			object_no 		: tmpArrObjs[c].object_no,
			entity_id  		: 'DABJ11020303',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: tmpArrObjs[c].object_nm,	
			abbr_nm 		: tmpArrObjs[c].abbr_nm,
			model_color  	: 0x8C8C8C,
			model_width  	: spillwayWidth,
			model_height 	: 3,
			model_depth  	: 71,
			coord_x	   		: -spillwayWidth,
			coord_y	   		: 16,
			coord_z	   		: 31,
			angle_x			: 28,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		///// 좌측벽체 ///////////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '4');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ11020304',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0xCCA63D,
			model_width  	: wallWidth,
			model_height 	: 7,
			model_depth  	: 71,
			coord_x	   		: -wallWidth,
			coord_y	   		: 17,
			coord_z	   		: 33,
			angle_x			: 28,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		///// 우측벽체 ///////////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '5');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ11020305',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0xCCA63D,
			model_width  	: wallWidth,
			model_height 	: 7,
			model_depth  	: 71,
			coord_x	   		: -spillwayWidth,
			coord_y	   		: 17,
			coord_z	   		: 33,
			angle_x			: 28,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	//권양기, 문비
	tmpArrObjs = getTmpArrObjsWithLvl('DABJ12010102', '5');
	var spillwayGap = 5;
	var gateGap = 2;
	var gateHeight = 12;
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var gateWidth = ((spillwayWidth - (wallWidth * 2)) / tmpArrObjs.length) - (gateGap * (tmpArrObjs.length -1));
		//////// 문비 ////
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ12010102',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0xF361DC,
			model_width  	: gateWidth,
			model_height 	: gateHeight,
			model_depth  	: 3,
			coord_x	   		: -spillwayWidth + wallWidth + (gateWidth * c) + (gateGap * c + 1),
			coord_y	   		: 40,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		//////// 권양기 ////
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 8, '1');
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ12010101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0x6B9900,
			model_width  	: gateWidth,
			model_height 	: 3,
			model_depth  	: 6,
			coord_x	   		: -spillwayWidth + wallWidth + (gateWidth * c) + (gateGap * c + 1),
			coord_y	   		: 40 + gateHeight,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	
	//////// 취수탑-피어
	tmpArrObjs = getTmpArrObjs('DABJ11990102');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		//////// 문비 ////
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: 'DABJ11990102',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,
			abbr_nm 		: replaceObj.abbr_nm,
			model_color  	: 0x2F9D27,
			model_width  	: 8,
			model_height 	: 50,
			model_depth  	: 8,
			coord_x	   		: -50,
			coord_y	   		: 0,
			coord_z	   		: -50,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	console.log(arrSpanParts);
	
	return arrSpanParts;
}


/*********************************************
*              	   건축물(AR)
**********************************************/
function facil_AR_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var floorHeight = 15;
	var floorGap = 3;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 40,
		height : 1,
		depth : 50,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var _DEFAULT_BEAM_WIDTH = 2;
	
	var arrSpanParts = [];
	var _arrFloor = [];
	
	var FLOOR_HEIGHT_ADJUST_ENTITY_ID = 'ARSP13';
	
	for(var f = 0 ; f < facilObjTreeList.length ; f++){
		if(facilObjTreeList[f].entity_id === FLOOR_HEIGHT_ADJUST_ENTITY_ID){
			_arrFloor.push(facilObjTreeList[f]);
		}
	}
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	var nowFloorHeight = 0;
	for(var sl = 0 ; sl < _arrFloor.length ; sl++){
		var _bujeObj = null;
		pre_object_no = _arrFloor[sl].object_no;
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0032',
			entity_id  		: 'ARBJ230102',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '바닥슬래브',	
			abbr_nm 		: '',
			model_color  	: 0xCCA63D,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: -financial(_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: nowFloorHeight,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0031',
			entity_id  		: 'ARBJ230101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '천장슬래브',	
			abbr_nm 		: '',
			model_color  	: 0xD5D5D5,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: -financial(_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: nowFloorHeight + floorHeight,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0041',
			entity_id  		: 'ARBJ240101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '내력벽',	
			abbr_nm 		: '',
			model_color  	: 0xA6A6A6,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: floorHeight,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: -financial(_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: nowFloorHeight,
			coord_z	   		: -(_DEFAULT_BUJE_OBJ.depth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0021',
			entity_id  		: 'ARBJ220101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '큰보',	
			abbr_nm 		: '',
			model_color  	: 0xBFA0ED,
			model_width  	: _DEFAULT_BEAM_WIDTH * 2,
			model_height 	: _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: -financial(_DEFAULT_BEAM_WIDTH),
			coord_y	   		: nowFloorHeight + floorHeight - _DEFAULT_BEAM_WIDTH,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0022',
			entity_id  		: 'B001-0022',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '작은보',	
			abbr_nm 		: '',
			model_color  	: 0x47C83E,
			model_width  	: _DEFAULT_BUJE_OBJ.width / 2,
			model_height 	: _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BEAM_WIDTH,
			coord_x	   		: 0,
			coord_y	   		: nowFloorHeight + floorHeight - _DEFAULT_BEAM_WIDTH,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'ARBJ2101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '기둥',	
			abbr_nm 		: 'C',
			model_color  	: 0x6799FF,
			model_width  	: _DEFAULT_BEAM_WIDTH * 2,
			model_height 	: floorHeight - _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BEAM_WIDTH * 2,
			coord_x	   		: -financial(_DEFAULT_BEAM_WIDTH),
			coord_y	   		: nowFloorHeight,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		nowFloorHeight += (floorHeight + floorGap);
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   수문(WG)
**********************************************/
function facil_WG_getSpansAsSpecLabel(facilObjTreeList){
	console.log('facil_ED_getSpansAsSpecLabel');
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var defaultDoclen = 20;
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 25,
		depth : 40,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	
	var drainGateWidth = 20; //배수갑문 넓이
	var drainGateHeight = 40; 
	var drainGateDepth = 40; //배수갑문
	var drainGateGap = 30;
	
	var minLeft = 0;
	var maxLeft = -999;
	/// 배수갑문-수문구체-권양기실 기준
	tmpArrObjs = getTmpArrObjs('WGBJ010101');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '5');///// 기초상판
		
		var baseX = -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap);
		maxLeft = Math.max(maxLeft, baseX + (drainGateWidth / 2));
		
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x997000,
			model_width  	: drainGateWidth,
			model_height 	: 5,
			model_depth  	: drainGateDepth, 
			coord_x	   		: baseX,
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '2');//문기둥
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x5D5D5D,
			model_width  	: drainGateWidth - 10,
			model_height 	: drainGateHeight,
			model_depth  	: drainGateDepth - 10, 
			coord_x	   		: -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap) + (drainGateWidth / 2 / 2),
			coord_y	   		: 5,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '1');//권양기대
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0xD9418C,
			model_width  	: drainGateWidth - 10,
			model_height 	: 3,
			model_depth  	: drainGateDepth - 10, 
			coord_x	   		: -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap) + 5,
			coord_y	   		: drainGateHeight + 5,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '4'); //문틀
		var gateX = -((drainGateGap + 10) * (c+2)) - (10 * c);
		minLeft = Math.min(minLeft, gateX);
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x8041D9,
			model_width  	: drainGateGap,
			model_height 	: 20,
			model_depth  	: 5, 
			coord_x	   		: gateX,
			coord_y	   		: 8,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
	}
	console.log(minLeft + ' , ' + maxLeft)
	
	//// 물받이공
	tmpArrObjs = getTmpArrObjsWithRanking('WGBJ010201', '5');
	var gongWidth = ((Math.abs(minLeft) - Math.abs(maxLeft))/tmpArrObjs.length);
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 상류측 물받이공
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x747474,
			model_width  	: gongWidth,
			model_height 	: 5,
			model_depth  	: 30, 
			coord_x	   		: minLeft + (gongWidth * c),
			coord_y	   		: 0,
			coord_z	   		: -35,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	tmpArrObjs = getTmpArrObjsWithRanking('WGBJ010202', '5');
	gongWidth = ((Math.abs(minLeft) - Math.abs(maxLeft))/tmpArrObjs.length);
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 하류측 물받이공
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x747474,
			model_width  	: gongWidth,
			model_height 	: 5,
			model_depth  	: 30, 
			coord_x	   		: minLeft + (gongWidth * c),
			coord_y	   		: 0,
			coord_z	   		: 35,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	
	///// 강
	_bujeObj = {
		object_no 		: 'LAKE',
		entity_id  		: '',
		model_type 		: 'BOX',
		model_fact 		: 1,
		object_nm  		: '',	
		abbr_nm 		: '',
		model_color  	: 0xB2CCFF,
		model_width  	: Math.abs(minLeft) - Math.abs(maxLeft),
		model_height 	: 10,
		model_depth  	: _DEFAULT_BUJE_OBJ.depth,
		coord_x	   		: minLeft,
		coord_y	   		: 12,
		coord_z	   		: -_DEFAULT_BUJE_OBJ.depth,
		angle_x			: 0,
		angle_y			: 0,
		angle_z			: 0
	};
	arrSpanParts.push(_bujeObj);
	
	
	return arrSpanParts;
}


/*********************************************
*              	   제방(EM)
**********************************************/
function facil_EM_getSpansAsSpecLabel(facilObjTreeList){
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var defaultDoclen = 40;
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 40,
		height : 20,
		depth : 40,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var __startX = 0;
	var __spanAllLength = 0;
	var __spanAllLengthLeft = 0;
	var __spanAllLengthRight = 0;
	tmpArrObjs = getTmpArrObjsAsUpperNo('A002');
	for(var s = 0 ; s < tmpArrObjs.length ; s++){
		__spanAllLengthRight += financial(tmpArrObjs[s].ext_length);
	}
	
	tmpArrObjs = getTmpArrObjsAsUpperNo('A001');
	for(var s = 0 ; s < tmpArrObjs.length ; s++){
		__spanAllLengthLeft += financial(tmpArrObjs[s].ext_length);
	}
	__spanAllLength = Math.max(__spanAllLengthLeft, __spanAllLengthRight);
	
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	var childsTmpArrObjs = [];
	
	tmpArrObjs = getTmpArrObjsAsUpperNo('A001');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var __spanLen = financial(tmpArrObjs[c].ext_length) / lenFact;
		var _bujeObj = null;
		pre_object_no = tmpArrObjs[c].object_no;
		childsTmpArrObjs = getChildsAsPreObjectNo(pre_object_no, 'EMBJ1101');
		
		for(var ch = 0 ; ch < childsTmpArrObjs.length ; ch++){
			replaceObj = childsTmpArrObjs[ch];
			///// 제방
			_bujeObj = {
				object_no 		: replaceObj.object_no,
				entity_id  		: replaceObj.entity_id,
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: replaceObj.object_nm,	
				abbr_nm 		: '',
				model_color  	: 0x997000,
				model_width  	: __spanLen / childsTmpArrObjs.length,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: _DEFAULT_BUJE_OBJ.depth,
				coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * ch),
				coord_y	   		: 0,
				coord_z	   		: -_DEFAULT_BUJE_OBJ.depth / 2,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			var baesuTong = pre_object_no + '-P00' + String(ch + 1);
			var arrBaesu = getTmpArrObjsAsObjectNo(baesuTong);
			if(arrBaesu.length != 0){
				for(var a = 0 ; a < arrBaesu.length ; a++){
					replaceObj = arrBaesu[a];
					
					_bujeObj = {
						object_no 		: replaceObj.object_no,
						entity_id  		: replaceObj.entity_id,
						model_type 		: 'BOX',
						model_fact 		: 1,
						object_nm  		: replaceObj.object_nm,	
						abbr_nm 		: '',
						model_color  	: 0x4641D9,
						model_width  	: 10,
						model_height 	: 10,
						model_depth  	: 10,
						coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * (ch + 1)) - 5,
						coord_y	   		: 0,
						coord_z	   		: -_DEFAULT_BUJE_OBJ.depth / 2 - 20,
						angle_x			: 0,
						angle_y			: 0,
						angle_z			: 0
					};
					arrSpanParts.push(_bujeObj);
				}
			}			
		}		
		
		__startX += __spanLen * facilLenFact;
	}
	__startX = 0;
	
	tmpArrObjs = getTmpArrObjsAsUpperNo('A002');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var __spanLen = financial(tmpArrObjs[c].ext_length) / lenFact;
		var _bujeObj = null;
		pre_object_no = tmpArrObjs[c].object_no;
		childsTmpArrObjs = getChildsAsPreObjectNo(pre_object_no, 'EMBJ1101');
		
		for(var ch = 0 ; ch < childsTmpArrObjs.length ; ch++){
			replaceObj = childsTmpArrObjs[ch];
			///// 제방
			_bujeObj = {
				object_no 		: replaceObj.object_no,
				entity_id  		: replaceObj.entity_id,
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: replaceObj.object_nm,	
				abbr_nm 		: '',
				model_color  	: 0x997000,
				model_width  	: __spanLen / childsTmpArrObjs.length,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: _DEFAULT_BUJE_OBJ.depth,
				coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * ch),
				coord_y	   		: 0,
				coord_z	   		: (_DEFAULT_BUJE_OBJ.depth / 2),
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			var baesuTong = pre_object_no + '-P00' + String(ch + 1);
			var arrBaesu = getTmpArrObjsAsObjectNo(baesuTong);
			if(arrBaesu.length != 0){
				for(var a = 0 ; a < arrBaesu.length ; a++){
					replaceObj = arrBaesu[a];
					
					_bujeObj = {
						object_no 		: replaceObj.object_no,
						entity_id  		: replaceObj.entity_id,
						model_type 		: 'BOX',
						model_fact 		: 1,
						object_nm  		: replaceObj.object_nm,	
						abbr_nm 		: '',
						model_color  	: 0x4641D9,
						model_width  	: 10,
						model_height 	: 10,
						model_depth  	: 10,
						coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * (ch + 1)) - 5,
						coord_y	   		: 0,
						coord_z	   		: _DEFAULT_BUJE_OBJ.depth,
						angle_x			: 0,
						angle_y			: 0,
						angle_z			: 0
					};
					arrSpanParts.push(_bujeObj);
				}
			}
		}
		__startX += __spanLen * facilLenFact;
	}	
	
	return arrSpanParts;
}


/*********************************************
*              	   하구둑(ED)
**********************************************/
function facil_ED_getSpansAsSpecLabel(facilObjTreeList){
	console.log('facil_ED_getSpansAsSpecLabel');
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var defaultDoclen = 20;
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 25,
		depth : 40,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	tmpArrObjs = getTmpArrObjs('EDBJ110101');
	var __startX = 0;
	var __spanAllLength = 0;
	__spanAllLength = financial(tmpArrObjs.length * defaultDoclen);
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var __spanLen = defaultDoclen / lenFact;
		var _bujeObj = null;
		replaceObj = tmpArrObjs[c];
		
		///// 방조제
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x997000,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: financial(__startX),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		__startX += __spanLen * facilLenFact;
	}
	
	var drainGateWidth = 20; //배수갑문 넓이
	var drainGateHeight = 40; 
	var drainGateDepth = 40; //배수갑문
	var drainGateGap = 30;
	
	var minLeft = 0;
	var maxLeft = -999;
	/// 배수갑문-수문구체-권양기실 기준
	tmpArrObjs = getTmpArrObjs('EDBJ210101');
	var tmpArrObjsTmp = getTmpArrObjs('EDBJ210201');
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '7');///// 기초상판
		
		var baseX = -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap);
		maxLeft = Math.max(maxLeft, baseX + (drainGateWidth / 2));
		
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x997000,
			model_width  	: drainGateWidth,
			model_height 	: 5,
			model_depth  	: drainGateDepth, 
			coord_x	   		: baseX,
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '3');//문주
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x5D5D5D,
			model_width  	: drainGateWidth - 10,
			model_height 	: drainGateHeight,
			model_depth  	: drainGateDepth - 10, 
			coord_x	   		: -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap) + (drainGateWidth / 2 / 2),
			coord_y	   		: 5,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '6');//지수벽
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x4641D9,
			model_width  	: drainGateWidth - 10,
			model_height 	: 20,
			model_depth  	: 5, 
			coord_x	   		: -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap) + (drainGateWidth / 2 / 2),
			coord_y	   		: 5,
			coord_z	   		: -(drainGateDepth / 2) + (5 / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '2');//권양기대
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0xD9418C,
			model_width  	: drainGateWidth - 10,
			model_height 	: 3,
			model_depth  	: drainGateDepth - 10, 
			coord_x	   		: -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap) + 5,
			coord_y	   		: drainGateHeight + 5,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		replaceObj = replaceObjectNo(tmpArrObjs[c].object_no, 13, '1');//권양기실
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x6B9900,
			model_width  	: drainGateWidth,
			model_height 	: 15,
			model_depth  	: drainGateDepth, 
			coord_x	   		: -(drainGateWidth * (c + 1)) - ((c + 1) * drainGateGap),
			coord_y	   		: drainGateHeight + 8,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		try{
			replaceObj = tmpArrObjsTmp[c]; //갑문
			var gateX = -((drainGateGap + 10) * (c+2)) - (10 * c);
			minLeft = Math.min(minLeft, gateX);
			_bujeObj = {
				object_no 		: replaceObj.object_no,
				entity_id  		: replaceObj.entity_id,
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: replaceObj.object_nm,	
				abbr_nm 		: '',
				model_color  	: 0x8041D9,
				model_width  	: drainGateGap,
				model_height 	: 20,
				model_depth  	: 5, 
				coord_x	   		: gateX,
				coord_y	   		: 8,
				coord_z	   		: 0,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
		}catch(e){
			
		}
		
	}
	console.log(minLeft + ' , ' + maxLeft)
	
	//// 물받이공
	tmpArrObjs = getTmpArrObjsWithLvl('EDBJ211101', '5');
	var gongWidth = ((Math.abs(minLeft) - Math.abs(maxLeft))/tmpArrObjs.length);
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 상류측 물받이공
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x747474,
			model_width  	: gongWidth,
			model_height 	: 5,
			model_depth  	: 30, 
			coord_x	   		: minLeft + (gongWidth * c),
			coord_y	   		: 0,
			coord_z	   		: -35,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	tmpArrObjs = getTmpArrObjsWithLvl('EDBJ211102', '5');
	gongWidth = ((Math.abs(minLeft) - Math.abs(maxLeft))/tmpArrObjs.length);
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 하류측 물받이공
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x747474,
			model_width  	: gongWidth,
			model_height 	: 5,
			model_depth  	: 30, 
			coord_x	   		: minLeft + (gongWidth * c),
			coord_y	   		: 0,
			coord_z	   		: 35,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	tmpArrObjs = getTmpArrObjsWithLvl('EDBJ211301', '5');
	gongWidth = ((Math.abs(minLeft) - Math.abs(maxLeft))/tmpArrObjs.length);
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 하류측 바닥보호공
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x997000,
			model_width  	: gongWidth,
			model_height 	: 5,
			model_depth  	: 30, 
			coord_x	   		: minLeft + (gongWidth * c),
			coord_y	   		: 0,
			coord_z	   		: -65,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	tmpArrObjs = getTmpArrObjsWithLvl('EDBJ211302', '5');
	gongWidth = ((Math.abs(minLeft) - Math.abs(maxLeft))/tmpArrObjs.length);
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		///// 하류측 바닥보호공
		replaceObj = tmpArrObjs[c];
		_bujeObj = {
			object_no 		: replaceObj.object_no,
			entity_id  		: replaceObj.entity_id,
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: replaceObj.object_nm,	
			abbr_nm 		: '',
			model_color  	: 0x997000,
			model_width  	: gongWidth,
			model_height 	: 5,
			model_depth  	: 30, 
			coord_x	   		: minLeft + (gongWidth * c),
			coord_y	   		: 0,
			coord_z	   		: 65,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
	}
	
	
	///// 강
	_bujeObj = {
		object_no 		: 'LAKE',
		entity_id  		: '',
		model_type 		: 'BOX',
		model_fact 		: 1,
		object_nm  		: '',	
		abbr_nm 		: '',
		model_color  	: 0xB2CCFF,
		model_width  	: (__spanAllLength + (drainGateWidth + drainGateGap) * tmpArrObjs.length),
		model_height 	: 10,
		model_depth  	: _DEFAULT_BUJE_OBJ.depth,
		coord_x	   		: -((drainGateWidth + drainGateGap) * (tmpArrObjs.length + 1)),
		coord_y	   		: 12,
		coord_z	   		: -_DEFAULT_BUJE_OBJ.depth,
		angle_x			: 0,
		angle_y			: 0,
		angle_z			: 0
	};
	arrSpanParts.push(_bujeObj);
	
	
	return arrSpanParts;
}


/*********************************************
*              	   보(BO)
**********************************************/
function facil_BO_getSpansAsSpecLabel(facilObjTreeList){
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var defaultDoclen = 40;
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 40,
		height : 10,
		depth : 20,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var __startX = 0;
	var __spanAllLength = 0;
	var __spanAllLengthLeft = 0;
	var __spanAllLengthRight = 0;
	
	tmpArrObjs = getTmpArrObjs('BOBJ110101');
	for(var s = 0 ; s < tmpArrObjs.length ; s++){
		__spanAllLengthLeft += financial(defaultDoclen);
	}
	__spanAllLength = Math.max(__spanAllLengthLeft, __spanAllLengthRight);
	
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	var childsTmpArrObjs = [];
	
	for(var c = 0 ; c < tmpArrObjs.length ; c++){
		var __spanLen = financial(defaultDoclen) / lenFact;
		var _bujeObj = null;
		pre_object_no = tmpArrObjs[c].object_no;
		childsTmpArrObjs = getChildsAsPreObjectNo(pre_object_no, 'BOBJ11010101');
		
		for(var ch = 0 ; ch < childsTmpArrObjs.length ; ch++){
			replaceObj = childsTmpArrObjs[ch];
			///// 보마루
			_bujeObj = {
				object_no 		: replaceObj.object_no,
				entity_id  		: replaceObj.entity_id,
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: replaceObj.object_nm,	
				abbr_nm 		: '',
				model_color  	: 0x5D5D5D,
				model_width  	: __spanLen / childsTmpArrObjs.length,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: _DEFAULT_BUJE_OBJ.depth,
				coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * ch),
				coord_y	   		: 0,
				coord_z	   		: 0,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			replaceObj = replaceObjectNo(replaceObj.object_no, 10, '2');
			///// 상류면
			_bujeObj = {
				object_no 		: replaceObj.object_no,
				entity_id  		: 'BOBJ11010102',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: replaceObj.object_nm,	
				abbr_nm 		: '',
				model_color  	: 0x4374D9,
				model_width  	: __spanLen / childsTmpArrObjs.length,
				model_height 	: 5,
				model_depth  	: _DEFAULT_BUJE_OBJ.depth,
				coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * ch),
				coord_y	   		: 0,
				coord_z	   		: -17.6,
				angle_x			: -30,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			replaceObj = replaceObjectNo(replaceObj.object_no, 10, '3');
			///// 상류면
			_bujeObj = {
				object_no 		: replaceObj.object_no,
				entity_id  		: 'BOBJ11010103',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: replaceObj.object_nm,	
				abbr_nm 		: '',
				model_color  	: 0xCCA63D,
				model_width  	: __spanLen / childsTmpArrObjs.length,
				model_height 	: 5,
				model_depth  	: _DEFAULT_BUJE_OBJ.depth,
				coord_x	   		: financial(-__forCenter + __startX) + ((__spanLen / childsTmpArrObjs.length) * ch),
				coord_y	   		: 0,
				coord_z	   		: 17.6,
				angle_x			: 30,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
		}
		
		__startX += __spanLen * facilLenFact;
	}	
	
	return arrSpanParts;
}


/*********************************************
*              	   배수펌프장(DP)
**********************************************/
function facil_DP_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var floorHeight = 30;
	var floorGap = 3;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 40,
		height : 1,
		depth : 50,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var _DEFAULT_BEAM_WIDTH = 2;
	
	var arrSpanParts = [];
	var arrSuro = getTmpArrObjsWithLvl('DPBJ1101', '4');
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;

	for(var sl = 0 ; sl < arrSuro.length ; sl++){
		var _bujeObj = null;
		pre_object_no = arrSuro[sl].object_no;
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'DPBJ110001',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '바닥슬래브',	
			abbr_nm 		: '',
			model_color  	: 0xCCA63D,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: -(_DEFAULT_BUJE_OBJ.width * (arrSuro.length - sl)),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0002',
			entity_id  		: 'DPBJ110002',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '상부슬래브',	
			abbr_nm 		: '',
			model_color  	: 0xD5D5D5,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: -(_DEFAULT_BUJE_OBJ.width * (arrSuro.length - sl)),
			coord_y	   		: floorHeight,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'DPBJ110003',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: '',
			model_color  	: 0xA6A6A6,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: floorHeight,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: -(_DEFAULT_BUJE_OBJ.width * (arrSuro.length - sl)),
			coord_y	   		: 0,
			coord_z	   		: -(_DEFAULT_BUJE_OBJ.depth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0031',
			entity_id  		: 'DPBJ110005',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '보',	
			abbr_nm 		: '',
			model_color  	: 0xBFA0ED,
			model_width  	: _DEFAULT_BEAM_WIDTH * 2,
			model_height 	: _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: -(_DEFAULT_BUJE_OBJ.width * (arrSuro.length - sl)) + (_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: floorHeight - _DEFAULT_BEAM_WIDTH,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0021',
			entity_id  		: 'DPBJ110004',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '기둥',	
			abbr_nm 		: 'C',
			model_color  	: 0x6799FF,
			model_width  	: _DEFAULT_BEAM_WIDTH * 2,
			model_height 	: floorHeight - _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BEAM_WIDTH * 2,
			coord_x	   		: -(_DEFAULT_BUJE_OBJ.width * (arrSuro.length - sl)) + (_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   상수도(WS)
**********************************************/
function facil_WS_getSpansAsSpecLabel(facilObjTreeList){
	var arrSpanParts = [];
	
	var offsetZ = 0;
	var replaceObj, _bujeObj;
	var pipeLen = 40;
	var maxPipeLen = 0;
	
	var pipeChain = getTmpArrObjs('WSBJ010101'); //계통
	for(var pc = 0 ; pc < pipeChain.length ; pc++){
		var pipeSection = getTmpArrObjsAsUpperNo(pipeChain[pc].object_no);
		var __startX = 0;
		var hasPipe = false;
		for(var ps = 0 ; ps < pipeSection.length ; ps++){
			var sectionStart = __startX;
			var pipes = getChildsAsPreObjectNo(pipeSection[ps].object_no, 'WSBJ0101010101');
			for(var p = 0 ; p < pipes.length ; p++){
				hasPipe = true;
				
				replaceObj = pipes[p];
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'CIRCLE',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0x6799FF,
					model_width  	: pipeLen,
					model_height 	: 3,
					model_depth  	: 3,
					coord_x	   		: __startX,
					coord_y	   		: 0,
					coord_z	   		: offsetZ,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				__startX += pipeLen;
			}
			
			var valves = getChildsAsPreObjectNo(pipeSection[ps].object_no, 'WSBJ0101010102');
			for(var v = 0 ; v < valves.length ; v++){
				replaceObj = valves[v];
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'BOX',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,	
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0x8041D9,
					model_width  	: 3,
					model_height 	: 4,
					model_depth  	: 5,
					coord_x	   		: sectionStart + ((pipeLen * pipes.length) / valves.length) * v,
					coord_y	   		: 2,
					coord_z	   		: offsetZ,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
			}
			
			__startX += 3;
			maxPipeLen = Math.max(maxPipeLen, __startX);
			
		}
		
		if(hasPipe){
			offsetZ += 20;
		}
	}
	
	var waterTunnel = getTmpArrObjs('WSBJ010201'); //수로터널
	for(var wt = 0 ; wt < waterTunnel.length ; wt++){
		var tunnelSection = getTmpArrObjsAsUpperNo(waterTunnel[wt].object_no);
		var __startX = 0;
		var hasBlock = false;
		for(var ts = 0 ; ts < tunnelSection.length ; ts++){
			var blocks = getChildsAsPreObjectNo(tunnelSection[ts].object_no, 'WSBJ0102010101');
			for(var b = 0 ; b < blocks.length ; b++){
				hasBlock = true;
				replaceObj = blocks[b];
				_bujeObj = {
					object_no 		: replaceObj.object_no,
					entity_id  		: replaceObj.entity_id,
					model_type 		: 'ELLIPSE',
					model_fact 		: 1,
					object_nm  		: replaceObj.object_nm,
					abbr_nm 		: replaceObj.abbr_nm,
					model_color  	: 0x998A00,
					model_width  	: pipeLen,
					model_height 	: 6,
					model_depth  	: 3,
					coord_x	   		: __startX,
					coord_y	   		: -4,
					coord_z	   		: offsetZ,
					angle_x			: 0,
					angle_y			: 0,
					angle_z			: 0
				};
				arrSpanParts.push(_bujeObj);
				
				__startX += pipeLen;
			}
		}
		
		if(hasBlock){
			offsetZ += 20;
		}
	}
	
	
	for(var a = 0 ; a < arrSpanParts.length ; a++){
		arrSpanParts[a].coord_x -= (maxPipeLen / 2);
		arrSpanParts[a].coord_z -= (offsetZ / 4);
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   공공하수처리시설(ST)
**********************************************/
function facil_ST_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var floorHeight = 30;
	var floorGap = 3;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 40,
		height : 1,
		depth : 50,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var _DEFAULT_BEAM_WIDTH = 2;
	var buildGap = 10;
	
	var arrSpanParts = [];
	var builds = getTmpArrObjs('STBJ100001');
	
	var startX = (-(_DEFAULT_BUJE_OBJ.width + buildGap) * builds.length) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;

	for(var sl = 0 ; sl < builds.length ; sl++){
		var _bujeObj = null;
		pre_object_no = builds[sl].object_no.substring(0, 9);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'STBJ100001',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '바닥슬래브',	
			abbr_nm 		: '',
			model_color  	: 0xCCA63D,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: startX,
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0002',
			entity_id  		: 'STBJ100002',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '상부슬래브',	
			abbr_nm 		: '',
			model_color  	: 0xD5D5D5,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: startX,
			coord_y	   		: floorHeight,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0011',
			entity_id  		: 'STBJ100003',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '벽체',	
			abbr_nm 		: '',
			model_color  	: 0xA6A6A6,
			model_width  	: _DEFAULT_BUJE_OBJ.width,
			model_height 	: floorHeight,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: startX,
			coord_y	   		: 0,
			coord_z	   		: -(_DEFAULT_BUJE_OBJ.depth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0031',
			entity_id  		: 'STBJ100004',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '보',	
			abbr_nm 		: '',
			model_color  	: 0xBFA0ED,
			model_width  	: _DEFAULT_BEAM_WIDTH * 2,
			model_height 	: _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BUJE_OBJ.depth,
			coord_x	   		: startX + (_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: floorHeight - _DEFAULT_BEAM_WIDTH,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0021',
			entity_id  		: 'STBJ100005',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '기둥',	
			abbr_nm 		: 'C',
			model_color  	: 0x6799FF,
			model_width  	: _DEFAULT_BEAM_WIDTH * 2,
			model_height 	: floorHeight - _DEFAULT_BEAM_WIDTH,
			model_depth  	: _DEFAULT_BEAM_WIDTH * 2,
			coord_x	   		: startX + (_DEFAULT_BUJE_OBJ.width / 2),
			coord_y	   		: 0,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		startX += (_DEFAULT_BUJE_OBJ.width + buildGap);
	}
	
	return arrSpanParts;
}

/*********************************************
*              	   옹벽(RW)
**********************************************/
function facil_RW_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var tunnelWidth = 28;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 1,
		depth : 10,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var SPAN_LEN_ADJUST_ENTITY_ID = 'RWSP11';
	var __startX = 0;
	var __spanAllLength = 0;
	for(var f = 0 ; f < facilObjTreeList.length ; f++){
		if(facilObjTreeList[f].entity_id === SPAN_LEN_ADJUST_ENTITY_ID){
			_arrSpanLens.push(facilObjTreeList[f]);
			if(facilObjTreeList[f].ext_length == ''){
				__spanAllLength += _DEFAULT_BUJE_OBJ.width;
			}else{
				__spanAllLength += Number(facilObjTreeList[f].ext_length);
			}
		}
	}
	__spanAllLength = financial(__spanAllLength);
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	for(var sl = 0 ; sl < _arrSpanLens.length ; sl++){
		var __spanLen = Number(_arrSpanLens[sl].ext_length) / lenFact;
		var _bujeObj = null;
		pre_object_no = _arrSpanLens[sl].object_no;
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0002',
			entity_id  		: 'RWBW1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '전면부',	
			abbr_nm 		: '',
			model_color  	: _DEFAULT_BUJE_OBJ.color,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.depth,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: -(tunnelWidth / 2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0003',
			entity_id  		: 'RWBW1301',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '상부',	
			abbr_nm 		: '',
			model_color  	: 0xD1B2FF,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: _DEFAULT_BUJE_OBJ.depth,
			coord_z	   		: 0,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'RWBW1101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '지반,기초부',	
			abbr_nm 		: '',
			model_color  	: 0x997000,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: 0, 
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		__startX += __spanLen * facilLenFact;
	}
	
	return arrSpanParts;
}


/*********************************************
*              	   절토사면(SL)
**********************************************/
function facil_SL_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var tunnelWidth = 28;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 1,
		depth : 30,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var _arrSpanLens = [];
	
	var SPAN_LEN_ADJUST_ENTITY_ID = 'SLSP11';
	var __startX = 0;
	var __spanAllLength = 0;
	for(var f = 0 ; f < facilObjTreeList.length ; f++){
		if(facilObjTreeList[f].entity_id === SPAN_LEN_ADJUST_ENTITY_ID){
			_arrSpanLens.push(facilObjTreeList[f]);
			if(facilObjTreeList[f].ext_length == ''){
				__spanAllLength += _DEFAULT_BUJE_OBJ.width;
			}else{
				__spanAllLength += Number(facilObjTreeList[f].ext_length);
			}
		}
	}
	__spanAllLength = financial(__spanAllLength);
	var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
	
	console.log('__spanAllLength', __spanAllLength);
	var __forCenter = (__spanAllLength / lenFact) / 2;
	
	var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
	for(var sl = 0 ; sl < _arrSpanLens.length ; sl++){
		var __spanLen = Number(_arrSpanLens[sl].ext_length) / lenFact;
		var _bujeObj = null;
		pre_object_no = _arrSpanLens[sl].object_no;
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0002',
			entity_id  		: 'SLBW1201',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '사면',	
			abbr_nm 		: '',
			model_color  	: _DEFAULT_BUJE_OBJ.color,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.depth,
			model_depth  	: _DEFAULT_BUJE_OBJ.height,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: -4,
			coord_z	   		: -3,
			angle_x			: 49,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0001',
			entity_id  		: 'SLBW1101',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '상부자연사면',	
			abbr_nm 		: '',
			model_color  	: 0xD1B2FF,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 20,
			coord_z	   		: 22,
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		_bujeObj = {
			object_no 		: pre_object_no + '-0003',
			entity_id  		: 'SLBW1301',
			model_type 		: 'BOX',
			model_fact 		: 1,
			object_nm  		: '사면하부',	
			abbr_nm 		: 'B',
			model_color  	: 0x997000,
			model_width  	: __spanLen,
			model_height 	: _DEFAULT_BUJE_OBJ.height,
			model_depth  	: tunnelWidth,
			coord_x	   		: financial(__startX - __forCenter),
			coord_y	   		: 0,
			coord_z	   		: -(tunnelWidth/2),
			angle_x			: 0,
			angle_y			: 0,
			angle_z			: 0
		};
		arrSpanParts.push(_bujeObj);
		
		__startX += __spanLen * facilLenFact;
	}
		
	return arrSpanParts;
}


/*********************************************
*              	   공동구(UC)
**********************************************/
function facil_UC_getSpansAsSpecLabel(facilObjTreeList){
	
	var allSpanLength = 0;
	var arrSpansInfo = [];
	
	var tunnelWidth = 28;
	
	var _DEFAULT_BUJE_OBJ = {
		object_nm : 'Span',	
		width : 20,
		height : 1,
		depth : 10,
		x	  : -1,
		y	  : -1,
		z	  : -1,
		color : 0x747474
	};
	
	var arrSpanParts = [];
	var offsetZ = 0;
	
	var jigus = getTmpArrObjsWithLvl('UCSP11', '2');
	for(var j = 0 ; j < jigus.length ; j++){
		var jObjectNo = jigus[j].object_no;
		var spans = getTmpArrObjsAsUpperNo(jObjectNo);
		
		var __startX = 0;
		var __spanAllLength = 0;
		var _arrSpanLens = [];
		for(var f = 0 ; f < spans.length ; f++){
			if(spans[f].ext_length != ''){
				__spanAllLength += Number(spans[f].ext_length);
			}
		}
		__spanAllLength = financial(__spanAllLength);
		var lenFact = (400 <= __spanAllLength)?financial(__spanAllLength / 400):1;
		
		console.log('__spanAllLength', __spanAllLength);
		var __forCenter = (__spanAllLength / lenFact) / 2;
		
		var abbr_nm, object_nm, entity_id, pre_object_no, object_no;
		for(var sl = 0 ; sl < spans.length ; sl++){
			if(spans[sl].ext_length == ''){
				continue;
			}
			var __spanLen = Number(spans[sl].ext_length) / lenFact;
			var _bujeObj = null;
			pre_object_no = spans[sl].object_no;			
			
			/*
			////////////// 천장/벽체등 하나만 있는 스타일
			_bujeObj = {
				object_no 		: pre_object_no + '-0011',
				entity_id  		: 'TUBJ1201',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '벽체',	
				abbr_nm 		: 'W',
				model_color  	: _DEFAULT_BUJE_OBJ.color,
				model_width  	: __spanLen, 
				model_height 	: _DEFAULT_BUJE_OBJ.depth, 
				model_depth  	: _DEFAULT_BUJE_OBJ.height,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: -(tunnelWidth / 2) + offsetZ,
				angle_x		: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0011',
				entity_id  		: 'TUBJ1201',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '벽체',	
				abbr_nm 		: 'W',
				model_color  	: _DEFAULT_BUJE_OBJ.color,
				model_width  	: __spanLen, 
				model_height 	: _DEFAULT_BUJE_OBJ.depth,
				model_depth  	: _DEFAULT_BUJE_OBJ.height, 
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: (tunnelWidth / 2) + offsetZ,
				angle_x		: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0001',
				entity_id  		: 'TUBJ1101',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '천장부',	
				abbr_nm 		: '',
				model_color  	: 0xD1B2FF,
				model_width  	: __spanLen,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: tunnelWidth, 
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: _DEFAULT_BUJE_OBJ.depth,
				coord_z	   		: offsetZ,
				angle_x		: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0051',
				entity_id  		: 'TUBJ160101',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '바닥면',	
				abbr_nm 		: 'B',
				model_color  	: 0xFFBB00,
				model_width  	: __spanLen,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: tunnelWidth,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: offsetZ,
				angle_x		: 0
			};
			arrSpanParts.push(_bujeObj);
			*/
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0011',
				entity_id  		: 'UCBJ120101',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '좌측벽체',	
				abbr_nm 		: 'LW',
				model_color  	: _DEFAULT_BUJE_OBJ.color,
				model_width  	: __spanLen, 
				model_height 	: _DEFAULT_BUJE_OBJ.depth, 
				model_depth  	: _DEFAULT_BUJE_OBJ.height,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: -(tunnelWidth / 2) + offsetZ,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0012',
				entity_id  		: 'UCBJ120102',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '우측벽체',	
				abbr_nm 		: 'RW',
				model_color  	: _DEFAULT_BUJE_OBJ.color,
				model_width  	: __spanLen, 
				model_height 	: _DEFAULT_BUJE_OBJ.depth,
				model_depth  	: _DEFAULT_BUJE_OBJ.height, 
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: (tunnelWidth / 2) + offsetZ,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0001',
				entity_id  		: 'UCBJ110101',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '좌측천장부',	
				abbr_nm 		: 'LC',
				model_color  	: 0xD1B2FF,
				model_width  	: __spanLen,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: tunnelWidth / 2, 
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: _DEFAULT_BUJE_OBJ.depth,
				coord_z	   		: -(tunnelWidth / 4) + offsetZ,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0002',
				entity_id  		: 'UCBJ110102',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '우측천장부',	
				abbr_nm 		: 'RC',
				model_color  	: 0xD1B2FF,
				model_width  	: __spanLen,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: tunnelWidth / 2, 
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: _DEFAULT_BUJE_OBJ.depth,
				coord_z	   		: (tunnelWidth / 4) + offsetZ,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0051',
				entity_id  		: 'UCBJ160101',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '좌측바닥면',	
				abbr_nm 		: 'LB',
				model_color  	: 0xFFBB00,
				model_width  	: __spanLen,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: tunnelWidth / 2,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: -(tunnelWidth / 4) + offsetZ,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			_bujeObj = {
				object_no 		: pre_object_no + '-0052',
				entity_id  		: 'UCBJ160102',
				model_type 		: 'BOX',
				model_fact 		: 1,
				object_nm  		: '우측바닥면',	
				abbr_nm 		: 'RB',
				model_color  	: 0xFFBB00,
				model_width  	: __spanLen,
				model_height 	: _DEFAULT_BUJE_OBJ.height,
				model_depth  	: tunnelWidth / 2,
				coord_x	   		: financial(__startX - __forCenter),
				coord_y	   		: 0,
				coord_z	   		: (tunnelWidth / 4) + offsetZ,
				angle_x			: 0,
				angle_y			: 0,
				angle_z			: 0
			};
			arrSpanParts.push(_bujeObj);
			
			
			__startX += __spanLen * facilLenFact;
		}
		offsetZ += (tunnelWidth + 40);
	}	
	
	return arrSpanParts;
}