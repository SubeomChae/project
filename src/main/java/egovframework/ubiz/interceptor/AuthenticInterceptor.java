package egovframework.ubiz.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cbiz.CD;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.ubiz.mapper.ent.SesUserEntity; 

public class AuthenticInterceptor implements HandlerInterceptor {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 인증처리 
	    if (request.getSession().getAttribute(CD.USER_SES_KEY) == null 
                || ((SesUserEntity)request.getSession().getAttribute(CD.USER_SES_KEY)).isLogin() == false) {
            // 로그아웃 처리
            response.sendRedirect(request.getContextPath() + "/com/redirectEx.do?reqUrl=/com/sesnotfound");
            return false;
        } 
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
