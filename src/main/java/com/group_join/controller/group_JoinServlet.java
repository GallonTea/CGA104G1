package com.group_join.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import com.group_buy.model.Group_BuyService;
import com.group_buy.model.Group_BuyVO;
import com.group_join.model.Group_JoinService;
import com.group_join.model.Group_JoinVO;

@WebServlet("/Group_JoinServlet")
public class group_JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		System.out.println("進入servlet查詢");

		if ("go_join".equals(action)) { // 來自addEmp.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String gbitem_name = req.getParameter("gbitem_name");
			String gb_name = req.getParameter("gb_name");

			/*********************** 抓登入ID ,未測試 ************************/
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			/*********************** 抓登入ID *************************/

			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
			Integer gb_min = Integer.valueOf(req.getParameter("gb_min").trim());
			Integer gb_amount = Integer.valueOf(req.getParameter("gb_amount").trim());



			Integer gb_status = Integer.valueOf(req.getParameter("gb_status").trim());
			Integer gb_price = Integer.valueOf(req.getParameter("gb_price").trim());

			session.setAttribute("mem_id", mem_id);

			session.setAttribute("gb_price", gb_price);
			session.setAttribute("gb_name", gb_name);
			session.setAttribute("gbitem_name", gbitem_name);
			session.setAttribute("gb_id", gb_id);
			session.setAttribute("gbitem_id", gbitem_id);
			session.setAttribute("gb_min", gb_min);
			session.setAttribute("gb_amount", gb_amount);
			session.setAttribute("gb_status", gb_status);

			String url = "/frontend/group_join/addgroupjoin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("gb_goprice".equals(action)) { // 來自addEmp.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String gbitem_name = (String) session.getAttribute("gbitem_name");
			System.out.println(gbitem_name);
			/*********************** 抓登入ID ,未測試 ************************/
//			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());

			/*********************** 抓登入ID *************************/

			Integer gb_id = (Integer) session.getAttribute("gb_id");

//			Integer gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
//			Integer gb_min = Integer.valueOf(req.getParameter("gb_min").trim());
//			Integer gb_amount = Integer.valueOf(req.getParameter("gb_amount").trim());
			/************** 折扣價格 *****************/
//			Integer discount_price = Integer.valueOf(req.getParameter("discount_price").trim());
			/************** 折扣價格 *****************/
//			Timestamp gbstart_date = java.sql.Timestamp.valueOf(req.getParameter("gbstart_date").trim());
//			Timestamp gbend_date = java.sql.Timestamp.valueOf(req.getParameter("gbend_date").trim());
//			Integer gb_status = Integer.valueOf(req.getParameter("gb_status").trim());

			Integer gbpay_status = Integer.valueOf(req.getParameter("gbpay_status").trim());
			Integer pickup_status = Integer.valueOf(req.getParameter("pickup_status").trim());
			Integer deliver_status = Integer.valueOf(req.getParameter("deliver_status").trim());

			Integer gbbuy_amount = Integer.valueOf(req.getParameter("gbbuy_amount").trim());
		

			System.out.println(req.getParameter("gb_price"));
			Integer gb_price = (Integer) session.getAttribute("gb_price");

			Integer gbbuy_price = (gb_price) * (gbbuy_amount);

//			session.setAttribute("mem_id", mem_id); 
//			req.setAttribute("gbitem_name", gbitem_name); 
			session.setAttribute("gb_id", gb_id);
//			req.setAttribute("gbitem_id", gbitem_id); 
//			req.setAttribute("gb_min", gb_min); 
//			req.setAttribute("gb_amount", gb_amount); 
//			req.setAttribute("gbstart_date", gbstart_date); 
//			req.setAttribute("gbend_date", gbend_date); 
//			req.setAttribute("gb_status", gb_status);
			session.setAttribute("gbpay_status", gbpay_status);
			session.setAttribute("pickup_status", pickup_status);
			session.setAttribute("deliver_status", deliver_status);
			session.setAttribute("gbbuy_amount", gbbuy_amount);
			session.setAttribute("gbbuy_price", gbbuy_price);

			String url = "/frontend/group_join/addgroupjoinprice.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}


		if ("insert".equals(action)) { 

			
			/*************************************等待處理PK問題***********************/

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			Integer gbitem_id = (Integer)session.getAttribute("gbitem_id");
			Integer gbpay_status = Integer.valueOf(req.getParameter("gbpay_status").trim());
			Integer pickup_status = Integer.valueOf(req.getParameter("pickup_status").trim());
			Integer deliver_status = Integer.valueOf(req.getParameter("deliver_status").trim());
			Integer gbbuy_amount = Integer.valueOf(req.getParameter("gbbuy_amount").trim());
		

			
			Integer gbbuy_price = (Integer) session.getAttribute("gbbuy_price");
		
			
			Group_JoinVO group_joinVO = new Group_JoinVO();
			
			
			group_joinVO.setGb_id(gb_id);
			group_joinVO.setMem_id(mem_id);
			group_joinVO.setGbitem_id(gbitem_id);
			group_joinVO.setGbpay_status(gbpay_status);		
			group_joinVO.setPickup_status(pickup_status);
			group_joinVO.setDeliver_status(deliver_status);		
			group_joinVO.setGbbuy_amount(gbbuy_amount);
			group_joinVO.setGbbuy_price(gbbuy_price);
			
			
			
			 
			
			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("group_joinVO", group_joinVO); // 含有輸入格式錯誤的empVO物件,也存入req
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/group_join/addgroupjoinprice.jsp");
//				failureView.forward(req, res);
//				return;
//			}
			Group_JoinService group_joinSvc = new Group_JoinService();
			group_joinVO = group_joinSvc.addGroup_Join(gb_id, mem_id,gbpay_status,pickup_status,deliver_status,gbbuy_amount,gbbuy_price );
			
			Integer gb_amount = ((Integer) session.getAttribute("gb_amount"))+group_joinVO.getGbbuy_amount();
			session.setAttribute("gb_id", gb_id);
			session.setAttribute("gb_amount", gb_amount);
			
			
			Group_BuyService group_buySvc = new Group_BuyService();
			Group_BuyVO group_buyVO = group_buySvc.updateGroup_Buy_GBAmount( gb_id, gb_amount);
			
			
			/*****************將總數量上傳到團購團更改(進入JDBC)***************/
			System.out.println("總共數量"+gb_amount);
			String url = "/CGA104G1/frontend/groupBuy/listallgroupbuuy.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("getOne_For_Display".equals(action)) {

		Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);

		/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
		
		Integer gb_id = (Integer)session.getAttribute("gb_id");
		Integer mem_id =  (Integer)session.getAttribute("mem_id");
		
		Group_JoinVO group_joinVO = new Group_JoinVO();
		group_joinVO.setGb_id(gb_id);
		group_joinVO.setGb_id(mem_id);

		/*************************** 2.開始查詢資料 *****************************************/

		Group_JoinService group_joinSvc = new Group_JoinService();
		 group_joinVO = group_joinSvc.getOneEmp(gb_id,mem_id);
		

		/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
		
		
		session.setAttribute("group_joinVO", group_joinVO);
		
		
		String url = "/frontend/group_join/listOneGroupJoin.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
		successView.forward(req, res);
	}
		
	
		if ("getOneGB_For_Display".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			
//			Integer gb_id = (Integer)session.getAttribute("gb_id");
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			/*************************** 2.開始查詢資料 *****************************************/

			Group_JoinService group_joinSvc = new Group_JoinService();
			List<Group_JoinVO> group_joinVO = group_joinSvc.getOneGb(gb_id);
			

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			boolean verify = true;
			
			req.setAttribute("gb_id", gb_id);
			session.setAttribute("group_joinVO", group_joinVO);
			for(Group_JoinVO a: group_joinVO)
			{
				if(a.getGbpay_status() != 1 || a.getPickup_status() != 1 || a.getDeliver_status() != 3) {
					verify = false;
				}
				
			}
			session.setAttribute("verify", verify);
			
			System.out.println(verify);
			
			String url = "/frontend/group_join/listAllGroupJoin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		
		if ("update".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
//			Integer gbitem_id = (Integer)session.getAttribute("gbitem_id");
			Integer gbpay_status = Integer.valueOf(req.getParameter("gbpay_status").trim());
			Integer pickup_status = Integer.valueOf(req.getParameter("pickup_status").trim());
			Integer deliver_status = Integer.valueOf(req.getParameter("deliver_status").trim());
			Integer gbbuy_amount = Integer.valueOf(req.getParameter("gbbuy_amount").trim());
			Integer gbbuy_price = (Integer) session.getAttribute("gbbuy_price");
			Group_JoinVO group_joinVO = new Group_JoinVO();
			
			group_joinVO.setGb_id(gb_id);
			group_joinVO.setGb_id(mem_id);
//			group_joinVO.setGbitem_id(gbitem_id);
			group_joinVO.setGbpay_status(gbpay_status);		
			group_joinVO.setPickup_status(pickup_status);
			group_joinVO.setDeliver_status(deliver_status);		
			group_joinVO.setGbbuy_amount(gbbuy_amount);
			group_joinVO.setGbbuy_price(gbbuy_price);
			
						
			/*************************** 2.開始修改資料 *****************************************/
			Group_JoinService group_joinSvc = new Group_JoinService();
			 group_joinVO = group_joinSvc.updateGroup_Join(gb_id, mem_id, gbpay_status, pickup_status,  deliver_status , gbbuy_amount ,gbbuy_price);
			
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("group_joinVO", group_joinVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/frontend/group_join/listAllGroupJoin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
		if ("updatePay".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			Integer gbpay_status = Integer.valueOf(req.getParameter("gbpay_status").trim());
			Group_JoinVO group_joinVO = new Group_JoinVO();
			
			group_joinVO.setGb_id(gb_id);
			group_joinVO.setGb_id(mem_id);
			group_joinVO.setGbpay_status(gbpay_status);		

			System.out.println("付款狀態");
			/*************************** 2.開始修改資料 *****************************************/
			Group_JoinService group_joinSvc = new Group_JoinService();
			 group_joinVO = group_joinSvc.updatePay(gb_id, mem_id, gbpay_status);
			 List<Group_JoinVO> group_joinVO1 = group_joinSvc.getOneGb(gb_id);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("gb_id", gb_id);
			req.setAttribute("group_joinVO", group_joinVO1); // 資料庫update成功後,正確的的empVO物件,存入req
			
			boolean verify = true;
			for(Group_JoinVO a: group_joinVO1)
			{
				if(a.getGbpay_status() != 1 || a.getPickup_status() != 1 || a.getDeliver_status() != 3) {
					verify = false;
				}
				
			}
			session.setAttribute("verify", verify);
			
			
			
			
			String url = "/frontend/group_join/listAllGroupJoin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
		
		if ("updatePickup".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			Integer pickup_status = Integer.valueOf(req.getParameter("pickup_status").trim());
			Group_JoinVO group_joinVO = new Group_JoinVO();
			
			group_joinVO.setGb_id(gb_id);
			group_joinVO.setGb_id(mem_id);
			group_joinVO.setPickup_status(pickup_status);		

			System.out.println("取貨狀態");
			/*************************** 2.開始修改資料 *****************************************/
			Group_JoinService group_joinSvc = new Group_JoinService();
			 group_joinVO = group_joinSvc.updatePickup(gb_id, mem_id, pickup_status);
			
			 List<Group_JoinVO> group_joinVO1 = group_joinSvc.getOneGb(gb_id);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("gb_id", gb_id);
			req.setAttribute("group_joinVO", group_joinVO1); // 資料庫update成功後,正確的的empVO物件,存入req
			
			boolean verify = true;
			for(Group_JoinVO a: group_joinVO1)
			{
				if(a.getGbpay_status() != 1 || a.getPickup_status() != 1 || a.getDeliver_status() != 3) {
					verify = false;
				}
				
			}
			session.setAttribute("verify", verify);
			String url = "/frontend/group_join/listAllGroupJoin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
		
		if ("updateDeliver".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			Integer deliver_status = Integer.valueOf(req.getParameter("deliver_status").trim());
			
			Group_JoinVO group_joinVO = new Group_JoinVO();
			 
			group_joinVO.setGb_id(gb_id);
			group_joinVO.setGb_id(mem_id);
			group_joinVO.setDeliver_status(deliver_status);		
		
			/*************************** 2.開始修改資料 *****************************************/
			Group_JoinService group_joinSvc = new Group_JoinService();
			 group_joinVO = group_joinSvc.updateDeliver(gb_id, mem_id, deliver_status);
			
			 List<Group_JoinVO> group_joinVO1 = group_joinSvc.getOneGb(gb_id);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("gb_id", gb_id);
			req.setAttribute("group_joinVO", group_joinVO1); // 資料庫update成功後,正確的的empVO物件,存入req
			
			boolean verify = true;
			for(Group_JoinVO a: group_joinVO1)
			{
				if(a.getGbpay_status() != 1 || a.getPickup_status() != 1 || a.getDeliver_status() != 3) {
					verify = false;
				}
				
			}
			session.setAttribute("verify", verify);
			String url = "/frontend/group_join/listAllGroupJoin.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
		
		
		
		if ("update_gb_status".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			Integer gb_status = 9;

//			Group_JoinVO group_joinVO = new Group_JoinVO();
//			 
//			group_joinVO.setGb_id(gb_id);
//			group_joinVO.setGb_id(gb_status);
//			
		
			/*************************** 2.開始修改資料 *****************************************/
			Group_BuyVO group_buyVO = new Group_BuyVO();
			Group_BuyService group_buySvc = new Group_BuyService();
			group_buyVO = group_buySvc.updateGroup_Buy_GBStatus(gb_id, gb_status);
			
//			group_buyVO = group_buySvc.getOneGroup_Buy(gb_id);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("group_buyVO", group_buyVO); 
			
			String url = "/CGA104G1/frontend/groupBuy/listallgroupbuuy.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		
//		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
//
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//
//			String emp_name = req.getParameter("emp_name");
//			String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//			if (emp_name == null || emp_name.trim().length() == 0) {
//				errorMsgs.put("emp_name", "員工姓名: 請勿空白");
//			} else if (!emp_name.trim().matches(enameReg)) {
//				errorMsgs.put("emp_name", "員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//			}
//
//			String account = null;
//			String accountReg = "^[(a-zA-Z0-9_)]{6,10}$";
//
//			try {
//				account = req.getParameter("account").trim();
//				if (account == null || account.trim().length() == 0) {
//					errorMsgs.put("account", "員工帳號: 請勿空白");
//				} else if (!account.trim().matches(accountReg)) {
//					errorMsgs.put("account", "員工帳號: 英文字母、數字和_ , 且長度必需在6到10之間");
//				}
//			} catch (Exception e1) {
//				e1.printStackTrace();
//			}
//
//			String password = req.getParameter("password").trim();
//			String passwordReg = "^[(a-zA-Z0-9_)]{6,10}$";
//			if (password == null || password.trim().length() == 0) {
//				errorMsgs.put("password", "員工密碼: 請勿空白");
//			} else if (!password.trim().matches(passwordReg)) {
//				errorMsgs.put("password", "員工密碼: 英文字母、數字和_ , 且長度必需在6到10之間");
//			}
//
//			java.sql.Date onjob_date = null;
//			try {
//				onjob_date = java.sql.Date.valueOf(req.getParameter("onjob_date").trim());
//			} catch (IllegalArgumentException e) {
//				onjob_date = new java.sql.Date(System.currentTimeMillis());
//				errorMsgs.put("onjob_date", "請輸入日期!");
//			}
//			Integer emp_status = null;
//			try {
//				emp_status = Integer.valueOf(req.getParameter("emp_status").trim());
//
//			} catch (Exception e) {
//				if (emp_status == null) {
//					errorMsgs.put("emp_status", "員工狀態: 請勿空白");
//				} else if (emp_status > 1) {
//					errorMsgs.put("emp_status", "員工狀態: 只能是0或1");
//				}
//			}
//			Integer effect_id = Integer.valueOf(req.getParameter("effect_id").trim());
//			System.out.println(effect_id);
//			
//			
//			EmpVO empVO = new EmpVO();
//			empVO.setEmp_name(emp_name);
//			empVO.setAccount(account);
//			empVO.setPassword(password);
//			empVO.setOnjob_date(onjob_date);
//			empVO.setEmp_status(emp_status);
//			
//			Emp_effectVO emp_effectVO = new Emp_effectVO();
//			emp_effectVO.setEffect_id(effect_id);
//
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/addEmp.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//
//			/*************************** 2.開始新增資料 ***************************************/
//			EmpService empSvc = new EmpService();
//			empVO = empSvc.addEmp(emp_name, account, password, onjob_date, emp_status, effect_id);
//			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//			String url = "/backend/emp/listAllEmp.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//			successView.forward(req, res);
//		}
//
//		if ("delete".equals(action)) { // 來自listAllEmp.jsp
//
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 ***************************************/
//			Integer empno = Integer.valueOf(req.getParameter("emp_id"));
//
//			/*************************** 2.開始刪除資料 ***************************************/
//			EmpService empSvc = new EmpService();
//			empSvc.deleteEmp(empno);
//
//			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
//			String url = "/backend/emp/listAllEmpNoEffect.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//			successView.forward(req, res);
//		}
//
//		if ("listemp_and_effect".equals(action)) {
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");
//			if (req.getParameter("whichPage") == null) {
//				Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
//				session.setAttribute("map", map1);
//				map = map1;
//			}
//			EmpService empSvc = new EmpService();
//			List<EmpVO> list = empSvc.getAll(map);
//			for(EmpVO a : list ) {
//				System.out.println(a);
//			}
//
//			req.setAttribute("listemp_and_effect", list);
//			RequestDispatcher successView = req.getRequestDispatcher("/backend/emp/listAllEmpNoEffect.jsp");
//			successView.forward(req, res);
//
//		}
	}
}
