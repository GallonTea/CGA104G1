package com.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

//	//userid,session
//	public static Map<String,HttpSession>  MAP1 = new HashMap<String,HttpSession>();
//	//sessionId,userId
//	public static Map<String,String>  MAP2 = new HashMap<String,Sting>();

	private static final long serialVersionUID = 4326758643879241694L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		Map<String, String> sessionid = new HashMap<String, String>();
		// 登入
		if ("login".equals(action)) {
			System.out.println(1);
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String ac = req.getParameter("account");
			String pa = req.getParameter("password");
			System.out.println(3);
			if (ac == null || (ac.trim()).length() == 0) {
				errorMsgs.add("請輸入帳號");
			}
			if (pa == null || (pa.trim()).length() == 0) {
				errorMsgs.add("請輸入密碼");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/backend/login/login2.jsp");
				fail.forward(req, res);
				return;
			}
			System.out.println(req.getRequestURI());
			String account = ac;
			String password = pa;
			/*************************** 2.開始查詢資料 *****************************************/
			EmpService empSvc = new EmpService();
			List<EmpVO> empVO = empSvc.login(account, password);
			Integer effectid = null;
			for (EmpVO a : empVO) {
				effectid = a.getEffect_id();
			}

			System.out.println(2);
			String name = null;
			for (EmpVO a : empVO) {
				name = a.getEmp_name();
			}

			if (empVO == null || name == null) {
				errorMsgs.add("帳號密碼錯誤");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/backend/login/login2.jsp");
				fail.forward(req, res);
				return;
			} else {
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				session.setAttribute("account", ac);
				session.setAttribute("password", pa);
				session.setAttribute("empVO", empVO);
				try {
					String location = (String) session.getAttribute("location");
					if (location == null) {
						session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
						res.sendRedirect(location);
						return;
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				}

				String url = "/backend/emp/login_success.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}
	}
}