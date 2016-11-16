package com.ams.assetmanage.assetcla.service;

import java.util.List;

import com.ams.assetmanage.assetcla.entity.Assetcla;
import com.util.page.Pager;

/**
 * 资产类别管理
 * 
 * @author 
 * @Data 
 * 
 */
public interface AssetclaService {

	/**
	 * 保存资产类别
	 * 
	 * @param model
	 * @return
	 */
	Assetcla save(Assetcla model);

	/**
	 * 修改资产类别
	 * 
	 * @param model
	 * @return
	 */
	Assetcla update(Assetcla model);

	/**
	 * 删除资产类别信息
	 * 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找资产类别信息
	 * 
	 * @param id
	 * @return
	 */
	Assetcla getById(String id);

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	List<Assetcla> findByCondition(Assetcla model, Pager page);

	/**
	 * 检查资产类别是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkAssetcla(String name, String id);

	/**
	 * 根据资产类别名获取资产类别信息
	 * 
	 * @param name
	 * @return
	 */
	Assetcla getByName(String name);

}
