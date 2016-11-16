package com.ams.infomanage.depart.dao;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.depart.entity.Depart;
import com.ams.infomanage.depart.model.DepartModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 单位管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:59
 *
 */
public interface DepartDao extends BaseDao<Depart>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Depart> findByCondition(Depart model, Pager page);

	/**
	 * 检查当前单位是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Depart> checkDepart(String name, String id);
	
	/**
	 * 根据名称获取单位信息
	 * @param name
	 * @return
	 */
	Depart getByName(String name);

}
