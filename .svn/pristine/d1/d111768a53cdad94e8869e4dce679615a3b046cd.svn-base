package com.ams.assetmanage.assettype.dao;

import java.util.List;
import com.ams.assetmanage.assettype.entity.Assettype;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 资产类型dao
 * @author simon
 * @date 2017年1月17日 下午4:14:30
 */
public interface AssettypeDao extends BaseDao<Assettype>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Assettype> findByCondition(Assettype model, Pager page);

	/**
	 * 检查当前资产类型信息是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Assettype> checkAssettypeNam(String name, String id);
	
	/**
	 * 根据名称获取资产类型信息
	 * @param name
	 * @return
	 */
	Assettype getByName(String name);

}
