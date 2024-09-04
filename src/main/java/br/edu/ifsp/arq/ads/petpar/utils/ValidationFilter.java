package br.edu.ifsp.arq.ads.petpar.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//TODO telas
@WebFilter(urlPatterns = {"/homeServlet","/activityRegister",
		"/activitySearch", "/dashboard.jsp","/activity-userRegister.jsp",
		"/statistics.jsp"}, 
		filterName = "Authorization")
public class ValidationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession(false);
		if(session == null || session.getAttribute("user") == null) {
			HttpServletResponse httpResponse = (HttpServletResponse)response;
			httpResponse.sendRedirect(httpRequest.getContextPath()+
					"/login.jsp");
		}
		else {
			chain.doFilter(request, response);
		}	
	}

}
