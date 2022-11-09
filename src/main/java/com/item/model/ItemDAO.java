package com.item.model;

import java.util.Base64;
import java.util.List;
import java.util.Base64.Encoder;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonObject;

import netscape.javascript.JSObject;
import redis.clients.jedis.params.SetParams;

public class ItemDAO implements ItemDAO_interface {

    @Override
    public Integer insert(ItemVO itemVO) {
        getSesion().persist(itemVO);
        return itemVO.getItemId();
    }

    @Override
    public void update(ItemVO itemVO) {
        getSesion().merge(itemVO);
    }

    @Override
    public void delete(Integer itemId) {
        ItemVO itemVO = new ItemVO();
        itemVO.setItemId(itemId);
        getSesion().remove(itemVO);
    }

    @Override
    public ItemVO findByPrimaryKey(Integer itemId) {
        //SQL
        final String sql = "select * from ITEM where ITEM_ID = :item";                            //只回傳一筆
        ItemVO itemVO = getSesion().createNativeQuery(sql, ItemVO.class).setParameter("item", itemId).uniqueResult();
        return itemVO;

    }

    @Override
    public List<ItemVO> getAll() {
        //HQL
        return getSesion().createQuery("FROM ItemVO order by itemId", ItemVO.class).list();
    }

    @Override
    public JSONObject getCount(){
        String sql="select count(*) from item;";
        int count = ((Number)(getSesion().createNativeQuery(sql).uniqueResult())).intValue();
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("count",count);

        return jsonObject;
    }


    //listAllItems.html
    @Override
    public JSONArray getAllList(){
        JSONArray jsonArray = new JSONArray();
        List<ItemVO> list = getSesion().createQuery("FROM ItemVO order by itemId", ItemVO.class).list();
        for (ItemVO itemVO : list) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("itemId", itemVO.getItemId());
            jsonObject.put("itemtId", itemVO.getItemtId());
            jsonObject.put("itemName", itemVO.getItemName());
            jsonObject.put("itemContent", itemVO.getItemContent());
            jsonObject.put("itemPrice", itemVO.getItemPrice());
            jsonObject.put("itemAmount", itemVO.getItemAmount());
            jsonObject.put("itemStatus", itemVO.getItemStatus());
            jsonObject.put("itemDate", itemVO.getItemDate());
            jsonObject.put("itemEndDate", itemVO.getItemEnddate());
            Encoder encoder = Base64.getEncoder();

            if (itemVO.getPhotos().size() != 0) {

                String photo64 = encoder.encodeToString(itemVO.getPhotos().get(0).getIpPhoto());
                jsonObject.put("itemPhoto", photo64);
            }

            jsonArray.put(jsonObject);
        }
        return jsonArray;
    }

    //	index.html
    @Override
    public JSONArray getAllJS(int pageNumber) {
        JSONArray jsonArray = new JSONArray();
        List<ItemVO> list = getSesion().createQuery("FROM ItemVO order by itemId", ItemVO.class)
                .setFirstResult((pageNumber-1)*8)
                .setMaxResults(8)
                .list();
        for (ItemVO itemVO : list) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("itemId", itemVO.getItemId());
            jsonObject.put("itemtId", itemVO.getItemtId());
            jsonObject.put("itemName", itemVO.getItemName());
            jsonObject.put("itemContent", itemVO.getItemContent());
            jsonObject.put("itemPrice", itemVO.getItemPrice());
            jsonObject.put("itemAmount", itemVO.getItemAmount());
            jsonObject.put("itemStatus", itemVO.getItemStatus());
            jsonObject.put("itemDate", itemVO.getItemDate());
            jsonObject.put("itemEndDate", itemVO.getItemEnddate());
            Encoder encoder = Base64.getEncoder();

            if (itemVO.getPhotos().size() != 0) {

                String photo64 = encoder.encodeToString(itemVO.getPhotos().get(0).getIpPhoto());
                jsonObject.put("itemPhoto", photo64);
            }

            jsonArray.put(jsonObject);
        }
        return jsonArray;
    }

}
