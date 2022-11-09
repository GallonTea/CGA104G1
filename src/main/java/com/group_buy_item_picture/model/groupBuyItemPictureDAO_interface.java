package com.group_buy_item_picture.model;

import java.util.List;


public interface groupBuyItemPictureDAO_interface {
	public void insert(groupBuyItemPictureVO groupBuyItemPictureVO);

	public void update(groupBuyItemPictureVO groupBuyItemPictureVO);

	public void delete(Integer gbip_id);

	public groupBuyItemPictureVO findByPrimaryKey(Integer gbip_id);

	public List<groupBuyItemPictureVO> getAll();
}
