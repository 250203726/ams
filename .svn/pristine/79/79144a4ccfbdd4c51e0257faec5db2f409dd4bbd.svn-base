package com.ams.assetmanage.assetcla.dao;

import java.util.List;

import com.ams.assetmanage.assetcla.entity.Assetcla;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 资产类别管理
 * 
 * @author 
 * @Data 
 * 
 */
public interface AssetclaDao extends BaseDao<Assetcla> {

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	List<Assetcla> findByCondition(Assetcla model, Pager page);

	/**
	 * 检查当前资产类别是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	List<Assetcla> checkAssetcla(String name, String id);

	/**
	 * 根据资产类别名获取资产类别信息
	 * 
	 * @param name
	 * @return
	 */
	Assetcla getByName(String name);

}
