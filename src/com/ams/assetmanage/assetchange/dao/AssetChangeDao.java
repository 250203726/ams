package com.ams.assetmanage.assetchange.dao;

import java.util.List;

import com.ams.assetmanage.assetchange.entity.AssetChange;
import com.ams.assetmanage.assetchange.model.AssetChangeModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * AssetChangeDAO
 * @author simon
 * @date 2016年11月1日 上午10:42:56
 */
public interface AssetChangeDao extends BaseDao<AssetChange>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<AssetChangeModel> findByCondition(AssetChangeModel model, Pager page);

	/**
	 * 通过ID找model
	 * @author simon
	 * @date 2016年11月2日 下午7:38:20
	 * @param id
	 * @return
	 */
	AssetChangeModel getModel(String id);

}
