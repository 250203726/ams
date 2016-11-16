package com.ams.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ams.system.dao.MenuDao;
import com.ams.system.entity.Menu;
import com.core.dao.impl.BaseDaoImpl;

/**
 * 菜单管理
 * @author Wymann
 * @Data 2015-1-8 上午10:52:33
 *
 */
@Repository
public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao{

	/**
	 * 删除父亲节点下面的子节点
	 * @param id
	 * @return
	 */
	public int deleteByParentId(String id) {
		log.info("删除父亲节点id:"+id+"下面的子节点");
		try{
			String sql="delete from t_menu where parentId='"+id+"'";
			return getJdbcTemplate().update(sql);
		}catch(RuntimeException e){
			log.error("删除父亲节点id:"+id+"下面的子节点", e);
			throw e;
		}
	}

}
