package com.ams.assetmanage.assetchange.service;

import java.util.List;

import com.ams.assetmanage.assetchange.entity.AssetChange;
import com.ams.assetmanage.assetchange.model.AssetChangeModel;
import com.util.page.Pager;

/**
 * 资产调拨业务层接口
 * @author simon
 * @date 2016年11月1日 上午10:58:40
 */
public interface AssetChangeService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	AssetChange save(AssetChange model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	AssetChange update(AssetChange model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找类
	 * @pAssetChanged
	 * @return
	 */
	AssetChange getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<AssetChangeModel> findByCondition(AssetChangeModel model, Pager page);
	
	/**
	 * 是否归还
	 * @author simon
	 * @date 2016年11月1日 下午10:00:14
	 * @param id
	 * @return
	 */
	boolean isBack(String id);
	
	/**
	 * 根据id查找Model
	 * @author simon
	 * @date 2016年11月2日 下午7:35:08
	 * @param Id
	 * @return
	 */
	AssetChangeModel getModelById(String id);

	

}
