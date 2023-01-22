package egovframework.cbiz.service;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;

import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper; 

/**
 * 
 * @author higreenday
 *
 */
public interface CommDBService {
	
    /**
     * 
     * @param queryKey
     * @param box
     * @return
     * @throws Exception
     */
	RsWrapper execList(String queryKey, String actionType, Box box) throws Exception;

    /**
     * 
     * @param queryKey
     * @param box
     * @return
     * @throws Exception
     */
	RsWrapper execList(String queryKey, String actionType, Box box, String sendKey, HttpServletRequest request) throws Exception;
	
    /**
     * 
     * @param queryKey
     * @param box
     * @return
     * @throws Exception
     */
    Box execBox(String queryKey, String actionType, Box box) throws Exception;

    /**
     * 
     * @param queryKey
     * @param box
     * @return
     * @throws Exception
     */
    Box execBox(String queryKey, String actionType, Box box, String sendKey, HttpServletRequest request) throws Exception;
   
    
    /**
     * 
     * @param queryKey
     * @param box
     * @return
     * @throws Exception
     */
    void exec(String queryKey, String actionType, Box box) throws Exception;
   
    /**
     * 
     * @param sql_stmt
     * @param RsWrapper
     * @return
     * @throws Exception
     */
    RsWrapper execSQL(String sql_stmt) throws Exception;

    /**
     * 
     * @param queryKey
     * @param box
     * @return
     * @throws Exception
     */
    Box execXls(String queryKey, String actionType, Box box) throws Exception;
    Box execSQLXls(RsWrapper excelWp, Box box) throws Exception;
}
