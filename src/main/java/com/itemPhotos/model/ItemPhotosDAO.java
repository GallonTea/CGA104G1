package com.itemPhotos.model;

import java.util.List;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonObject;
import com.util.HibernateUtil;

public class ItemPhotosDAO implements ItemPhotosInterface {

	@Override
	public void insert(ItemPhotosVO itemPhotosVO) {
		getSesion().persist(itemPhotosVO);
	}

	@Override
	public void update(ItemPhotosVO itemPhotosVO) {
		getSesion().merge(itemPhotosVO);

	}

	@Override
	public void delete(Integer itemId) {
		ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
		itemPhotosVO.setItemId(itemId);
		getSesion().remove(itemPhotosVO);
	}

	@Override
	public ItemPhotosVO findByPrimaryKey(Integer ipId) {

		return getSesion().get(ItemPhotosVO.class, ipId);
	}

	@Override
	public JSONArray getAllPhoto(Integer itemId) {
		JSONArray jsonArray = new JSONArray();
		List<ItemPhotosVO> list = getSesion().createQuery("FROM ItemPhotosVO order by ip_id").list();
		for (ItemPhotosVO itemPhotosVO : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("ipId", itemPhotosVO.getIpId());
			jsonObject.put("itemId", itemPhotosVO.getItemId());
			jsonObject.put("ipPhoto", itemPhotosVO.getIpPhoto());
			jsonArray.put(jsonObject);
		}
		return jsonArray;
	}

	@Override
	public List<ItemPhotosVO> getPhoto(Integer itemId) {
		return getSesion().createQuery("From ItemPhotosVO where itemId in (:itemId)", ItemPhotosVO.class).setParameter("itemId", itemId).list();
	}

//	@Override
//	public String getPhotoJson(Integer itemId) {
//	
//	}

	@Override
	public int deletePhoto(Integer ipId) {
		try {
			ItemPhotosVO itemPhotosVO=new ItemPhotosVO();
			itemPhotosVO.setIpId(ipId);
			getSesion().remove(itemPhotosVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	
		
	}

	
//	public static void main(String[] args) {
//	Session session = HibernateUtil.getSessionFactory().openSession();
//	List<ItemPhotosVO> list = session.createQuery("From ItemPhotosVO where itemId in (:itemId)", ItemPhotosVO.class).setParameter("itemId", 1).list();
//	for(ItemPhotosVO vo : list ) {
//		System.out.println(vo.getIpPhoto());
//	}
//	session.close();
//	}
	
	
	
}
