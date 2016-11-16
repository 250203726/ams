package com.ams.assetmanage.assetcla.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.assetmanage.assetcla.dao.AssetclaDao;
import com.ams.assetmanage.assetcla.entity.Assetcla;
import com.ams.company.dao.CompanyDao;
import com.ams.company.model.CompanyModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 资产类别管理
 * 
 * @author 
 * @Data 
 * 
 */
@Repository
public class AssetclaDaoImpl extends BaseDaoImpl<Assetcla> implements AssetclaDao {

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
  
   public List<Assetcla> findByCondition(Assetcla model, Pager page) {
		log.info("资产类别管理条件查询...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.assettypeid, ");
			sql.append("       a.assettypename  ");
			sql.append("  from t_assettype a ");
			sql.append(" where 1 = 1 ");
			if (StringUtils.isNotEmpty(model.getassettypename())) {
				sql.append("   and a.assettypename like '%"
						+ model.getassettypename() + "%' ");
			}
			sql.append(" order by a.assettypename asc ");

			return jdbcQuery(sql.toString(), page, Assetcla.class);
		} catch (RuntimeException e) {
			log.error("资产类别管理条件查询失败，请检查！", e);
			throw e;
		}
	}

	
	/**
	 * 检查当前资产类别是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
   @Override
   public List<Assetcla> checkAssetcla(String name, String id) {
		log.info("检查当前资产类别是否存在...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_assettype a ");
			sql.append(" where a.assettypename = '" + name + "' ");
			if (StringUtils.isNotEmpty(id)) {
				sql.append("   and a.assettypeid != '" + id + "' ");
			}
			sql.append(" limit 1 ");

			return getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<Assetcla>(Assetcla.class));
		} catch (RuntimeException e) {
			log.error("检查当前资产类别是否存在失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据资产类别名称获取资产类别信息
	 * 
	 * @param name
	 * @return
	 */
	public Assetcla getByName(String name) {
		log.info("根据资产类别名称获取资产类别信息...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_assettype a ");
			sql.append(" where a.assettypename = '" + name + "' ");
			sql.append(" limit 1 ");
			List<Assetcla> list = getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<Assetcla>(Assetcla.class));
			if (!list.isEmpty() && list.size() > 0) {
				return list.get(0);
			}
			return null;
		} catch (RuntimeException e) {
			log.error("根据资产类别名称获取资产类别信息失败，请检查！", e);
			throw e;
		}
	}

}
