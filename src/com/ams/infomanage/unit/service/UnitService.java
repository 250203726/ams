package com.ams.infomanage.unit.service;

import java.util.List;

import com.ams.infomanage.unit.entity.Unit;
import com.util.page.Pager;

/***
 * 单位service
 * @author simon
 * @date 2017年1月17日 下午2:53:59
 */
public interface UnitService {

	/**
	 * 保存单位
	 * 
	 * @param model
	 * @return
	 */
	Unit save(Unit model);

	/**
	 * 修改单位
	 * 
	 * @param model
	 * @return
	 */
	Unit update(Unit model);

	/**
	 * 删除单位
	 * 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找单位
	 * 
	 * @param id
	 * @return
	 */
	Unit getById(String id);

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	List<Unit> findByCondition(Unit model, Pager page);

	/**
	 * 检查单位是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkUnit(String name, String id);

	/**
	 * 根据单位名获取单位
	 * 
	 * @param name
	 * @return
	 */
	Unit getByName(String name);

}
