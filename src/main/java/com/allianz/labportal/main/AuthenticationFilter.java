package com.allianz.labportal.main;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;	
		HttpSession session = ((HttpServletRequest) request).getSession(false);
		//String uri = req.getRequestURI();
		
		try {
			//if(!req.getSession().isNew() && req.getSession() !=null){
				/*res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		        res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		        res.setDateHeader("Expires", 0);
		        chain.doFilter(request, response);*/
				
			if(session!=null && req.getSession().getAttribute("loginUser")!=null){
				System.out.println("loginUser: "+ req.getSession().getAttribute("loginUser"));
				chain.doFilter(request, response);
		           
			}else {
				
				res.sendRedirect("/labportal/home");
		         
			}
		} catch (Exception e) {
			res.sendRedirect("/labportal/error");
			e.printStackTrace();
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
