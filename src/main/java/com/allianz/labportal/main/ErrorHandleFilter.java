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

import org.springframework.web.servlet.ModelAndView;

public class ErrorHandleFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;	
		HttpSession session = ((HttpServletRequest) request).getSession();
		
			try{
					//System.out.println("####################11111111111111111111111111111111##############.....................................");
					chain.doFilter(request, response);
				
				
			}catch(Exception ex){
				//System.out.println("###################33333333333333333333333333333333333333###############.....................................");
				request.setAttribute("errorMessage", ex);
				request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
				
				
			}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
