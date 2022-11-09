package com.emp_effect.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;

public class Emp_effectSevlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String str = req.getParameter("emp_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher fail= req
							.getRequestDispatcher("/emp/select_page.jsp");
					fail.forward(req, res);
					return;
				}
				
				Integer emp_id = null;
				try {
					emp_id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher fail = req
							.getRequestDispatcher("/emp/select_page.jsp");
					fail.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(emp_id);
				if (emp_id == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher fail = req
							.getRequestDispatcher("/emp/select_page.jsp");
					fail.forward(req, res);
					return;
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("empVO", empVO); 
				String url = "/emp/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}
		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
		
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
			Integer emp_id = Integer.valueOf(req.getParameter("emp_id"));
				
				/***************************2.開始查詢資料****************************************/
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(emp_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("empVO", empVO);       
				String url = "/emp/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			
				
			String emp_name = req.getParameter("emp_name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (emp_name == null || emp_name.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				} else if(!emp_name.trim().matches(enameReg)) { 
					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				String account = req.getParameter("account").trim();
				String accountReg = "^[(a-zA-Z0-9_)]{6,10}$";
				if (emp_name == null || emp_name.trim().length() == 0) {
					errorMsgs.add("員工帳號: 請勿空白");
				} else if(!account.trim().matches(accountReg)) { 
					errorMsgs.add("員工帳號: 英文字母、數字和_ , 且長度必需在6到10之間");
	            }
				
				String password = req.getParameter("password").trim();
				String passwordReg = "^[(a-zA-Z0-9_)]{6,10}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("員工帳號: 請勿空白");
				} else if(!password.trim().matches(passwordReg)) { 
					errorMsgs.add("員工帳號: 英文字母、數字和_ , 且長度必需在6到10之間");
	            }
				
				java.sql.Date onjob_date = null;
				try {
					onjob_date = java.sql.Date.valueOf(req.getParameter("onjob_date").trim());
				} catch (IllegalArgumentException e) {
					onjob_date=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Integer emp_status = Integer.valueOf(req.getParameter("emp_status").trim());
				if (emp_status == null ) {
					errorMsgs.add("員工狀態: 請勿空白");
				} else if(emp_status != 0 || emp_status != 1 ) { 
					errorMsgs.add("員工狀態: 只能是0或1");
	            }
				Integer emp_id = Integer.valueOf(req.getParameter("emp_id").trim());

				EmpVO empVO = new EmpVO();
			
				empVO.setEmp_name(emp_name);
				empVO.setAccount(account);
				empVO.setPassword(password);
				empVO.setOnjob_date(onjob_date);
				empVO.setEmp_status(emp_status);
				empVO.setEmp_id(emp_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher fail = req
							.getRequestDispatcher("/emp/update_emp_input.jsp");
					fail.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				EmpService empSvc = new EmpService();
				empVO = empSvc.updateEmp(emp_id,emp_name, account, password, onjob_date, emp_status);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("empVO", empVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/emp/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
		}

	}

}