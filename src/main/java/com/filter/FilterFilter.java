package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//@WebFilter("/Filter/*")
public class FilterFilter  implements Filter {
   
	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}


	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		
	
		HttpSession session = req.getSession();

		// 【從 session 判斷此user是否登入過】

		 Object account = session.getAttribute("account");
		 if(account == null){
		 	session.setAttribute("location", req.getRequestURI());
		 	res.sendRedirect(req.getContextPath()+"/backend/login/login2.jsp");
		   return; }
		 else {
				chain.doFilter(request, response);
			}
		System.out.println("123");
	}
}
