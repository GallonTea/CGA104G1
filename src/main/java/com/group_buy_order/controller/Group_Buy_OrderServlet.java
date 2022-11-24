package com.group_buy_order.controller;

import java.io.IOException;
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

import com.group_buy_order.model.Group_Buy_OrderService;
import com.group_buy_order.model.Group_Buy_OrderVO;

@WebServlet("/Group_Buy_OrderServlet")
public class Group_Buy_OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Group_Buy_OrderServlet() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		
		if ("update_pt".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			Integer gborder_id = Integer.valueOf(req.getParameter("gborder_id").trim());
			
			Group_Buy_OrderVO group_buy_orderVO = new Group_Buy_OrderVO();
			
			group_buy_orderVO.setGborder_id(gborder_id);
		
		
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 含有輸入格式錯誤的VO物件,也存入req
//				RequestDispatcher fail = req.getRequestDispatcher("/backend/group_buy_order/updateGroup_Buy_Order.jsp");
//				fail.forward(req, res);
//				return; // 程式中斷
//			}

			/*************************** 2.開始修改資料 *****************************************/
			Group_Buy_OrderService group_buy_OrderSvc = new Group_Buy_OrderService();
			group_buy_orderVO = group_buy_OrderSvc.update_pt(gborder_id);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			/***********************************團購編號查詢*************************************/
			group_buy_orderVO = group_buy_OrderSvc.getOneEmp(gborder_id);
			
			req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 資料庫update成功後,重新搜尋放入VO
		
			String url = "/frontend/group_buy_order/listOneGroup_Buy_Order_byMaster.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交jsp
			successView.forward(req, res);
		
		}
		
		if ("update_paying".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			Integer gborder_id = Integer.valueOf(req.getParameter("gborder_id").trim());
			
			Group_Buy_OrderVO group_buy_orderVO = new Group_Buy_OrderVO();
			
			group_buy_orderVO.setGborder_id(gborder_id);
		
		
			/*************************** 2.開始修改資料 *****************************************/
			Group_Buy_OrderService group_buy_OrderSvc = new Group_Buy_OrderService();
			group_buy_orderVO = group_buy_OrderSvc.update_paying(gborder_id);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			/***********************************團購編號查詢*************************************/
			group_buy_orderVO = group_buy_OrderSvc.getOneEmp(gborder_id);
			
			req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 資料庫update成功後,重新搜尋放入VO
		
			String url = "/frontend/group_buy_order/listOneGroup_Buy_Order_byMaster.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交jsp
			successView.forward(req, res);
		
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if ("getOne_For_Backend_Display".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("gborder_id");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.put("gborder_id", "請輸入團購訂單編號");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/backend/group_buy_order/listGroup_Buy_Order.jsp");
				fail.forward(req, res);
				return;
			}

			Integer gborder_id = null;
			try {
				gborder_id = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.put("gborder_id", "團購訂單編號格式不正確");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/backend/group_buy_order/listGroup_Buy_Order.jsp");
				fail.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/

			Group_Buy_OrderService group_buy_OrdeSvc = new Group_Buy_OrderService();
			Group_Buy_OrderVO group_buy_orderVO = group_buy_OrdeSvc.getOneEmp(gborder_id);
			if (group_buy_orderVO == null) {
				errorMsgs.put("gborder_id", "查無資料");
				
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/backend/group_buy_order/listGroup_Buy_Order.jsp");
				fail.forward(req, res);
				return;
			}
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			
			
			req.setAttribute("group_buy_orderVO", group_buy_orderVO);
		
			
			String url = "/backend/group_buy_order/updateGroup_Buy_Order.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
		

		if ("getOne_For_Display".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("gborder_id");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.put("gborder_id", "請輸入團購訂單編號");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/frontend/group_buy_order/select_page.jsp");
				fail.forward(req, res);
				return;
			}

			Integer gborder_id = null;
			try {
				gborder_id = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.put("gborder_id", "團購訂單編號格式不正確");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/frontend/group_buy_order/select_page.jsp");
				fail.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/

			Group_Buy_OrderService group_buy_OrdeSvc = new Group_Buy_OrderService();
			Group_Buy_OrderVO group_buy_orderVO = group_buy_OrdeSvc.getOneEmp(gborder_id);
			if (group_buy_orderVO == null) {
				errorMsgs.put("gborder_id", "查無資料");
				
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/frontend/group_buy_order/select_page.jsp");
				fail.forward(req, res);
				return;
			}
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			
			
			req.setAttribute("group_buy_orderVO", group_buy_orderVO);
			
			
			String url = "/frontend/group_buy_order/listOneGroup_Buy_Order.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
		if ("update".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			Integer gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
			System.out.println(gbitem_id);
			//團購團編號
			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
			//抓折扣數量
			Integer gbitem_amount =Integer.valueOf(req.getParameter("gbitem_amount").trim());
			//抓運算後原始價格
			Integer gboriginal_price = Integer.valueOf(req.getParameter("gboriginal_price").trim());
			
			Integer discount_id = Integer.valueOf(req.getParameter("discount_id").trim());
			
			//抓折扣後運算價格
			Integer gb_endprice = Integer.valueOf(req.getParameter("gb_endprice").trim());	
			//資料庫自主生成時間
			java.sql.Timestamp gborder_date = java.sql.Timestamp.valueOf(req.getParameter("gborder_date").trim());
			
			
			Integer gborder_paying = Integer.valueOf(req.getParameter("gborder_paying").trim());
			
			try {
				gborder_paying = Integer.valueOf(req.getParameter("gborder_paying").trim());;
				
			} catch (Exception e) {
				
				errorMsgs.put("gborder_paying", "請選擇付款方式");
			}
			
			Integer gborder_send = null;
			try { 
				gborder_send = Integer.valueOf(req.getParameter("gborder_send").trim());
			} catch (Exception e) {
				
				errorMsgs.put("gborder_send", "請輸入貨運方式");
			}
				
			
			Integer gborder_status = Integer.valueOf(req.getParameter("gborder_status").trim());
			
			String tracking_num = req.getParameter("tracking_num");
			java.sql.Timestamp pickup_time = java.sql.Timestamp.valueOf(req.getParameter("pickup_time").trim());
	
			
			Integer gborder_id = Integer.valueOf(req.getParameter("gborder_id").trim());
			
			String gborder_other = req.getParameter("gborder_other");
			
			String receiver_name = req.getParameter("receiver_name");
			if (receiver_name == null || receiver_name.trim().length() == 0) {
				
				errorMsgs.put("receiver_name", "收件人請勿留白");
			}
			
			String receiver_address = req.getParameter("receiver_address");
			if (receiver_address == null || receiver_address.trim().length() == 0) {
				errorMsgs.put("receiver_address", "地址請勿留白");
			}
			
			String receiver_phone = req.getParameter("receiver_phone");
			if (receiver_phone == null || receiver_phone.trim().length() == 0) {
				
				errorMsgs.put("receiver_phone", "電話請勿留白");
			}
		

			Group_Buy_OrderVO group_buy_orderVO = new Group_Buy_OrderVO();
			
			
			group_buy_orderVO.setGbitem_id(gbitem_id);
			group_buy_orderVO.setGb_id(gb_id);
			group_buy_orderVO.setGbitem_amount(gbitem_amount);
			group_buy_orderVO.setGboriginal_price(gboriginal_price);
			group_buy_orderVO.setDiscount_id(discount_id);
			group_buy_orderVO.setGb_endprice(gb_endprice);
			
			group_buy_orderVO.setGborder_paying(gborder_paying);
			group_buy_orderVO.setGborder_send(gborder_send);
			group_buy_orderVO.setGborder_status(gborder_status);
			group_buy_orderVO.setGborder_other(gborder_other);
			group_buy_orderVO.setTracking_num(tracking_num);
			group_buy_orderVO.setReceiver_name(receiver_name);
			group_buy_orderVO.setReceiver_address(receiver_address);
			group_buy_orderVO.setReceiver_phone(receiver_phone);
			
			group_buy_orderVO.setPickup_time(pickup_time);
			group_buy_orderVO.setGborder_date(gborder_date);
			group_buy_orderVO.setGborder_id(gborder_id);
		
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 含有輸入格式錯誤的VO物件,也存入req
				RequestDispatcher fail = req.getRequestDispatcher("/backend/group_buy_order/updateGroup_Buy_Order.jsp");
				fail.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			Group_Buy_OrderService group_buy_OrderSvc = new Group_Buy_OrderService();
			group_buy_orderVO = group_buy_OrderSvc.updateGroup_Buy_Order(gborder_id, gbitem_id,gb_id,gbitem_amount,
					gboriginal_price,discount_id,gb_endprice,gborder_paying,
					gborder_send,gborder_status,gborder_other,tracking_num,receiver_name,
					receiver_address,receiver_phone,gborder_date,pickup_time);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			
			req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 資料庫update成功後,重新搜尋放入VO
		
			String url = "/backend/group_buy_order/after_updateGroup_Buy_Order.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交jsp
			successView.forward(req, res);
		
		}
		if ("insert_NewOrder".equals(action)) { // 來自addEmp.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			
		

			Integer gborder_id = 0;
			
			Integer gbitem_id = (Integer)session.getAttribute("gbitem_id");
			
			//團購團編號
//			Integer gb_id = (Integer)session.getAttribute("gb_id");
			//抓折扣數量
			Integer gbitem_amount =Integer.valueOf(req.getParameter("discount_minamount").trim());
			//抓運算後原始價格
			Integer gboriginal_price = Integer.valueOf(req.getParameter("gboriginal_price").trim());
			
			Integer discount_id = Integer.valueOf(req.getParameter("discount_id").trim());
			
			//抓折扣後運算價格
			Integer gb_endprice = Integer.valueOf(req.getParameter("gb_endprice").trim());	
			//資料庫自主生成時間
			java.sql.Timestamp gborder_date = null;
			
//			Integer gborder_paying = Integer.valueOf(req.getParameter("gborder_paying").trim());
			Integer gborder_paying = null;
			try {
				gborder_paying = Integer.valueOf(req.getParameter("gborder_paying").trim());;
				
			} catch (Exception e) {
				
				errorMsgs.put("gborder_paying", "請選擇付款方式");
			}
			
			Integer gborder_send = null;
			try { 
				gborder_send = Integer.valueOf(req.getParameter("gborder_send").trim());
			} catch (Exception e) {
				
				errorMsgs.put("gborder_send", "請輸入貨運方式");
			}
				
			
			Integer gborder_status = Integer.valueOf(req.getParameter("gborder_status").trim());
			
//			String tracking_num = req.getParameter("tracking_num");
			
			java.sql.Timestamp pickup_time = null;
			
//			Integer gborder_id = Integer.valueOf(req.getParameter("gborder_id").trim());
			
			String gborder_other = req.getParameter("gborder_other");
			
			String receiver_name = req.getParameter("receiver_name");
			if (receiver_name == null || receiver_name.trim().length() == 0) {
				
				errorMsgs.put("receiver_name", "收件人請勿留白");
			}
			
			String receiver_address = req.getParameter("receiver_address");
			if (receiver_address == null || receiver_address.trim().length() == 0) {
				errorMsgs.put("receiver_address", "地址請勿留白");
			}
			
			String receiver_phone = req.getParameter("receiver_phone");
			if (receiver_phone == null || receiver_phone.trim().length() == 0) {
				
				errorMsgs.put("receiver_phone", "電話請勿留白");
			}
		

			Group_Buy_OrderVO group_buy_orderVO = new Group_Buy_OrderVO();
			
			
			group_buy_orderVO.setGbitem_id(gbitem_id);
//			group_buy_orderVO.setGb_id(gb_id);
			group_buy_orderVO.setGbitem_amount(gbitem_amount);
			group_buy_orderVO.setGboriginal_price(gboriginal_price);
			group_buy_orderVO.setDiscount_id(discount_id);
			group_buy_orderVO.setGb_endprice(gb_endprice);
			
			group_buy_orderVO.setGborder_paying(gborder_paying);
			group_buy_orderVO.setGborder_send(gborder_send);
			group_buy_orderVO.setGborder_status(gborder_status);
			group_buy_orderVO.setGborder_other(gborder_other);
//			group_buy_orderVO.setTracking_num(tracking_num);
			group_buy_orderVO.setReceiver_name(receiver_name);
			group_buy_orderVO.setReceiver_address(receiver_address);
			group_buy_orderVO.setReceiver_phone(receiver_phone);
			
			group_buy_orderVO.setPickup_time(pickup_time);
			group_buy_orderVO.setGborder_date(gborder_date);
			group_buy_orderVO.setGborder_id(gborder_id);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 含有輸入格式錯誤req
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/group_buy_order/addGroup_Buy_Order.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始新增資料 ***************************************/
			

			Group_Buy_OrderService group_buy_OrderSvc = new Group_Buy_OrderService();
			group_buy_orderVO = group_buy_OrderSvc.addGroup_Buy_Order_User(gbitem_id, gbitem_amount, gboriginal_price, discount_id, gb_endprice, gborder_paying, gborder_send, gborder_status, gborder_other, receiver_name, receiver_address, receiver_phone,gborder_date,gborder_id);
			
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

			req.setAttribute("group_buy_orderVO", group_buy_orderVO); 
			
			String url = "/frontend/group_buy_order/listOneGroup_Buy_Order_byMaster.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		if ("listgroup_buy_order".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");
			if (req.getParameter("whichPage") == null) {
				Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
				session.setAttribute("map", map1);
				map = map1;
			}
			Group_Buy_OrderService group_buy_OrdeSvc = new Group_Buy_OrderService();
			List<Group_Buy_OrderVO> list = group_buy_OrdeSvc.getAll(map);
			req.setAttribute("listgroup_buy_order", list);
			RequestDispatcher successView = req.getRequestDispatcher("/backend/group_buy_order/listGroup_Buy_Order.jsp");
			successView.forward(req, res);

		}
			
//			
//		if ("inserTwo".equals(action)) { // 來自addEmp.jsp的請求
//
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//			
//		
//			Integer gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
//		
//			Integer gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
//			Integer gbitem_amount = Integer.valueOf(req.getParameter("gbitem_amount").trim());
//			Integer gboriginal_price = Integer.valueOf(req.getParameter("gboriginal_price").trim());	
//			Integer discount_id = Integer.valueOf(req.getParameter("discount_id").trim());			
//			Integer gb_endprice = Integer.valueOf(req.getParameter("gb_endprice").trim());			
//			java.sql.Timestamp gborder_date = java.sql.Timestamp.valueOf(req.getParameter("gborder_date").trim());		
//			Integer gborder_paying = Integer.valueOf(req.getParameter("gborder_paying").trim());		
//			Integer gborder_send = Integer.valueOf(req.getParameter("gborder_send").trim());		
//			Integer gborder_status = Integer.valueOf(req.getParameter("gborder_status").trim());
//			String tracking_num = req.getParameter("tracking_num");
//			java.sql.Timestamp pickup_time = java.sql.Timestamp.valueOf(req.getParameter("pickup_time").trim());
//			Integer gborder_id = Integer.valueOf(req.getParameter("gborder_id").trim());
//			String gborder_other = req.getParameter("gborder_other");
//			
//			
//			System.out.println(999);
//			Group_Buy_OrderVO group_buy_orderVO = new Group_Buy_OrderVO();
//			group_buy_orderVO.setGbitem_id(gbitem_id);
//			group_buy_orderVO.setGb_id(gb_id);
//			group_buy_orderVO.setGbitem_amount(gbitem_amount);
//			group_buy_orderVO.setGboriginal_price(gboriginal_price);
//			group_buy_orderVO.setDiscount_id(discount_id);
//			group_buy_orderVO.setGb_endprice(gb_endprice);
//			group_buy_orderVO.setGborder_date(gborder_date);
//			group_buy_orderVO.setGborder_paying(gborder_paying);
//			group_buy_orderVO.setGborder_send(gborder_send);
//			group_buy_orderVO.setGborder_status(gborder_status);
//			group_buy_orderVO.setGborder_other(gborder_other);
//			group_buy_orderVO.setTracking_num(tracking_num);
////			group_buy_orderVO.setReceiver_name(receiver_name);
////			group_buy_orderVO.setReceiver_address(receiver_address);
////			group_buy_orderVO.setReceiver_phone(receiver_phone);
//			group_buy_orderVO.setPickup_time(pickup_time);
//			group_buy_orderVO.setGborder_id(gborder_id);
//			
//			System.out.println(999);
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("group_buy_orderVO", group_buy_orderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/emp/addEmp.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			/*************************** 2.開始新增資料 ***************************************/
//			System.out.println(999);
//			Group_Buy_OrderService group_buy_OrdeSvc = new Group_Buy_OrderService();
//			group_buy_orderVO = group_buy_OrdeSvc.addGroup_Buy_Order( gbitem_id, gb_id, gbitem_amount, gboriginal_price, discount_id, gb_endprice, gborder_date, gborder_paying, gborder_send, gborder_status, gborder_other, tracking_num, receiver_name, receiver_address, receiver_phone, pickup_time);
//			
//			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//
//			String url = "/backend/group_buy_order/listOneGroup_Buy_Order.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//			successView.forward(req, res);
//		}
			
			
			
			
			

//		if ("getOne_For_Update".equals(action)) { 
//
//			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
//		
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//				/***************************1.接收請求參數****************************************/
//			Integer emp_id = Integer.valueOf(req.getParameter("emp_id"));
//				
//				/***************************2.開始查詢資料****************************************/
//				Emp_effectService emp_effectSvc = new Emp_effectService();
//				List<Emp_effectVO> emp_effectVO = emp_effectSvc.getOneEmp(emp_id);
//								
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("emp_effectVO", emp_effectVO);       
//				String url = "/backend/group_buy_order/update_Emp_Effect_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//		}
//		if ("update".equals(action)) { 
//			
//			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//		
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//			
//				
//
//				Integer emp_id = Integer.valueOf(req.getParameter("emp_id").trim());
//				if (emp_id == null ) {
//					errorMsgs.put("emp_id","員工編號: 請勿空白");
//				} 
////				else if(emp_status != 0 || emp_status != 1 ) { 
////					errorMsgs.put("emp_id","員工狀態: 只能是0或1");
////	            }
//				Integer effect_id = Integer.valueOf(req.getParameter("effect_id").trim());
//				if (effect_id == null ) {
//					errorMsgs.put("effect_id","權限編號: 請勿空白");
//				} 
//
//				Emp_effectVO emp_effectVO = new Emp_effectVO();
//			
//	
//				emp_effectVO.setEmp_id(emp_id);
//				emp_effectVO.setEffect_id(effect_id);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("emp_effectVO", emp_effectVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher fail = req
//							.getRequestDispatcher("/backend/group_buy_order/update_Emp_Effect_input.jsp");
//					fail.forward(req, res);
//					return; //程式中斷
//				}
//				
//				/***************************2.開始修改資料*****************************************/
//				Emp_effectService emp_effectSvc = new Emp_effectService();
//				emp_effectVO = emp_effectSvc.updateEmp_effect(emp_id,effect_id);
//				
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("emp_effectVO", emp_effectVO); // 資料庫update成功後,正確的的empVO物件,存入req
//				String url = "/backend/group_buy_order/listOneEmp_Effect.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//				successView.forward(req, res);
//		}

			}


	}
