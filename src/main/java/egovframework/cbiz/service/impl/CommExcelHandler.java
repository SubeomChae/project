package egovframework.cbiz.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;

public class CommExcelHandler implements ResultHandler {
	
    @Override
    public void handleResult(ResultContext context) { 
        Map map = (Map)context.getResultObject(); 
        //System.out.println("===========" + map.toString());
    }
};
