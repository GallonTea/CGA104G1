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

import com.group_buy.model.Group_BuyService;
import com.group_buy.model.Group_BuyVO;
import com.mem.model.MemVO;

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

		Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);

		// 取得會員編號
//		MemVO memVO = (MemVO) req.getSession().getAttribute("memVO");
//		Integer mem_id = memVO.getMem_id();

		Integer mem_id = null;
		try {
			mem_id = Integer.valueOf(req.getParameter("mem_id").trim());
//			System.out.println(mem_id);
			if (mem_id == null) {
				errorMsgs.put("gbitem_id","團購主會員編號': 請勿空白");
			}
		} catch (NumberFormatException e1) {
			errorMsgs.put("mem_id","團購主會員編號請填數字.");
			e1.printStackTrace();
		}
		/*************************** 2.開始修改資料 *****************************************/

		Group_BuyService group_BuyService = new Group_BuyService();
		List<Group_BuyVO> list = group_BuyService.getAllGroupBuyApplyListByMemID(mem_id);
//		System.out.println(list);
		/*************************** 3.修改完成,準備轉交(Send the Success view) *************/

//					
		req.setAttribute("list", list);
//					
		RequestDispatcher successView = req.getRequestDispatcher("/frontend/groupBuy/mygroupbuyapplylist.jsp");
		successView.forward(req, res);

	}

}
