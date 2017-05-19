//package com.api.interceptors.aspects;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.Aspect;
//import org.springframework.beans.factory.annotation.Autowired;
//
//@Aspect
//public class LoggingAspect {
//	
//	@Autowired
//	private HttpServletRequest httpServletRequest;
//	@Autowired
//	private HttpServletResponse httpServletResponse;
//	
//	public void logBefore(JoinPoint joinPoint) {
//		System.out.println("Logging Aspect Before");	
//		
//	}
//
//	public HttpServletRequest getHttpServletRequest() {
//		return httpServletRequest;
//	}
//
//	public void setHttpServletRequest(HttpServletRequest httpServletRequest) {
//		this.httpServletRequest = httpServletRequest;
//	}
//
//	public HttpServletResponse getHttpServletResponse() {
//		return httpServletResponse;
//	}
//
//	public void setHttpServletResponse(HttpServletResponse httpServletResponse) {
//		this.httpServletResponse = httpServletResponse;
//	}
//	
//}
