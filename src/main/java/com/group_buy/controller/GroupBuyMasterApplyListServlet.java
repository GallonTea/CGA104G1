package com.group_buy.controller;

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
import javax.servlet.http.HttpSession;

import com.discount.model.DiscountService;
import com.group_buy.model.Group_BuyService;
import com.group_buy.model.Group_BuyVO;
import com.group_buy_item.model.Group_Buy_ItemService;
import com.group_buy_item.model.Group_Buy_ItemVO;
import com.mem.model.MemVO;
import com.news.controller.newsServlet;

@WebServlet("/GroupBuyMasterApplyListServlet")
public class GroupBuyMasterApplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GroupBuyMasterApplyListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("confirmGroupBuy".equals(action)) { // 來自chosegroupbuydiscount.jsp "確認開團"
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 取得會員編號
//		MemVO memVO = (MemVO) req.getSession().getAttribute("memVO");
//		Integer mem_id = memVO.getMem_id();

			Integer mem_id = null;
			try {
				mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
				if (mem_id == null) {
					errorMsgs.put("gbitem_id", "團購主會員編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.put("mem_id", "團購主會員編號請填數字.");
				e1.printStackTrace();
			}

			Integer discount_price = null;
			try {
				discount_price = Integer.valueOf(req.getParameter("discount_price").trim());
			} catch (Exception e) {
				errorMsgs.put("discount_price", "團購折扣格式不正確");
			}

			Integer gbitem_price = null;
			try {
				gbitem_price = Integer.valueOf(req.getParameter("gbitem_price").trim());
				if (gbitem_price == null) {
					errorMsgs.put("gbitem_price", "團購商品價格': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.put("gbitem_price", "團購商品價格請填數字.");
				e1.printStackTrace();
			}
			Integer gb_id = null;
			try {
				gb_id = Integer.valueOf(req.getParameter("gb_id").trim());
				if (gb_id == null) {
					errorMsgs.put("gb_id", "團購團編號': 請勿空白");
				}
			} catch (NumberFormatException e1) {
				errorMsgs.put("gb_id", "團購團號請填數字.");
				e1.printStackTrace();
			}

			Integer gb_price = null;

			try {
				gb_price = Integer.valueOf(req.getParameter("gb_price"));
				if (gb_price == null) {
					errorMsgs.put("gb_price", "團購價格: 請勿空白");
				}
			} catch (NumberFormatException e) {
				errorMsgs.put("gb_price", "團購價格請填數字");
				e.printStackTrace();
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/groupBuy/chosegroupbuydiscount.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}
			/*************************** 2.開始修改資料 *****************************************/
			Group_BuyVO group_BuyVO = new Group_BuyVO();
			Group_BuyService group_BuyService = new Group_BuyService();
			gb_price = (int) (Math.round(discount_price * gbitem_price * 0.01));
			group_BuyVO = group_BuyService.updateGroup_Buy_GBPrice(gb_id, gb_price);
			List<Group_BuyVO> list = group_BuyService.joinGBIGetAllWhereMemID(mem_id);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("list", list);
			RequestDispatcher successView = req.getRequestDispatcher("/frontend/groupBuy/mygroupbuyapplylist.jsp");
			successView.forward(req, res);
		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if ("listAllMyGroupBuy".equals(action)) { // 來自需要查看自己團購團狀態的需求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			// 取得會員編號
//			MemVO memVO = (MemVO) req.getSession().getAttribute("memVO");
//			Integer mem_id = memVO.getMem_id();
//				Integer mem_id = null;
//				try {
//					mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
//					if (mem_id == null) {
//						errorMsgs.put("gbitem_id", "團購主會員編號': 請勿空白");
//					}
//				} catch (NumberFormatException e1) {
//					errorMsgs.put("mem_id", "團購主會員編號請填數字.");
//					e1.printStackTrace();
//				}
				
				//尋找mem_id為團主或是團員
				Integer mem = (Integer) session.getAttribute("mem_id");
			
				Integer gb_id = 1;
				Group_BuyService group_buySvc = new Group_BuyService();
				Group_BuyVO group_buyVO = group_buySvc.getOneGroup_Buy(gb_id);
				Integer master = group_buyVO.getMem_id();
				
				
				
				int master_id = master;
				int mem_id = mem;
				if (master_id == mem_id) {
					
					Group_BuyVO group_BuyVO = new Group_BuyVO();
					Group_BuyService group_BuyService = new Group_BuyService();
					List<Group_BuyVO> list = group_BuyService.joinGBIGetAllWhereMemID(mem_id);
					req.setAttribute("list", list);
					String url = "/frontend/groupBuy/mygroupbuyapplylist.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return;
				}
				
				Group_BuyVO group_BuyVO = new Group_BuyVO();
				Group_BuyService group_BuyService = new Group_BuyService();
				List<Group_BuyVO> list = group_BuyService.joinGBIGetAllWhereMemID(mem_id);
				req.setAttribute("list", list);
				String url = "/frontend/groupBuy/mygroupbuyNOTGroupMasterApplylist.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			
			
//			/*************************** 2.開始修改資料 *****************************************/
//			Group_BuyVO group_BuyVO = new Group_BuyVO();
//			Group_BuyService group_BuyService = new Group_BuyService();
//			List<Group_BuyVO> list = group_BuyService.joinGBIGetAllWhereMemID(mem_id);
//		
//			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("list", list);
//			RequestDispatcher successView = req.getRequestDispatcher("/frontend/groupBuy/mygroupbuyapplylist.jsp");
//			successView.forward(req, res);
			
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if ("transferT2GroupBuyOrder".equals(action)) { 
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取得會員編號
//			MemVO memVO = (MemVO) req.getSession().getAttribute("memVO");
//			Integer mem_id = memVO.getMem_id();

				Integer mem_id = null;
				try {
					mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
					if (mem_id == null) {
						errorMsgs.put("gbitem_id", "團購主會員編號': 請勿空白");
					}
				} catch (NumberFormatException e1) {
					errorMsgs.put("mem_id", "團購主會員編號請填數字.");
					e1.printStackTrace();
				}
				
				Integer gbitem_id = null;
				try {
					gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
					if (gbitem_id == null) {
						errorMsgs.put("gbitem_id", "團購商品編號': 請勿空白");
					}
				} catch (NumberFormatException e1) {
					errorMsgs.put("gbitem_id", "團購商品編號請填數字.");
					e1.printStackTrace();
				}
			
			/*************************** 2.開始修改資料 *****************************************/
				//查詢新增團購訂單所需要的欄位
			Group_BuyVO group_BuyVO = new Group_BuyVO();
			Group_BuyService group_BuyService = new Group_BuyService();
			List<Group_BuyVO> list = group_BuyService.getAllGroupBuyApplyListByMemID(mem_id);
			
			Group_Buy_ItemService group_Buy_ItemService = new Group_Buy_ItemService();
			Group_Buy_ItemVO group_Buy_ItemVO = group_Buy_ItemService.getOneGbi(gbitem_id);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("group_BuyVO", list);
			req.setAttribute("Group_Buy_ItemVO", group_Buy_ItemVO);
			req.setAttribute("action", "getOne_Discount_For_Display");
			
			//轉交團購訂單的Servlet
			RequestDispatcher successView = req.getRequestDispatcher("/backend/discount/DiscountServlet");
			successView.forward(req, res);
		}
		
	}

}
