package com.group_buy.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.Timestamp;
import com.group_buy.model.Group_BuyService;
import com.group_buy.model.Group_BuyVO;
import com.group_buy_item.model.Group_Buy_ItemService;
import com.group_buy_item.model.Group_Buy_ItemVO;
import com.group_buy_item_picture.model.groupBuyItemPictureService;
import com.group_buy_item_picture.model.groupBuyItemPictureVO;

@WebServlet("/GroupBuyServlet")
public class GroupBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupBuyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("gb_id");
//			System.out.println(str);
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入團購團編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/group_buy/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			Integer gb_id = null;
			try {
				gb_id = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("團購團編號格式不正確");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/group_buy/select_page.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始查詢資料 *****************************************/
			Group_BuyService group_BuyService = new Group_BuyService();
			Group_BuyVO group_BuyVO = group_BuyService.getOneGroup_Buy(gb_id);
			
			if (group_BuyVO == null) {
				errorMsgs.add("查無資料");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/group_buy/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("Group_BuyVO", group_BuyVO);
			String url = "/backend/group_buy/listOneGroupBuy.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllGroupBuy.jsp的請求

			List<String> errorMsgs1 = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs1);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer gb_id = Integer.valueOf(req.getParameter("gb_id"));
				/*************************** 2.開始查詢資料 ****************************************/
				Group_BuyService group_BuyService = new Group_BuyService();
				Group_BuyVO group_BuyVO = group_BuyService.getOneGroup_Buy(gb_id);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("Group_BuyVO", group_BuyVO);
				
				
				// 成功轉交 update_groupBuyItem_input.jsp
				String url = "/backend/group_buy/update_groupBuy_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				// 其他可能的錯誤處理
			}  catch (IOException e) {
//				e.printStackTrace();
				String url = "/backend/group_buy/listAllGroupBuy.jsp";
				errorMsgs1.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		if ("update".equals(action)) { // 來自update_groupBuy_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer gb_id = null;
			try {
				gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
				if (gb_id == null) {
					errorMsgs.add("團購團編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.add("團購團編號請填數字.");
				e1.printStackTrace();
			}
			
			
			Integer mem_id = null;
			try {
				mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
				if (mem_id == null) {
					errorMsgs.add("團購主編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.add("團購主編號請填數字.");
				e1.printStackTrace();
			}
			
			
			Integer gbitem_id = null;
			try {
				gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
				if (gbitem_id == null) {
					errorMsgs.add("團購商品編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.add("團購商品編號請填數字.");
				e1.printStackTrace();
			}
			
			
			
			Integer gb_min = null;

			try {
				gb_min = Integer.valueOf(req.getParameter("gb_min").trim());
				if (gb_min == null) {
					errorMsgs.add("團購人數低標: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("團購人數低標請填數字");
				e.printStackTrace();
			}

			Integer gb_amount = null;

			try {
				gb_amount = Integer.valueOf(req.getParameter("gb_amount"));
				if (gb_amount == null) {
					errorMsgs.add("目前參團人數: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("目前參團人數請填數字");
				e.printStackTrace();
			}

			
			
			java.sql.Timestamp gbstart_date = null;

			try {
				gbstart_date = java.sql.Timestamp.valueOf(req.getParameter("gbstart_date").trim());
			} catch (IllegalArgumentException e) {
				gbstart_date = new java.sql.Timestamp(System.currentTimeMillis());
				e.printStackTrace();
				errorMsgs.add("團購開始請輸入日期!");
			}
			java.sql.Timestamp gbend_date = null;
			
			try {
				gbend_date = java.sql.Timestamp.valueOf(req.getParameter("gbend_date").trim());
			} catch (IllegalArgumentException e) {
				gbend_date = new java.sql.Timestamp(System.currentTimeMillis());
				e.printStackTrace();
				errorMsgs.add("團購結束請輸入日期!");
			}

			Integer gb_status = null;

			try {
				gb_status = Integer.valueOf(req.getParameter("gb_status"));
				if (gb_status == null) {
					errorMsgs.add("團購狀態: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("團購狀態請填數字");
				e.printStackTrace();
			}

			Group_BuyVO group_BuyVO = new Group_BuyVO();
			group_BuyVO.setGb_id(gb_id);
			group_BuyVO.setMem_id(mem_id);
			group_BuyVO.setGbitem_id(gbitem_id);
			group_BuyVO.setGb_min(gb_min);
			group_BuyVO.setGb_amount(gb_amount);
			group_BuyVO.setGbstart_date(gbstart_date);
			group_BuyVO.setGbend_date(gbend_date);
			group_BuyVO.setGb_status(gb_status);
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("Group_BuyVO", group_BuyVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/group_buy/update_groupBuy_input.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始修改資料 *****************************************/
			Group_BuyService group_BuyService = new Group_BuyService();
			group_BuyVO = group_BuyService.updateGroup_Buy(gb_id, mem_id, gbitem_id, gb_min, gb_amount, gbstart_date, gbend_date, gb_status);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("Group_BuyVO", group_BuyVO);
			String url = "/backend/group_buy/listOneGroupBuy.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		if ("insert".equals(action)) { // 來自addGroupBuy.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			Integer mem_id = null;
			try {
				mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
				if (mem_id == null) {
					errorMsgs.add("團購主編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.add("團購主編號請填數字.");
				e1.printStackTrace();
			}
			
			
			Integer gbitem_id = null;
			try {
				gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
				if (gbitem_id == null) {
					errorMsgs.add("團購商品編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.add("團購商品編號請填數字.");
				e1.printStackTrace();
			}
			
			
			
			Integer gb_min = null;

			try {
				gb_min = Integer.valueOf(req.getParameter("gb_min").trim());
				if (gb_min == null) {
					errorMsgs.add("團購人數低標: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("團購人數低標請填數字");
				e.printStackTrace();
			}

			Integer gb_amount = null;

			try {
				gb_amount = Integer.valueOf(req.getParameter("gb_amount"));
				if (gb_amount == null) {
					errorMsgs.add("目前參團人數: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("目前參團人數請填數字");
				e.printStackTrace();
			}

			
			
			java.sql.Timestamp gbstart_date = null;

			try {
				gbstart_date = java.sql.Timestamp.valueOf(req.getParameter("gbstart_date").trim());
			} catch (IllegalArgumentException e) {
				gbstart_date = new java.sql.Timestamp(System.currentTimeMillis());
				e.printStackTrace();
				errorMsgs.add("團購開始請輸入日期!");
			}
			java.sql.Timestamp gbend_date = null;
			
			try {
				gbend_date = java.sql.Timestamp.valueOf(req.getParameter("gbend_date").trim());
			} catch (IllegalArgumentException e) {
				gbend_date = new java.sql.Timestamp(System.currentTimeMillis());
				e.printStackTrace();
				errorMsgs.add("團購結束請輸入日期!");
			}

			Integer gb_status = null;

			try {
				gb_status = Integer.valueOf(req.getParameter("gb_status"));
				if (gb_status == null) {
					errorMsgs.add("團購狀態: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.add("團購狀態請填數字");
				e.printStackTrace();
			}
			
			

			Group_BuyVO group_BuyVO = new Group_BuyVO();
			group_BuyVO.setMem_id(mem_id);
			group_BuyVO.setGbitem_id(gbitem_id);
			group_BuyVO.setGb_min(gb_min);
			group_BuyVO.setGb_amount(gb_amount);
			group_BuyVO.setGbstart_date(gbstart_date);
			group_BuyVO.setGbend_date(gbend_date);
			group_BuyVO.setGb_status(gb_status);

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("Group_BuyVO", group_BuyVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/group_buy/addGroupBuy.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始修改資料 *****************************************/
			Group_BuyService group_BuyService = new Group_BuyService();
			group_BuyVO = group_BuyService.addGroup_Buy(mem_id, gbitem_id, gb_min, gb_amount, gbstart_date, gbend_date, gb_status);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("Group_BuyVO", group_BuyVO);
			String url = "/backend/group_buy/listAllGroupBuy.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if ("delete".equals(action)) { // 來自listAllGroupBuy.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.接收請求參數***************************************/
				Integer gb_id = Integer.valueOf(req.getParameter("gb_id"));
				
				/***************************2.開始刪除資料***************************************/
				Group_BuyService group_BuyService = new Group_BuyService();
				group_BuyService.deleteGroup_Buy(gb_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/backend/group_buy/listAllGroupBuy.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
		}
			
	}

}