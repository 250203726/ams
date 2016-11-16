package com.ams.assetmanage.assetdamage.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.assetmanage.assetdamage.dao.AssetdamageDao;
import com.ams.assetmanage.assetdamage.entity.Assetdamage;
import com.ams.assetmanage.assetdamage.dao.AssetdamageDao;
import com.ams.assetmanage.assetdamage.model.AssetdamageModel;
import com.ams.assetmanage.maintenanceRecord.model.MaintenanceRecordModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 资产报损
 * 
 * @author 
 * @Data 
 * 
 */
@Repository
public class AssetdamageDaoImpl extends BaseDaoImpl<Assetdamage> implements AssetdamageDao {

	/**
	 * 资产报损条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	
   public List<AssetdamageModel> findByCondition(AssetdamageModel model, Pager page) {
		log.info("资产报损条件查询...");
		try{
			StringBuffer sql = new StringBuffer();
			sql.append(" select a.assetDamageID,c.assetName as assetId,a.assetDamageRemark,a.assetDamageReason,a.assetDamageOpinion,a.userId,a.appDate,a.lastOpinion");
       		sql.append(" from t_assetdamageinfo a LEFT JOIN t_assetinfo b ON a.assetId=b.assetId LEFT JOIN t_assetname c ON b.assetnameId=c.assetnameId");
       		sql.append(" where 1=1");
			if (StringUtils.isNotEmpty(model.getAssetDamageID())) {
				sql.append("   and a.assetDamageID = '"+ model.getAssetDamageID() + "' ");
			}
			if (StringUtils.isNotEmpty(model.getAssetId())) {
				sql.append("   and c.assetName = '" + model.getAssetId() + "' ");
			}
			
			if (StringUtils.isNotEmpty(model.getUserId())) {
				sql.append("   and a.userId = '" + model.getUserId() + "' ");
			}
			if (StringUtils.isNotEmpty(model.getAppDate())) {
				sql.append("   and a.appDate = '" + model.getAppDate() + "' ");
			}
			sql.append(" order by a.assetDamageID asc, a.assetId asc ");

			return jdbcQuery(sql.toString(), page, AssetdamageModel.class);
		} catch (RuntimeException e) {
			log.error("资产报损条件查询失败，请检查！", e);
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
   public List<Assetdamage> checkAssetdamage(String name, String id) {
		log.info("检查当前资产报损是否存在...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_assetdamageinfo a ");
			sql.append(" where a.assetDamageID = '" + name + "' ");
			if (StringUtils.isNotEmpty(id)) {
				sql.append("   and a.assetId != '" + id + "' ");
			}
			sql.append(" limit 1 ");

			return getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<Assetdamage>(Assetdamage.class));
		} catch (RuntimeException e) {
			log.error("检查当前资产报损是否存在失败，请检查！", e);
			throw e;
		}
	}


   /**
	 * 根据资产id获取资产报损model
	 */
	@Override
	public AssetdamageModel getModel(String id) {
		AssetdamageModel model = new AssetdamageModel();
		model.setAssetDamageID(id);
		List<AssetdamageModel> assetdamageModel = findByCondition(model, null);
		if(assetdamageModel.size()>0){
			return assetdamageModel.get(0);
		}
		return null;
	}
}
