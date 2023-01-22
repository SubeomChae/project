package egovframework.cbiz.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;

public interface SpHelperService {

	RsWrapper execList(String queryKey, String actionType, Box box) throws Exception;
	
	RsWrapper execList(String queryKey, String actionType, Box box, String modelKey, Model model) throws Exception;

	Box execBox(String queryKey, String actionType, Box box) throws Exception;
	
	Box execBox(String queryKey, String actionType, Box box, String modelKey, Model model) throws Exception;

	void exec(String queryKey, String actionType, Box box) throws Exception;

	Box execXls(String queryKey, String actionType, Box box) throws Exception;
	
	RsWrapper execCodeList(String queryKey, String actionType, String code1) throws Exception;
	
	RsWrapper execCodeList(String queryKey, String actionType, String code1, String modelKey, Model model) throws Exception;

	RsWrapper xmlList(String queryKey, Box box) throws Exception;
	
	Box xmlBox(String queryKey, Box box) throws Exception;

}
