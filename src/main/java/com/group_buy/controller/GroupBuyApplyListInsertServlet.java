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
import com.discount.model.DiscountVO;
import com.group_buy.model.Group_BuyService;
import com.group_buy.model.Group_BuyVO;
import com.group_buy_item.model.Group_Buy_ItemService;
import com.group_buy_item.model.Group_Buy_ItemVO;
import com.mem.model.MemVO;
import com.news.controller.newsServlet;

@WebServlet("/GroupBuyApplyListInsertServlet")
public class GroupBuyApplyListInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupBuyApplyListInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		// 取得會員編號
//					MemVO memVO = (MemVO)req.getSession().getAttribute("memVO");
//					Integer mem_id = memVO.getMem_id();
					
					Integer mem_id = null;
					try {
						mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
						if (mem_id == null) {
							errorMsgs.put("gbitem_id","團購主會員編號': 請勿空白");
						}
					} catch (NumberFormatException e1) {
						errorMsgs.put("mem_id","團購主會員編號請填數字.");
						e1.printStackTrace();
					}
					
					Integer gbitem_id = null;
					try {
						gbitem_id = Integer.valueOf(req.getParameter("gbitem_id").trim());
						if (gbitem_id == null) {
							errorMsgs.put("gbitem_id","團購商品編號': 請勿空白");
						}
					} catch (NumberFormatException e1) {
						errorMsgs.put("gbitem_id","團購商品編號請填數字.");
						e1.printStackTrace();
					}
					
					Integer gb_min = null;

					try {
						gb_min = Integer.valueOf(req.getParameter("gb_min").trim());
						if (gb_min == null) {
							errorMsgs.put("gb_min","團購人數低標: 請勿空白");
						}
					} catch (NumberFormatException e) {
						errorMsgs.put("gb_min","團購人數低標請填數字");
						e.printStackTrace();
					}

					Integer gb_amount = null;

					try {
						gb_amount = Integer.valueOf(req.getParameter("gb_amount"));
						if (gb_amount == null) {
							errorMsgs.put("gb_amount","目前參團人數: 請勿空白");
						}
					} catch (NumberFormatException e) {
						errorMsgs.put("gb_amount","目前參團人數請填數字");
						e.printStackTrace();
					}
					
					java.sql.Timestamp gbstart_date = null;

					try {
						gbstart_date = java.sql.Timestamp.valueOf(req.getParameter("gbstart_date").trim());
					} catch (IllegalArgumentException e) {
						gbstart_date = new java.sql.Timestamp(System.currentTimeMillis());
						e.printStackTrace();
						errorMsgs.put("gbstart_date","團購開始請輸入日期!");
					}
					java.sql.Timestamp gbend_date = null;
					
					try {
						gbend_date = java.sql.Timestamp.valueOf(req.getParameter("gbend_date").trim());
					} catch (IllegalArgumentException e) {
						gbend_date = new java.sql.Timestamp(System.currentTimeMillis());
						e.printStackTrace();
						errorMsgs.put("gbend_date","團購結束請輸入日期!");
					}

					Integer gb_status = null;

					try {
						gb_status = Integer.valueOf(req.getParameter("gb_status"));
						if (gb_status == null) {
							errorMsgs.put("gb_status","團購狀態: 請勿空白");
						}
					} catch (NumberFormatException e) {
						errorMsgs.put("gb_status","團購狀態請填數字");
						e.printStackTrace();
					}
					
					Integer gb_price = null;
					
					try {
						gb_price = Integer.valueOf(req.getParameter("gb_price"));
						if (gb_price == null) {
							errorMsgs.put("gb_price","團購價格: 請勿空白");
						}
					} catch (NumberFormatException e) {
						errorMsgs.put("gb_price","團購價格請填數字");
						e.printStackTrace();
					}
					
					String gb_name = req.getParameter("gb_name");
					
//					String gbitemNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]$";
					if (gb_name == null || gb_name.trim().length() == 0) {
						errorMsgs.put("gb_name","團購名稱: 請勿空白");
					} 
					
					Group_BuyVO group_BuyVO = new Group_BuyVO();
					group_BuyVO.setMem_id(mem_id);
					group_BuyVO.setGbitem_id(gbitem_id);
					group_BuyVO.setGb_min(gb_min);
					group_BuyVO.setGb_amount(gb_amount);
					group_BuyVO.setGbstart_date(gbstart_date);
					group_BuyVO.setGbend_date(gbend_date);
					group_BuyVO.setGb_status(gb_status);
					group_BuyVO.setGb_price(gb_price);

					if (!errorMsgs.isEmpty()) {
						req.setAttribute("Group_BuyVO", group_BuyVO);
						RequestDispatcher failureView = req.getRequestDispatcher("/frontend/groupBuy/addgroupbuyapplylist.jsp");
						failureView.forward(req, res);
						return;
					}
					/*************************** 2.開始修改資料 *****************************************/
					Group_BuyService group_BuyService = new Group_BuyService();
					group_BuyVO = group_BuyService.addGroup_Buy(mem_id, gbitem_id, gb_min, gb_amount, gbstart_date, gbend_date, gb_status, gb_price, gb_name);
					group_BuyVO = group_BuyService.getLastGroup_Buy();
					//查詢該團購商品的所有值
					Group_Buy_ItemService group_Buy_ItemService = new Group_Buy_ItemService();
					Group_Buy_ItemVO group_Buy_ItemVO = new Group_Buy_ItemVO();
					group_Buy_ItemVO = group_Buy_ItemService.getOneGbi(gbitem_id);
					
					
					//查詢該團購商品能選擇的折扣價格
					DiscountService discountSvc = new DiscountService();
					List<DiscountVO> discountVO = discountSvc.getoneGbitem_id(gbitem_id);
					if (discountVO == null) {
						errorMsgs.put("gbitem_id", "沒有此商品的優惠資料");
					}
					
					/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
					
					session.setAttribute("DiscountVO", discountVO); // 資料庫取出的empVO物件,存入req
					session.setAttribute("gbitem_id", gbitem_id);
					
					
//					req.setAttribute("DiscountVO", discountVO);
					req.setAttribute("Group_BuyVO", group_BuyVO);
					req.setAttribute("Group_Buy_ItemVO", group_Buy_ItemVO);
//					String url = "/GroupBuyMasterApplyListServlet";
					String url = "/frontend/groupBuy/chosegroupbuydiscount.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
	}

}
