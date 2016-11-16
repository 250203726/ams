package com.ams.system.dao;

import com.ams.system.entity.Menu;
import com.core.dao.BaseDao;

/**
 * 菜单管理
 * @author Wymann
 * @Data 2015-1-8 上午10:52:06
 *
 */
public interface MenuDao extends BaseDao<Menu>{

	/**
	 * 
	 * @param id
	 */
	int deleteByParentId(String id);

}
