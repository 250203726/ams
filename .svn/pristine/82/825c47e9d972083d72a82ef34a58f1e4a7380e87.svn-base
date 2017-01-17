package com.ams.infomanage.unit.dao.impl;

import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import com.ams.infomanage.unit.dao.UnitDao;
import com.ams.infomanage.unit.entity.Unit;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;
/***
 * 单位dao实现类
 * @author simon
 * @date 2017年1月17日 下午2:57:40
 */
@Repository
public class UnitDaoImpl extends BaseDaoImpl<Unit> implements UnitDao {

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
  
   public List<Unit> findByCondition(Unit model, Pager page) {
		log.info("单位管理条件查询...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.unitId, ");
			sql.append("       a.unitName  ");
			sql.append("  from t_unit a ");
			sql.append(" where 1 = 1 ");
			if (StringUtils.isNotEmpty(model.getUnitName())) {
				sql.append("   and a.unitName like '%"
						+ model.getUnitName() + "%' ");
			}
			sql.append(" order by a.unitName asc ");

			return jdbcQuery(sql.toString(), page, Unit.class);
		} catch (RuntimeException e) {
			log.error("单位管理条件查询失败，请检查！", e);
			throw e;
		}
	}

	
	/**
	 * 检查当前单位是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
   @Override
   public List<Unit> checkUnit(String name, String id) {
		log.info("检查当前单位是否存在...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_unit a ");
			sql.append(" where a.unitName = '" + name + "' ");
			if (StringUtils.isNotEmpty(id)) {
				sql.append("   and a.unitId != '" + id + "' ");
			}
			sql.append(" limit 1 ");

			return getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<Unit>(Unit.class));
		} catch (RuntimeException e) {
			log.error("检查当前单位是否存在失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据单位名称获取单位信息
	 * 
	 * @param name
	 * @return
	 */
	public Unit getByName(String name) {
		log.info("根据单位名称获取单位信息...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_unit a ");
			sql.append(" where a.unitName = '" + name + "' ");
			sql.append(" limit 1 ");
			List<Unit> list = getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<Unit>(Unit.class));
			if (!list.isEmpty() && list.size() > 0) {
				return list.get(0);
			}
			return null;
		} catch (RuntimeException e) {
			log.error("根据单位名称获取单位信息失败，请检查！", e);
			throw e;
		}
	}

}
