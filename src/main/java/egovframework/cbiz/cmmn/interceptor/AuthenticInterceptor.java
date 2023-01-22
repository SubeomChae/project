package egovframework.cbiz.cmmn.interceptor;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;

public class AuthenticInterceptor implements HandlerInterceptor {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 인증처리 biz 쪽 interceptor에서처리함
//		if (request.getSession().getAttribute("sesLogin") == null) {
//			response.sendRedirect(request.getContextPath() + "/test/auth/login.do?msg=noses");
//			return false;
//		} 
		
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}
}
