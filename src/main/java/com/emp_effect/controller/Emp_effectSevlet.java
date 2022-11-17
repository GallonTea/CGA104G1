package com.emp_effect.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;
import com.emp_effect.model.Emp_effectService;
import com.emp_effect.model.Emp_effectVO;
@WebServlet("/backend/emp_effect/Emp_effectServlet")
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

			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String str = req.getParameter("emp_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.put("emp_id","請輸入員工編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher fail= req
							.getRequestDispatcher("/backend/emp_effect/select_page.jsp");
					fail.forward(req, res);
					return;
				}
				
				Integer emp_id = null;
				try {
					emp_id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.put("emp_id","員工編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher fail = req
							.getRequestDispatcher("/backend/emp_effect/select_page.jsp");
					fail.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				Emp_effectService emp_effectSvc = new Emp_effectService();
				List<Emp_effectVO> emp_effectVO = emp_effectSvc. getOneEmp(emp_id);
				if (emp_id == null) {
					errorMsgs.put("emp_id","查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher fail = req
							.getRequestDispatcher("/backend/emp_effect/select_page.jsp");
					fail.forward(req, res);
					return;
				}
				req.setAttribute("emp_id", emp_id); 
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("emp_effectVO", emp_effectVO); 
				String url = "/backend/emp_effect/listOneEmp_Effect.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}
		if ("getOne_For_Update".equals(action)) { 

			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
		
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
			Integer emp_id = Integer.valueOf(req.getParameter("emp_id"));
				
				/***************************2.開始查詢資料****************************************/
				Emp_effectService emp_effectSvc = new Emp_effectService();
				List<Emp_effectVO> emp_effectVO = emp_effectSvc.getOneEmp(emp_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("emp_effectVO", emp_effectVO);       
				String url = "/backend/emp_effect/update_Emp_Effect_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		if ("update".equals(action)) { 
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			
				

				Integer emp_id = Integer.valueOf(req.getParameter("emp_id").trim());
				if (emp_id == null ) {
					errorMsgs.put("emp_id","員工編號: 請勿空白");
				} 
//				else if(emp_status != 0 || emp_status != 1 ) { 
//					errorMsgs.put("emp_id","員工狀態: 只能是0或1");
//	            }
				Integer effect_id = Integer.valueOf(req.getParameter("effect_id").trim());
				if (effect_id == null ) {
					errorMsgs.put("effect_id","權限編號: 請勿空白");
				} 

				Emp_effectVO emp_effectVO = new Emp_effectVO();
			
	
				emp_effectVO.setEmp_id(emp_id);
				emp_effectVO.setEffect_id(effect_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("emp_effectVO", emp_effectVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher fail = req
							.getRequestDispatcher("/backend/emp_effect/update_Emp_Effect_input.jsp");
					fail.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				Emp_effectService emp_effectSvc = new Emp_effectService();
				emp_effectVO = emp_effectSvc.updateEmp_effect(emp_id,effect_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("emp_effectVO", emp_effectVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/backend/emp_effect/listOneEmp_Effect.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
		}

	}

}