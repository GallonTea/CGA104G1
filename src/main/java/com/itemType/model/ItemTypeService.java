package com.itemType.model;

import java.util.List;



public class ItemTypeService {
	private ItemTypeDAOInterface itemTypeDao;

	public ItemTypeService() {
		itemTypeDao = new ItemTypeDAO1();
	}

	public List<ItemTypeVO> getAll() {
		return itemTypeDao.getAll();
	}

}
