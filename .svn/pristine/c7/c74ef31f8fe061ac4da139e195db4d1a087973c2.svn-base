package com.ams.infomanage.unit.dao;

import java.util.List;

import com.ams.infomanage.unit.entity.Unit;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/***
 * 单位dao
 * @author simon
 * @date 2017年1月17日 下午2:52:21
 */
public interface UnitDao extends BaseDao<Unit> {

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	List<Unit> findByCondition(Unit model, Pager page);

	/**
	 * 检查当前单位是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	List<Unit> checkUnit(String name, String id);

	/**
	 * 根据单位名获取单位
	 * 
	 * @param name
	 * @return
	 */
	Unit getByName(String name);

}
