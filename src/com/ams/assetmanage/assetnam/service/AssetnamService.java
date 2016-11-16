package com.ams.assetmanage.assetnam.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.assetmanage.assetnam.entity.Assetnam;
import com.ams.assetmanage.assetnam.model.AssetnamModel;
import com.util.page.Pager;

/**
 * 资产名称信息管理
 * @author 
 */
public interface AssetnamService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Assetnam save(Assetnam model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Assetnam update(Assetnam model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找资产名称信息
	 * @param id
	 * @return
	 */
	Assetnam getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Assetnam> findByCondition(Assetnam model, Pager page);
	
	/**
	 * 检查资产名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkAssetnam(String name, String id);
	
	/**
	 * 根据名称获取资产名称信息信息
	 * @param name
	 * @return
	 */
	Assetnam getByName(String name);

}
