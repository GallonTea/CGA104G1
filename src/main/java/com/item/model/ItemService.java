package com.item.model;

import java.sql.Date;
import java.util.List;

import org.hibernate.Transaction;
import org.json.JSONArray;

import com.itemPhotos.model.ItemPhotosDAO11;
import com.itemPhotos.model.ItemPhotosVO;
import com.util.ServiceCommon;
import com.itemPhotos.model.ItemPhotosInterface;
import org.json.JSONObject;

public class ItemService implements ServiceCommon {
	private ItemDAO_interface itemDao;
	private ItemPhotosInterface itemPhotoDao;

	public ItemService() {
		itemDao = new ItemDAO();
		itemPhotoDao = new ItemPhotosDAO11();
	}

	public List<ItemVO> getAll() {
		try {
			beginTranscation();
			List<ItemVO> list = itemDao.getAll();
			commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}

	}

	public ItemVO addItem(String itemName, String itemContent, Integer itemPrice, Integer itemAmount,

			Date startDate, Date enddate, Integer itemStatus, Integer itemtId, List<byte[]> item_photo) {

		try {
			beginTranscation();
			ItemVO itemVO = new ItemVO();
			itemVO.setItemName(itemName);
			itemVO.setItemContent(itemContent);
			itemVO.setItemPrice(itemPrice);
			itemVO.setItemAmount(itemAmount);
			itemVO.setItemDate(startDate);
			itemVO.setItemEnddate(enddate);
			itemVO.setItemStatus(itemStatus);
			itemVO.setItemtId(itemtId);

			Integer item_id = itemDao.insert(itemVO);

			for (byte[] photo : item_photo) {

				ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
				itemPhotosVO.setItemId(item_id);
				itemPhotosVO.setIpPhoto(photo);
				itemPhotoDao.insert(itemPhotosVO);
			}
			commit();
			return itemVO;
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return null;

		}

	}

	public void update(String itemName, String itemContent, Integer itemPrice, Integer itemAmount, Date startDate,
			Date endDate, Integer itemStatus, Integer itemtType, List<byte[]> itemPhoto, Integer itemId) {
		try {
			beginTranscation();
			ItemVO itemVO = new ItemVO();
			itemVO.setItemName(itemName);
			itemVO.setItemContent(itemContent);
			itemVO.setItemPrice(itemPrice);
			itemVO.setItemAmount(itemAmount);
			itemVO.setItemDate(startDate);
			itemVO.setItemEnddate(endDate);
			itemVO.setItemStatus(itemStatus);
			itemVO.setItemtId(itemtType);
			itemVO.setItemId(itemId);

			itemDao.update(itemVO);

			if (itemPhoto.size() != 0) {
				for (byte[] photo : itemPhoto) {

					ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
					itemPhotosVO.setItemId(itemId);
					itemPhotosVO.setIpPhoto(photo);
					itemPhotoDao.insert(itemPhotosVO);
				}
			}
			commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
		}
	}

	public ItemVO getItem(Integer itemId) {
		try {
			beginTranscation();
			ItemVO itemVO=itemDao.findByPrimaryKey(itemId);
			commit();
			return itemVO;
			
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return null;
		}
		
	}

	public void deleteItem(Integer itemId) {
		try {
			beginTranscation();
			itemPhotoDao.delete(itemId);
			itemDao.delete(itemId);
			commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
		}
		

	}

//	index.html
	public JSONArray getAllJs(int pageNumber) {
		try {
			beginTranscation();
			JSONArray jsonArray=itemDao.getAllJS(pageNumber);
			commit();
			return jsonArray;
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return null;
		}
		
		
		
	}

	//listAllItems.html
	public JSONArray getAllList(){
		try {
			beginTranscation();
			JSONArray jsonArray=itemDao.getAllList();
			commit();
			return jsonArray;
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return null;
		}
	}

	public JSONObject getCount(){
		try {
			beginTranscation();
			JSONObject jsonObject=itemDao.getCount();
			commit();
			return jsonObject;
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return null;
		}
	}

}
