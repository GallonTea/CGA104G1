package com.qualified_doctor.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
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

import com.mem.model.MemService;
import com.mem.model.MemVO;

//@WebServlet("/frontend/mem/mem.do")
public class Qualified_doctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Date = null;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("doc_id");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.put("doc_id", "請輸入醫生編號");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			Integer doc_id = null;
			try {
				doc_id = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.put("doc_id", "員工編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			MemService memSvc = new MemService();
			Qualified_doctorVO qualified_doctorVO = memSvc.getOneMem(doc_id);
			if (memVO == null) {
				errorMsgs.put("doc_id", "查無資料");
			}
//				Integer id = memVO.getMem_id();
//				if (id != mem_id) {
//					errorMsgs.put("mem_id","請輸入員工編號");
//				}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("memVO", memVO); // 資料庫取出的empVO物件,存入req
			String url = "/frontend/mem/listOneMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer doc_id = Integer.valueOf(req.getParameter("doc_id"));

			/*************************** 2.開始查詢資料 ****************************************/
			Qualified_doctorVO memSvc = new MemService();
			Qualified_doctorVO qualified_doctorVO = memSvc.getOneMem(doc_id);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("qualified_doctorVO", qualified_doctorVO); // 資料庫取出的empVO物件,存入req
			String url = "/frontend/mem/update_mem_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer doc_id = Integer.valueOf(req.getParameter("doc_id").trim());
			
			Integer doc_status = Integer.valueOf(req.getParameter("doc_status").trim());
			try {
				doc_status = Integer.valueOf(req.getParameter("doc_status").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("狀態請勿空白");
			}
			
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());

			Qualified_doctorVO qualified_doctorVO = new Qualified_doctorVO();
//			memVO.setMem_account(mem_account);

			qualified_doctorVO.setMem_status(mem_status);
			qualified_doctorVO.setMem_id(mem_id);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/update_mem_input.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始新增資料 ***************************************/
			MemService memSvc = new MemService();
			memSvc.updateMem(mem_id, mem_password, mem_name, mem_address, mem_phone, mem_uid, mem_email,
					mem_sex, mem_dob, mem_status);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		
		
		if ("getOne_For_UpdateMem".equals(action)) { // 來自listAllEmp.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id"));

			/*************************** 2.開始查詢資料 ****************************************/
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOneMem(mem_id);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("memVO", memVO); // 資料庫取出的empVO物件,存入req
			String url = "/frontend/mem/updateMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);
		}
		
		if ("updateMem".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

//			String mem_account = req.getParameter("mem_account").trim();
//			if (mem_account == null || mem_account.trim().length() == 0) {
//				errorMsgs.add("帳號請勿空白");
//			}
			
			String mem_password = req.getParameter("mem_password").trim();
			if (mem_password == null || mem_password.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}
			
			String mem_name = req.getParameter("mem_name");
			String mem_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (mem_name == null || mem_name.trim().length() == 0) {
				errorMsgs.add("員工姓名: 請勿空白");
			} else if (!mem_name.trim().matches(mem_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}
			
			
			String mem_address = req.getParameter("mem_address").trim();
			if (mem_address == null || mem_address.trim().length() == 0) {
				errorMsgs.add("地址請勿空白");
			}


			String mem_email = req.getParameter("mem_email").trim();
			if (mem_email == null || mem_email.trim().length() == 0) {
				errorMsgs.add("Email請勿空白");
			}

			String mem_phone = req.getParameter("mem_phone").trim();
			if (mem_phone == null || mem_phone.trim().length() == 0) {
				errorMsgs.add("電話請勿空白");
			}

			String mem_uid = req.getParameter("mem_uid").trim();
			if (mem_uid == null || mem_uid.trim().length() == 0) {
				errorMsgs.add("證號請勿空白");
			}

			String mem_sex = req.getParameter("mem_sex").trim();
			if (mem_sex == null || mem_sex.trim().length() == 0) {
				errorMsgs.add("性別請勿空白");
			}

			java.sql.Date mem_dob = null;
			try {
				mem_dob = java.sql.Date.valueOf(req.getParameter("mem_dob").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("生日請勿空白");
			}
			Integer mem_status = Integer.valueOf(req.getParameter("mem_status").trim());
			try {
				mem_status = Integer.valueOf(req.getParameter("mem_status").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("狀態請勿空白");
			}
			
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());

			MemVO memVO = new MemVO();
//			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			memVO.setMem_status(mem_status);
			memVO.setMem_id(mem_id);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/updateMem.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始新增資料 ***************************************/
			MemService memSvc = new MemService();
			memSvc.updateMem(mem_id, mem_password, mem_name, mem_address, mem_phone, mem_uid, mem_email,
					mem_sex, mem_dob, mem_status);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String mem_name = req.getParameter("mem_name");
			String mem_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (mem_name == null || mem_name.trim().length() == 0) {
				errorMsgs.put("mem_name", "會員姓名:請勿空白");
			} else if (!mem_name.trim().matches(mem_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.put("mem_name", "會員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			String mem_account = req.getParameter("mem_account").trim();
			if (mem_account == null || mem_account.trim().length() == 0) {
				errorMsgs.put("mem_account", "會員帳號請勿空白");
			}

			String mem_password = req.getParameter("mem_password").trim();
			if (mem_password == null || mem_password.trim().length() == 0) {
				errorMsgs.put("mem_password", "會員密碼請勿空白");
			}

			String mem_address = req.getParameter("mem_address").trim();
			if (mem_address == null || mem_address.trim().length() == 0) {
				errorMsgs.put("mem_address", "地址請勿空白");
			}

			String mem_phone = req.getParameter("mem_phone").trim();
			if (mem_phone == null || mem_phone.trim().length() == 0) {
				errorMsgs.put("mem_phone", "電話請勿空白");
			}

			String mem_uid = req.getParameter("mem_uid").trim();
			if (mem_uid == null || mem_uid.trim().length() == 0) {
				errorMsgs.put("mem_uid", "證號請勿空白");
			}

			String mem_email = req.getParameter("mem_email").trim();
			if (mem_email == null || mem_email.trim().length() == 0) {
				errorMsgs.put("mem_email", "Email請勿空白");
			}

			String mem_sex = req.getParameter("mem_sex").trim();
			if (mem_sex == null || mem_sex.trim().length() == 0) {
				errorMsgs.put("mem_sex", "性別請勿空白");
			}

			java.sql.Date mem_dob = null;
			try {
				mem_dob = java.sql.Date.valueOf(req.getParameter("mem_dob").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.put("mem_dob", "請輸入日期");
			}
			MemVO memVO = new MemVO();
			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/addMem.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			MemService memSvc = new MemService();
			memSvc.addMem(mem_account, mem_password, mem_name, mem_address, mem_phone, mem_uid, mem_email, mem_sex,
					mem_dob);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id"));

			/*************************** 2.開始刪除資料 ***************************************/
			MemService memSvc = new MemService();
			memSvc.deleteMem(mem_id);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

		}

		if ("register".equals(action)) { // 來自login.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

			String mem_account = req.getParameter("mem_account").trim();
			if (mem_account == null || mem_account.trim().length() == 0) {
				errorMsgs.put("mem_account", "會員帳號請勿空白");
			}

			String mem_password = req.getParameter("mem_password").trim();
			if (mem_password == null || mem_password.trim().length() == 0) {
				errorMsgs.put("mem_password", "會員密碼請勿空白");
			}

			String mem_name = req.getParameter("mem_name");
			String mem_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,8}$";
			if (mem_name == null || mem_name.trim().length() == 0) {
				errorMsgs.put("mem_name", "會員姓名:請勿空白");
			} else if (!mem_name.trim().matches(mem_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.put("mem_name", "會員姓名: 只能是中、英文字母 , 且長度必需在2到8之間");
			}

			String mem_address = req.getParameter("mem_address").trim();
			if (mem_address == null || mem_address.trim().length() == 0) {
				errorMsgs.put("mem_address", "地址請勿空白");
			}

			String mem_phone = req.getParameter("mem_phone").trim();
			if (mem_phone == null || mem_phone.trim().length() == 0) {
				errorMsgs.put("mem_phone", "電話請勿空白");
			}

			String mem_uid = req.getParameter("mem_uid").trim();
			if (mem_uid == null || mem_uid.trim().length() == 0) {
				errorMsgs.put("mem_uid", "證號請勿空白");
			}

			String mem_email = req.getParameter("mem_email").trim();
			if (mem_email == null || mem_email.trim().length() == 0) {
				errorMsgs.put("mem_email", "Email請勿空白");
			}

			String mem_sex = req.getParameter("mem_sex").trim();
			if (mem_sex == null || mem_sex.trim().length() == 0) {
				errorMsgs.put("mem_sex", "性別請勿空白");
			}

			java.sql.Date mem_dob = null;
			try {
				mem_dob = java.sql.Date.valueOf(req.getParameter("mem_dob").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.put("mem_dob", "請輸入日期");
			}

			MemVO regmemVO = new MemVO();
			regmemVO.setMem_account(mem_account);
			regmemVO.setMem_password(mem_password);
			regmemVO.setMem_name(mem_name);
			regmemVO.setMem_address(mem_address);
			regmemVO.setMem_phone(mem_phone);
			regmemVO.setMem_uid(mem_uid);
			regmemVO.setMem_email(mem_email);
			regmemVO.setMem_sex(mem_sex);
			regmemVO.setMem_dob(mem_dob);

			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("regmemVO", regmemVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/register.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			MemService memSvc = new MemService();
			memSvc.register(mem_account, mem_password, mem_name, mem_address, mem_phone, mem_uid, mem_email, mem_sex,
					mem_dob);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/register_success.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		if ("login".equals(action)) { // 來自addEmp.jsp的請求
			
		    String username = req.getParameter("username");
		    String password = req.getParameter("password");

			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getMemUser(username,password);
			session.setAttribute("memVO", memVO); // 資料庫取出的物件,存入req

//System.out.println(username);
//System.out.println(password);
			  if(memVO==null) {
				req.setAttribute("msg", "帳號或密碼錯誤!請重新輸入");
				req.getRequestDispatcher("/frontend/mem/login.jsp").forward(req, res);

		    }else {                                      
//		      HttpSession session = req.getSession();
//		      session.setAttribute("username", username);  
//		      
//		       try {                                                        
//		         String location = (String) session.getAttribute("location");
//		         if (location != null) {
//		           session.removeAttribute("location");  
//		           res.sendRedirect(location);            
//		           return;
//		         }
//		       }catch (Exception ignored) { }
//				session.getRequestDispatcher("/frontend/mem/select_page.jsp").forward(req, res);
		    	String url = "/frontend/mem/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			}
		}

		if ("confirmreg".equals(action)) {
			req.getRequestDispatcher("/frontend/mem/select_page.jsp").forward(req, res);
			
		}

	}
}
