package com.ams.assetmanage.assetdamage.service;

import java.util.List;

import com.ams.assetmanage.assetdamage.entity.Assetdamage;
import com.ams.assetmanage.assetdamage.model.AssetdamageModel;
import com.util.page.Pager;

/**
 * 资产报损service层接口
 * 
 * @author 
 * 
 */
public interface AssetdamageService {

	/**
	 * 保存资产报损
	 * 
	 * @param model
	 * @return
	 */
	Assetdamage save(Assetdamage model);

	/**
	 * 修改资产报损
	 * 
	 * @param model
	 * @return
	 */
	Assetdamage update(Assetdamage model);

	/**
	 * 删除资产报损信息
	 * 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找资产报损类
	 * 
	 * @param id
	 * @return
	 */
	Assetdamage getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<AssetdamageModel> findByCondition(AssetdamageModel model, Pager page);

	/**
	 * 检查资产报损是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkAssetdamage(String name, String id);

	/**
	 * 根据id查找model
	 * 
	 * @param name
	 * @return
	 */
	AssetdamageModel getModelById(String id);

}
