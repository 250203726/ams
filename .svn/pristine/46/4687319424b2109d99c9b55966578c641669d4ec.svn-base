package com.ams.assetmanage.assettype.service;

import java.util.List;

import com.ams.assetmanage.assettype.entity.Assettype;
import com.util.page.Pager;

/**
 * 资产类型信息管理
 * @author 
 */
public interface AssettypeService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Assettype save(Assettype model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Assettype update(Assettype model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找资产类型信息
	 * @param id
	 * @return
	 */
	Assettype getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Assettype> findByCondition(Assettype model, Pager page);
	
	/**
	 * 检查资产名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkAssettypeName(String name, String id);
	
	/**
	 * 根据类型获取资产类型信息信息
	 * @param name
	 * @return
	 */
	Assettype getByName(String name);

}
