package com.itemType.model;

import java.util.List;

import com.item.model.ItemVO;

public class ItemTypeDAO implements ItemTypeDAOInterface {

	// 好像沒用到
	@Override
	public void insert(ItemTypeVO itemTypeVO) {
		getSesion().persist(itemTypeVO);
	}

	// 好像沒用到
	@Override
	public void update(ItemTypeVO itemTypeVO) {
		getSesion().merge(itemTypeVO);
	}

	// 好像沒用到
	@Override
	public void delete(Integer itemtId) {
		ItemTypeVO itemTypeVO = new ItemTypeVO();
		itemTypeVO.setItemtId(itemtId);
		getSesion().remove(itemTypeVO);
	}

	@Override
	public ItemTypeVO findByPrimaryKey(Integer itemtId) {
		return getSesion().get(ItemTypeVO.class, itemtId);
	}

	// 好像不會用到
	@Override
	public List<ItemTypeVO> getAll() {
		List<ItemTypeVO> list = getSesion().createQuery("From ItemTypeVO order by itemtId", ItemTypeVO.class).list();
		return list;
	}

}
