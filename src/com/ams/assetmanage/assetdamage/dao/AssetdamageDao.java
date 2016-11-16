package com.ams.assetmanage.assetdamage.dao;

import java.util.List;

import com.ams.assetmanage.assetdamage.entity.Assetdamage;
import com.ams.assetmanage.assetdamage.model.AssetdamageModel;
import com.ams.assetmanage.maintenanceRecord.model.MaintenanceRecordModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 资产报损
 * 
 * @author 
 * @Data 
 * 
 */
public interface AssetdamageDao extends BaseDao<Assetdamage> {

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	List<AssetdamageModel> findByCondition(AssetdamageModel model, Pager page);

	/**
	 * 检查当前资产类别是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	List<Assetdamage> checkAssetdamage(String name, String id);

	/**
	 * 根据资产id获取资产报损model
	 * @param id
	 * @return
	 */
	AssetdamageModel getModel(String id);

}
