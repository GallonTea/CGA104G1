package com.filter;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;


@WebFilter(urlPatterns =  { "/frontend/mem/*" } )

public class MemLoginFilter implements Filter {
   
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
		
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);
		
	
		HttpSession session = req.getSession();

		// 【從 session 判斷此user是否登入過】

//		 Object account = session.getAttribute("account");
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.login((String)(session.getAttribute("account")), (String)(session.getAttribute("password")));
			Integer mem_id=(Integer) session.getAttribute("mem_id");
			
		 if(mem_id == null){
			req.setAttribute("errorMsgs", "請登入會員");
		 	session.setAttribute("location", req.getRequestURI());
		 	session.invalidate();
		 	res.sendRedirect(req.getContextPath() + "/frontend/memLogin/login.jsp");		 	
		 	return; 
		   }else {
				chain.doFilter(request, response);
		 }
	}
}
