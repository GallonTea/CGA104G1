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
import com.qualified_doctor.model.Qualified_doctorService;
import com.qualified_doctor.model.Qualified_doctorVO;

@WebServlet("/Qualified_doctorServlet")
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
				errorMsgs.put("doc_id", "請輸入認證醫生編號");
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
				errorMsgs.put("doc_id", "認證醫師編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			Qualified_doctorService qualified_doctorSvc = new Qualified_doctorService();
			Qualified_doctorVO qualified_doctorVO = qualified_doctorSvc.getOneQualified_doctor(doc_id);
			if (qualified_doctorVO == null) {
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
			req.setAttribute("qualified_doctorVO", qualified_doctorVO); // 資料庫取出的empVO物件,存入req
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
			Qualified_doctorService qualified_doctorSvc = new Qualified_doctorService();
			Qualified_doctorVO qualified_doctorVO = qualified_doctorSvc.getOneQualified_doctor(doc_id);

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
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			
			Integer doc_status = Integer.valueOf(req.getParameter("doc_status").trim());
			try {
				doc_status = Integer.valueOf(req.getParameter("doc_status").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("狀態請勿空白");
			}
			
			Integer doc_id = Integer.valueOf(req.getParameter("doc_id").trim());

			Qualified_doctorVO qualified_doctorVO = new Qualified_doctorVO();


			qualified_doctorVO.setMem_id(mem_id);
			qualified_doctorVO.setDoc_status(doc_status);
			qualified_doctorVO.setDoc_id(doc_id);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("qualified_doctorVO", qualified_doctorVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/update_mem_input.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始新增資料 ***************************************/
			Qualified_doctorService qualified_doctorSvc = new Qualified_doctorService();
			qualified_doctorSvc.updateQualified_doctor(mem_id,doc_status,doc_id);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		
		

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
			
			Integer doc_status = Integer.valueOf(req.getParameter("doc_status").trim());
			try {
				doc_status = Integer.valueOf(req.getParameter("doc_status").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("狀態請勿空白");
			}
			
			Integer doc_id = Integer.valueOf(req.getParameter("doc_id").trim());
			
			
			Qualified_doctorVO qualified_doctorVO = new Qualified_doctorVO();


			qualified_doctorVO.setMem_id(mem_id);
			qualified_doctorVO.setDoc_status(doc_status);
			qualified_doctorVO.setDoc_id(doc_id);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("qualified_doctorVO", qualified_doctorVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/mem/addMem.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			Qualified_doctorService qualified_doctorSvc = new Qualified_doctorService();
			qualified_doctorSvc.addQualified_doctor(mem_id,doc_status,doc_id);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer doc_id = Integer.valueOf(req.getParameter("doc_id"));

			/*************************** 2.開始刪除資料 ***************************************/
			Qualified_doctorService qualified_doctorSvc = new Qualified_doctorService();
			qualified_doctorSvc.deleteQualified_doctor(doc_id);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/frontend/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

		}



	}
}
