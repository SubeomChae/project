package egovframework.cbiz.resolver;


import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver; 
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import egovframework.cbiz.Box;
import egovframework.cbiz.CustomProperty;
import egovframework.rte.fdl.property.EgovPropertyService;

public class BoxHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
      return Box.class.isAssignableFrom(parameter.getParameterType());
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        if (request.getContentType() != null && 
                request.getContentType().toLowerCase().indexOf("multipart/form-data") > -1 ) {
            HttpServletRequest servletRequest = webRequest.getNativeRequest(HttpServletRequest.class);
            MultipartHttpServletRequest multipartRequest =
                WebUtils.getNativeRequest(servletRequest, MultipartHttpServletRequest.class);

            return Box.makeBox(multipartRequest, CustomProperty.upload_dir);
        } else {
            return Box.makeBox(request);
        }
    }

}