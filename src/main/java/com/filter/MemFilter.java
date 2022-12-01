package com.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.verify_code.model.Verify_codeService;

@WebFilter(urlPatterns = { "/MemServletFront" })
public class MemFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	private FilterConfig config;

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】

		HttpSession session = req.getSession();

		// 【從 session 判斷此user是否登入過】
	
		MemService memSvc = new MemService();
//		List<MemVO> list = (List<MemVO>) memSvc.login((String) session.getAttribute("account"),
//				(String) session.getAttribute("password"));
//		String account= session.getAttribute("mem_account");
		MemVO memVO = memSvc.login((String)(session.getAttribute("account")), (String)(session.getAttribute("password")));
		

		String mem_email =(String)(session.getAttribute("mem_email"));

	
		Integer mem_id=(Integer) session.getAttribute("mem_id");
		Integer mem_status=(Integer) session.getAttribute("mem_status");
		
//		        已啟用會員
			if (mem_status == 2) {
				chain.doFilter(request, response);	
				return;
//				未驗證會員
			} else if(mem_status == 1) {
//				補發驗證信	
			    String subject = "Ba-rei購物商城 會員密碼函";
			    String Verifycode = memSvc.getAuthCode();
			    String mem_name = req.getParameter("mem_account");
			    String messageText = "親愛的Ba-rei會員" + mem_name + "你好 !\n" + "您的會員登入密碼為: " + Verifycode + "\n" +"請妥善保管並重新登入"; 
			    Verify_codeService vSvc = new Verify_codeService();
			    vSvc.addVc_code(mem_id, Verifycode);
//			    驗證碼存入資料庫  
			    memSvc.sendMail(mem_email, subject, messageText);
				res.sendRedirect(req.getContextPath() + "/frontend/memLogin/notVerify.jsp");
				
			} else {
//				被停權用戶
		session.setAttribute("location", req.getRequestURI());
		session.invalidate();
		res.sendRedirect(req.getContextPath() + "/frontend/memLogin/freezeAc.jsp");
			}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.config = config;
	}

}
