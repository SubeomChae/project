package egovframework.ubiz.service;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.cbiz.Box;
import egovframework.cbiz.service.CommDBService;
import egovframework.rte.fdl.property.EgovPropertyService;


public class fmsBatchJobThread extends HttpServlet {

	@Autowired
	protected CommDBService commDBService;
	 
	@Autowired
	protected EgovPropertyService propertiesService;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		AutowireCapableBeanFactory ctx = context.getAutowireCapableBeanFactory();
	    ctx.autowireBean(this);

	    // job thread 수행
	    fmsBatchJobExecute batchProc = new fmsBatchJobExecute(this.commDBService, this.propertiesService);
		Thread t = new Thread(batchProc);
		t.start();
	    
	}
}
