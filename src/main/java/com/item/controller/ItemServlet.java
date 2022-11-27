package com.item.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.*;
import com.itemType.model.ItemTypeService;
import org.json.JSONArray;
import org.json.JSONObject;

import com.item.model.ItemService;
import com.item.model.ItemVO;
import com.itemPhotos.model.ItemPhotosService;
import com.itemPhotos.model.ItemPhotosVO;

//import net.coobird.thumbnailator.Thumbnails;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
@WebServlet("/item/items")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		if("GetCount".equals(action)){
			ItemService itemService=new ItemService();
			JSONObject jsonObject=itemService.getCount();
			Writer out=res.getWriter();
			out.write(jsonObject.toString());
		} else if ("GetAll_For_Display_JS".equals(action)) {

			Integer pageNumber=Integer.valueOf(req.getParameter("pageNumber"));
			ItemService itemService = new ItemService();
			JSONArray jsonArray=itemService.getAllJs(pageNumber);

			Writer out = res.getWriter();
			out.write(jsonArray.toString());
			//把拿到的jsonarray轉成json格式的字串
		}else if ("getOne_For_DisplayJS".equals(action)) {
			Integer item_id = Integer.valueOf(req.getParameter("itemId"));

			ItemService itemSvc = new ItemService();

			ItemVO itemVO = itemSvc.getItem(item_id);


			JSONObject item=new JSONObject();
			item.put("itemId", itemVO.getItemId());
			item.put("itemtId", itemVO.getItemtId());
			item.put("itemName", itemVO.getItemName());
			item.put("itemContent", itemVO.getItemContent());
			item.put("itemPrice", itemVO.getItemPrice());
			item.put("itemAmount", itemVO.getItemAmount());
			item.put("itemStatus", itemVO.getItemStatus());
			item.put("itemDate", itemVO.getItemDate());
			item.put("itemEnddate", itemVO.getItemEnddate());



			Writer out=res.getWriter();
			out.write(item.toString());




		}else if("getAllList".equals(action)){

			ItemService itemService = new ItemService();
			Writer out = res.getWriter();
			JSONArray jsonArray=itemService.getAllList();
			out.write(jsonArray.toString());
		}else if("GetAllPhotos".equals(action)) {

			ItemPhotosService itemPhotosService =new ItemPhotosService();
			Integer item_id = Integer.valueOf(req.getParameter("item_id"));
			JSONArray list=itemPhotosService.getAllPhoto(item_id);

			Writer out=res.getWriter();
			out.write(list.toString());
		}else if("search".equals(action)){

			String keyWords=req.getParameter("keyWords");
			Integer typeId=Integer.valueOf(req.getParameter("type"));

			ItemService itemService=new ItemService();
			JSONArray jsonArray=itemService.search(keyWords,typeId);

			Writer out=res.getWriter();
			out.write(jsonArray.toString());

		}else if("getFavList".equals(action)){
			String memId=req.getParameter("memId");
			ItemService itemService=new ItemService();
			String data=itemService.getFavList(memId);

			Writer out=res.getWriter();
			out.write(data);
		}else if("moveFavList".equals(action)){
			System.out.println("有執行！！！！！！！！！");
			String itemId = req.getParameter("id");
			// TODO ?????
			// String memId = (String) req.getSession().getAttribute("memId");
			String memId = "3";
			ItemService itemService=new ItemService();
			String result=itemService.removeTraceList(memId,itemId);

			Writer out=res.getWriter();
			out.write(result);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");

//		if ("insert".equals(action)) { // 來自additem.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//
//			String item_name = req.getParameter("item_name");
////			String itemnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)(\005B\005D)(\s)]{2,40}$";
//
//			String itemnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,40}$";
//			if (item_name == null || item_name.trim().length() == 0) {
//				errorMsgs.add("商品名稱: 請勿空白");
//			}
////				else if (!item_name.trim().matches(itemnameReg)) {  以下練習正則(規)表示式(regular-expression)
////				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
////			}
//
//			String item_content = req.getParameter("item_content").trim();
//			if (item_content == null || item_content.trim().length() == 0) {
//				errorMsgs.add("請輸入商品描述");
//			}
//			Integer item_price = null;
//			try {
//				item_price = Integer.valueOf(req.getParameter("item_price").trim());
//			} catch (NumberFormatException e) {
//				item_price = 0;
//				errorMsgs.add("商品價錢請填數字.");
//			}
//			Integer item_amoount = null;
//			try {
//				item_amoount = Integer.valueOf(req.getParameter("item_amount").trim());
//			} catch (NumberFormatException e) {
//				item_amoount = 0;
//				errorMsgs.add("商品庫存請填數字.");
//			}
//
//			java.sql.Date start_date = null;
//			try {
//				start_date = java.sql.Date.valueOf(req.getParameter("item_date").trim());
//			} catch (IllegalArgumentException e) {
//				start_date = new java.sql.Date(System.currentTimeMillis());
//				errorMsgs.add("請輸入上架日期!");
//			}
//			java.sql.Date end_date = null;
//			try {
//				end_date = java.sql.Date.valueOf(req.getParameter("item_enddate").trim());
//			} catch (IllegalArgumentException e) {
//				end_date = new java.sql.Date(System.currentTimeMillis());
//				errorMsgs.add("請輸入下架日期!");
//			}
//			Integer item_status = null;
//			try {
//				item_status = Integer.valueOf(req.getParameter("item_status").trim());
//			} catch (NumberFormatException e) {
//				item_status = 0;
//				errorMsgs.add("商品狀態請填數字.");
//			}
//
//			List<Part> parts = (List<Part>) req.getParts();
//			List<byte[]> photos = new ArrayList<>();
//
//			for (Part part : parts) {
//				String name = part.getName();
//				if ("item_photo".equals(name)) {
//					try (InputStream is = part.getInputStream();
//							BufferedInputStream bis = new BufferedInputStream(is)) {
//						byte[] photo = new byte[bis.available()];
//
//						bis.read(photo);
//						photos.add(photo);
//
//					} catch (IOException e) {
//						errorMsgs.add("請選擇商品圖片");
//					}
//				}
//
//			}
//
//			Integer itemt_type = Integer.valueOf(req.getParameter("itemtypeno").trim());
//
//			ItemVO itemVO = new ItemVO();
//			itemVO.setItemName(item_name);
//			itemVO.setItemContent(item_content);
//			itemVO.setItemPrice(item_price);
//			itemVO.setItemAmount(item_amoount);
//			itemVO.setItemDate(start_date);
//			itemVO.setItemEnddate(end_date);
//			itemVO.setItemStatus(item_status);
//			itemVO.setItemtId(itemt_type);
//
//			ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
//
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("itemVO", itemVO); // 含有輸入格式錯誤的empVO物件,也存入req
//				req.setAttribute("itemPhotosVO", itemPhotosVO);
//				RequestDispatcher failureView = req.getRequestDispatcher("/item/addItem.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//
//			/*************************** 2.開始新增資料 ***************************************/
//			ItemService itemSvc = new ItemService();
//			itemVO = itemSvc.addItem(item_name, item_content, item_price, item_amoount, start_date, end_date,
//					item_status, itemt_type, photos);
//
//			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//			req.setAttribute("itemList", itemSvc.getAll());
//			String url = "/item/listAllItems.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//			successView.forward(req, res);
//		}

		//jsp-update
//		if ("oneupdate".equals(action)) {
//
//			Integer item_id = Integer.valueOf(req.getParameter("oneactid"));
//
//			ItemService itemSvc = new ItemService();
//			ItemVO itemVO = itemSvc.getItem(item_id);
//			req.setAttribute("itemVO", itemVO);
//
//
//			String url = "/backend/item/updateItem.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);
//		}
		if ("update".equals(action)) {


			Gson gson = new Gson();
			gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			//ItemVO vo = gson.fromJson(req.getReader(), ItemVO.class);

			JsonObject json = gson.fromJson(req.getReader(), JsonObject.class);
			ItemVO vo = gson.fromJson(json.get("item"),ItemVO.class);
			String[] photo64=gson.fromJson(json.get("photo"),String[].class);

			List<byte[]> photo = new ArrayList<byte[]>();

			if(photo64.length!=0) {
				for(String image:photo64) {
					String base64Image = image.split(",")[1];
					byte[] transform = Base64.getDecoder().decode(base64Image);
					photo.add(transform);
				}
			}
//			System.out.println(vo.getItemDate());
			ItemService itemService=new ItemService();
			itemService.updateJS(vo);


			if (photo.size() != 0) {
				for (byte[] p : photo) {
					ItemPhotosService itemPhotosService=new ItemPhotosService();
					ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
					itemPhotosVO.setItemId(vo.getItemId());
					itemPhotosVO.setIpPhoto(p);
					itemPhotosService.insert(itemPhotosVO);
				}
			}







//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//			String item_name = req.getParameter("item_name");
//			String itemnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)(\u005B\u005D)(\s)]{2,40}$";

//			String itemnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,40}$";
//			if (item_name == null || item_name.trim().length() == 0) {
//				errorMsgs.add("商品名稱: 請勿空白");
//			}
//			else if (!item_name.trim().matches(itemnameReg)) { // 以下練習正則(規)表示式(regular-expression)
//				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//			}

//			String item_content = req.getParameter("item_content").trim();
//			if (item_content == null || item_content.trim().length() == 0) {
//				errorMsgs.add("請輸入商品描述");
//			}
//			Integer item_price = null;
//			try {
//				item_price = Integer.valueOf(req.getParameter("item_price").trim());
//			} catch (NumberFormatException e) {
//				item_price = 0;
//				errorMsgs.add("商品價錢請填數字.");
//			}
//			Integer item_amoount = null;
//			try {
//				item_amoount = Integer.valueOf(req.getParameter("item_amount").trim());
//			} catch (NumberFormatException e) {
//				item_amoount = 0;
//				errorMsgs.add("商品庫存請填數字.");
//			}
//
//			java.sql.Date start_date = null;
//			try {
//				start_date = java.sql.Date.valueOf(req.getParameter("item_date").trim());
//			} catch (IllegalArgumentException e) {
//				start_date = new java.sql.Date(System.currentTimeMillis());
//				errorMsgs.add("請輸入上架日期!");
//			}
//			java.sql.Date end_date = null;
//			try {
//				end_date = java.sql.Date.valueOf(req.getParameter("item_enddate").trim());
//			} catch (IllegalArgumentException e) {
//				end_date = new java.sql.Date(System.currentTimeMillis());
//				errorMsgs.add("請輸入下架日期!");
//			}
//			Integer item_status = null;
//			try {
//				item_status = Integer.valueOf(req.getParameter("item_status").trim());
//			} catch (NumberFormatException e) {
//				item_status = 0;
//				errorMsgs.add("商品狀態請填數字.");
//			}

//			Part part = req.getPart("item_photo");

//			List<Part> parts = (List<Part>) req.getParts();
//			List<byte[]> photos = new ArrayList<>();
//
//			for (Part part : parts) {
//				String filename = part.getSubmittedFileName();
//				if (filename != null && filename.length() != 0) {
//					try (InputStream is = part.getInputStream();
//							BufferedInputStream bis = new BufferedInputStream(is)) {
//						byte[] photo = new byte[bis.available()];
//						bis.read(photo);
//						photos.add(photo);
//					} catch (IOException e) {
//						errorMsgs.add("請選擇商品圖片");
//					}
//				}
//
//			}
//
//
//			Integer itemt_type = Integer.valueOf(req.getParameter("itemtypeno").trim());
//
//			ItemPhotosVO itemPhotosVO = new ItemPhotosVO();

			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("itemVO", itemVO); // 含有輸入格式錯誤的empVO物件,也存入req
//				req.setAttribute("itemPhotosVO", itemPhotosVO);
//				RequestDispatcher failureView = req.getRequestDispatcher("/item/updateItem.jsp");
//				failureView.forward(req, res);
//				return;
//			}

			/*************************** 2.開始新增資料 ***************************************/
//			ItemService itemSvc = new ItemService();
//			Integer item_id = Integer.valueOf(req.getParameter("item_id").trim());
//
//			itemSvc.update(item_name, item_content, item_price, item_amoount, start_date, end_date, item_status,
//					itemt_type, photos, item_id);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

//			String url = "/backend/item/listAllItems.html";
//			res.sendRedirect(url);

//			req.setAttribute("itemList", itemSvc.getAll());
//			RequestDispatcher successView = req.getRequestDispatcher(url); //
//			successView.forward(req, res);
		}
		if ("delete".equals(action)) {
			System.out.println("!!!!!!!");
			Gson gson=new Gson();
			JsonObject jsonObject=gson.fromJson(req.getReader(),JsonObject.class);

			Integer itemId=jsonObject.get("deleteId").getAsInt();

			System.out.println("itemId:"+itemId);
			ItemService itemSvc = new ItemService();
			itemSvc.deleteItem(itemId);

//			String url = "/item/listAllItems.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);
		}
		if ("getOne_For_Display".equals(action)) {
			Integer item_id = Integer.valueOf(req.getParameter("item_id"));
			ItemService itemSvc = new ItemService();
			ItemVO itemVO = itemSvc.getItem(item_id);
			 

			req.setAttribute("itemVO", itemVO);

			String url = "/item/listOneItem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

	if("GetAllPhotos".equals(action)) {

			ItemPhotosService itemPhotosService =new ItemPhotosService();
			Integer item_id = Integer.valueOf(req.getParameter("item_id"));
			JSONArray list=itemPhotosService.getAllPhoto(item_id);

			Writer out=res.getWriter();
			out.write(list.toString());
		}

	 if("insertItem".equals(action)){
		Gson gson = new Gson();
		gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		 JsonObject json = gson.fromJson(req.getReader(), JsonObject.class);
		 ItemVO vo = gson.fromJson(json.get("item"),ItemVO.class);
		 String[] photo64=gson.fromJson(json.get("photo"),String[].class);

		 List<byte[]> photo = new ArrayList<byte[]>();

		 if(photo64.length!=0) {
			 for(String image:photo64) {
				 String base64Image = image.split(",")[1];
				 byte[] transform = Base64.getDecoder().decode(base64Image);
				 photo.add(transform);
			 }
		 }

		 ItemService itemService=new ItemService();
		 Integer result=itemService.addItemJS(vo);


		 if (photo.size() != 0) {
			 for (byte[] p : photo) {
				 ItemPhotosService itemPhotosService=new ItemPhotosService();
				 ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
				 itemPhotosVO.setItemId(vo.getItemId());
				 itemPhotosVO.setIpPhoto(p);
				 itemPhotosService.insert(itemPhotosVO);
			 }
		 }

		 JSONObject resultObject=new JSONObject();
		 resultObject.put("successful",result>0? "true":"false");
		 Writer out=res.getWriter();
		 out.write(resultObject.toString());

		 //		ItemVO vo = gson.fromJson(req.getReader(), ItemVO.class);

//		ItemService itemService=new ItemService();
//		Integer result=itemService.addItemJS(vo);

//		JSONObject resultObject=new JSONObject();
//		resultObject.put("successful",result>0? "true":"false");
//		Writer out=res.getWriter();
//		out.write(resultObject.toString());



	} else if("trace".equals(action)){
		 Gson gson=new Gson();
		 JsonObject json = gson.fromJson(req.getReader(), JsonObject.class);

		 ItemService itemService =new ItemService();
		 itemService.insertFavList(json);



	 }


	}




}
