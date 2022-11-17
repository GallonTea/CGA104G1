package com.group_buy_item_picture.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group_buy_item_picture.model.groupBuyItemPictureService;
import com.group_buy_item_picture.model.groupBuyItemPictureVO;

@WebServlet("/groupBuyItemPicture/groupBuyItemPictureGetOne.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class GroupBuyItemPictureGetOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GroupBuyItemPictureGetOneServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("image/gif");
//		String action = req.getParameter("action");

//		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
//			
//			List<String> errorMsgs = new LinkedList<String>();
//
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//			String str = req.getParameter("gbitem_id");
//			if (str == null || (str.trim()).length() == 0) {
//				errorMsgs.add("請輸入團購商品編號");
//			}
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/Group_Buy_Item/select_page.jsp");
//				failureView.forward(req, res);
//				return;// 程式中斷
//			}
//
//			Integer gbitem_id = null;
//			try {
//				gbitem_id = Integer.valueOf(str);
//			} catch (Exception e) {
//				errorMsgs.add("團購商品編號格式不正確");
//			}
//
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/Group_Buy_Item/select_page.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			/*************************** 2.開始查詢資料 *****************************************/
//			groupBuyItemPictureService gbipSvc = new groupBuyItemPictureService();
//			groupBuyItemPictureVO gbipVO = gbipSvc.getOneGroupBuyItemPicture(gbitem_id);
//
//			ServletOutputStream out = res.getOutputStream();
//			out.write(gbipVO.getGbip_content());
//
//			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("groupBuyItemPictureVO", gbipVO);
//			String url = "/backend/Group_Buy_Item/listOneGroupBuyItem.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);
//
//		}
		
		ServletOutputStream out = res.getOutputStream();
		Integer gbitem_id = Integer.valueOf(req.getParameter("gbitem_id"));
		groupBuyItemPictureService gbipSvc = new groupBuyItemPictureService();
		groupBuyItemPictureVO gbipVO = gbipSvc.getMainGroupBuyItemPictureByGbitemID(gbitem_id);
		out.write(gbipVO.getGbip_content());
		
		
		
	}
}
