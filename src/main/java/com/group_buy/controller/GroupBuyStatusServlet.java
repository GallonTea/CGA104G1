package com.group_buy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group_buy.model.Group_BuyService;
import com.group_buy.model.Group_BuyVO;

@WebServlet("/GroupBuyStatusServlet")
public class GroupBuyStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Timer timer;   
    public GroupBuyStatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		
//		    ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);  
//		    long oneDay = 24 * 60 * 60 * 1000;  
//		    long initDelay  = getTimeMillis("20:00:00") - System.currentTimeMillis();  
//		    initDelay = initDelay > 0 ? initDelay : oneDay + initDelay;  
//		  
//		    executor.scheduleAtFixedRate(new EchoServer(),initDelay,oneDay,TimeUnit.MILLISECONDS);  
		
		
		
	}

//	private long getTimeMillis(String string) {
//		return 0;
//	}

	// 初始化時建立 timer 並放置於實體變數
			public void init() {
				
				timer = new Timer();
				// 設定何時開始
				Calendar cal = new GregorianCalendar(2022, Calendar.NOVEMBER, 26, 0, 0, 0);

				
				// 查詢團購狀態等於0的(團購尚未開始)，且團購開始時間大於現在時間(為了要設定為gb_status = 1)
		        TimerTask getAllInProgress = new TimerTask() {

					@Override
					public void run() {
						List<Group_BuyVO> list = new ArrayList<>();
						Group_BuyService group_BuyService = new Group_BuyService();
						
						// 取得大於三十分鐘沒結帳的list
						list = group_BuyService.getAll2InProgress();
						
						for (Group_BuyVO Group_BuyVO : list) {
							// 將競標商品狀態改為狀態 3 棄標
//							bidProductSvc.updateBidState(new Integer(3), bidProductVO.getBidProductNo());
							group_BuyService.updateGroup_Buy_GBStatus(Group_BuyVO.getGb_id(), 1);
						}
					}
		        	
		        };
		        
		        
		      //查詢團購狀態等於1的(團購進行中)，而且現在時間>=團購結束時間(為了要更改狀態為團購關閉OR結束)
		        TimerTask getAll2End = new TimerTask() {

					@Override
					public void run() {
						List<Group_BuyVO> list = new ArrayList<>();
						Group_BuyService group_BuyService = new Group_BuyService();
						
						// 取得大於三十分鐘沒結帳的list
						list = group_BuyService.getAll2End();
						
						for (Group_BuyVO Group_BuyVO : list) {
							// 將競標商品狀態改為狀態 3 棄標
							if(Group_BuyVO.getGb_min() <= Group_BuyVO.getGb_amount()) {
								group_BuyService.updateGroup_Buy_GBStatus(Group_BuyVO.getGb_id(), 3);
							}else if(Group_BuyVO.getGb_min() > Group_BuyVO.getGb_amount()) {
								group_BuyService.updateGroup_Buy_GBStatus(Group_BuyVO.getGb_id(), 8);
							};
						}
					}
		        	
		        };

		        timer.scheduleAtFixedRate(getAllInProgress, cal.getTime(), 600000); 
				timer.scheduleAtFixedRate(getAll2End, cal.getTime(), 600000);
			}
		        
		        

			@Override
			public void destroy() {
				timer.cancel();
			}
	
	
	
}
