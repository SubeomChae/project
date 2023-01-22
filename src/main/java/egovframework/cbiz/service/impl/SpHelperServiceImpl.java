package egovframework.cbiz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.service.SpHelperService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("spHelperService")
public class SpHelperServiceImpl extends EgovAbstractServiceImpl implements SpHelperService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SpHelperServiceImpl.class);

	@Resource(name = "spHelperDAO")
	private SpHelperDAO spHelperDAO;

	public RsWrapper execList(String queryKey, String actionType, Box box) throws Exception {
		if(box.get("pageCount").equals("")) { box.put("pageCount", "1"); }

		box.put("actionType", actionType);
		box.put("procedureName", queryKey);
		return spHelperDAO.selectSearchProcList("PR_COMMON_LIST", box);
	}
	
	public RsWrapper execList(String queryKey, String actionType, Box box, String modelKey, Model model) throws Exception {
		RsWrapper rsWp = execList(queryKey, actionType, box);
		model.addAttribute(modelKey, rsWp);
		return rsWp;
	}

	public Box execBox(String queryKey, String actionType, Box box) throws Exception {
		RsWrapper rsWp = execList(queryKey, actionType, box);
		return (rsWp.getLength() > 0 ? rsWp.getRsBoxAt(0) : new Box(""));
	}
	
	public Box execBox(String queryKey, String actionType, Box box, String modelKey, Model model) throws Exception {
		Box obox = execBox(queryKey, actionType, box);
		model.addAttribute(modelKey, obox);
		return obox;
	}

	public void exec(String queryKey, String actionType, Box box) throws Exception {
		box.put("actionType", 		actionType);
		box.put("procedureName", 	queryKey);
		spHelperDAO.exec(queryKey, box);
	}

	// 대용량 엑셀 다운로드
	public Box execXls(String queryKey, String actionType, Box box) throws Exception {
		box.put("actionType", 		actionType);
		box.put("procedureName", 	queryKey);
		return spHelperDAO.selectSearchBox("PR_COMMON_LIST", box);
	}

	// 공통코드 조회
	public RsWrapper execCodeList(String queryKey, String actionType, String code1) throws Exception {
		Box box = new Box("");
		box.put("actionType", 		actionType);
		box.put("param01", 			code1);
		box.put("queryName", 		queryKey);
		box.put("procedureName", 	queryKey);
		return spHelperDAO.selectSearchProcList("PR_COMMON_LIST", box);
	}
	
	// 공통코드 수행 , 쿼리수행 결과를 model 에 추가 
	public RsWrapper execCodeList(String queryKey, String actionType, String code1, String modelKey, Model model) throws Exception {
		RsWrapper rsWp = execCodeList(queryKey, actionType, code1);
		model.addAttribute(modelKey, rsWp);
		return rsWp;
	}

	@Override
	public RsWrapper xmlList(String queryKey, Box box) throws Exception {
		return spHelperDAO.selectSearchWpList(queryKey, box);
	}

	@Override
	public Box xmlBox(String queryKey, Box box) throws Exception {
		box.put("queryName", queryKey);
		List lst = spHelperDAO.selectSearchList(box);

		if (lst.size() > 0) {
			return Box.makeBox((Map) lst.get(0));
		} else {
			return new Box();
		}
	}

}

