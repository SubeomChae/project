package egovframework.cbiz.service.impl;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.Region;
import org.springframework.stereotype.Repository;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.cbiz.CD;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.ExcelUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.StringUtil;

@Repository("spHelperDAO")
public class SpHelperDAO extends EgovAbstractMapper {

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	public List selectSearchList(Box box) throws Exception {
		return selectList(box.get("queryName"), box);
	}

	public RsWrapper selectSearchWpList(String queryKey, Box box) throws Exception {
		box.put("queryName", queryKey);
		return new RsWrapper(selectList(box.get("queryName"), box));
	}

	public Box selectSearchBox(String queryKey, Box box) throws Exception {
		box.put("queryName", queryKey);
		List list = selectSearchList(box);
		if(list.size() > 0) {
			return Box.makeBox((Map)list.get(0));
		}else {
			return new Box();
		}
	}
	
	public RsWrapper selectSearchProcList(String queryKey, Box box) throws Exception {
		box.put("queryName", queryKey);
		selectOne(box.get("queryName"), box);
		ArrayList alist = (ArrayList)box.getObject("result");
		return new RsWrapper(alist);
	}
	
	public void exec(String queryKey, Box box) throws Exception {
		box.put("queryName", queryKey);
		update(box.get("queryName"), box);
	}
	
}
