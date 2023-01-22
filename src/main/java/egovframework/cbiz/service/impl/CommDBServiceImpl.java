package egovframework.cbiz.service.impl;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.service.CommDBService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("commDBService")
public class CommDBServiceImpl extends EgovAbstractServiceImpl implements CommDBService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommDBServiceImpl.class);
	
    @Resource(name="commDBDAO")
    private CommDBDAO commDBDAO;

	@Override
	public RsWrapper execList(String queryKey, String actionType, Box box) throws Exception {
	    box.put("action_type", actionType);
		return commDBDAO.execList(queryKey, box);
	}

	@Override
	public RsWrapper execList(String queryKey, String actionType, Box box, String sendKey, HttpServletRequest request) throws Exception {
        box.put("action_type", actionType);
		RsWrapper rsWp = commDBDAO.execList(queryKey, box);
		request.setAttribute(sendKey, rsWp);
		return rsWp;
	}

	@Override
	public Box execBox(String queryKey, String actionType, Box box) throws Exception {
        box.put("action_type", actionType);
		return commDBDAO.execBox(queryKey, box);
	}

	@Override
	public Box execBox(String queryKey, String actionType, Box box, String sendKey, HttpServletRequest request) throws Exception {
        box.put("action_type", actionType);
		Box obox =  commDBDAO.execBox(queryKey, box);
		request.setAttribute(sendKey, obox);
		return obox;
	}

	@Override
	public void exec(String queryKey, String actionType, Box box) throws Exception {
        box.put("action_type", actionType);
		commDBDAO.exec(queryKey, box);
	}

	@Override
	public RsWrapper execSQL(String sql_stmt) throws Exception {
        return commDBDAO.execSQL(sql_stmt);
	} 

	@Override
	public Box execXls(String queryKey, String actionType, Box box) throws Exception {
        box.put("action_type", actionType);
        return commDBDAO.execXls(queryKey, box);
	} 

	@Override
	public Box execSQLXls(RsWrapper excelWp, Box box) throws Exception {
        return commDBDAO.execSQLXls(excelWp, box);
	} 
    
}
