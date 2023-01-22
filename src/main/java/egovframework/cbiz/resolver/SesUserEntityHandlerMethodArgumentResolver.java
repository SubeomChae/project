package egovframework.cbiz.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.ubiz.mapper.ent.SesUserEntity; 


public class SesUserEntityHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {


    
    public SesUserEntityHandlerMethodArgumentResolver() {
      System.out.println("SesUserEntityHandlerMethodArgumentResolver Ready");
    }

    
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
      return SesUserEntity.class.isAssignableFrom(parameter.getParameterType());
    }

    @Override 
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        
        Object user = webRequest.getAttribute(CD.USER_SES_KEY, WebRequest.SCOPE_SESSION);
        if (user != null) {
            return (SesUserEntity)user;
        } else {
            return null;
        }
    }
}