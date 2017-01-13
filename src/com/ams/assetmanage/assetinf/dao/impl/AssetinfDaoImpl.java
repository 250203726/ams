package com.ams.assetmanage.assetinf.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.assetmanage.assetinf.dao.AssetinfDao;
import com.ams.assetmanage.assetinf.entity.Assetinf;
import com.ams.assetmanage.assetinf.model.AssetinfModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 资产管理
 * 
 * @author 
 * @Data 
 * 
 */
@Repository
public class AssetinfDaoImpl extends BaseDaoImpl<Assetinf> implements AssetinfDao {

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Assetinf> findByCondition(Assetinf model, Pager page) {
		log.info("资产管理条件查询...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from t_assetinfo a where 1=1");
			if (StringUtils.isNotEmpty(model.getassetId())) {
				sql.append("   and a.assetId like '%"+ model.getassetId() + "%' ");
			}
			if (StringUtils.isNotEmpty(model.getassetnameId())) {
				sql.append("   and a.assetnameId like '%" + model.getassetnameId() + "%' ");
			}
			sql.append(" order by a.assetnameId asc, a.assetId asc ");

			return jdbcQuery(sql.toString(), page, Assetinf.class);
		} catch (RuntimeException e) {
			log.error("资产管理条件查询失败，请检查！", e);
			throw e;
		}
	}
	
	/**
	 * 视图条件查询
	 */
	public List<AssetinfModel> findModelByCondition(AssetinfModel model,Pager page){
		log.info("资产管理条件查询...");
		try {
			StringBuffer sql = new StringBuffer();
			
			sql.append("select a.assetId,b.assetName as assetnameId,a.assetserialCode,a.assetBrand,a.assetinfoVersion,a.assetinfoPrice,a.assetinfoPic,a.assetStatus,a.agentPurchaser,a.userId,a.realName,a.assetmadeTime,a.assetinfoTime,a.StartUseTime,c.factoryName as assetfactoryId,d.supplierName as supplierId,e.projectName as projectId,f.maintenanceName as maintenanceId,a.instaLocation,a.UsedYears,a.LifeYears,a.Remark ");
			sql.append("from t_assetinfo a left join t_assetname b on a.assetnameId = b.assetnameId left join t_factory c on a.assetfactoryId=c.factoryId left join t_supplier d on a.supplierId=d.supplierId left join t_project e on a.projectId=e.projectId left join t_maintenanceinfo f on a.maintenanceId=f.maintenanceId where 1=1 ");
			if (StringUtils.isNotEmpty(model.getassetId())) {
				sql.append("   and a.assetId = '"+ model.getassetId() + "' ");
			}
			if(StringUtils.isNotEmpty(model.getassetnameId())){
				sql.append(" and a.assetnameId = '"+model.getassetnameId()+"' ");
			}
			
			sql.append(" order by a.assetId asc ,a.assetnameId asc");

			return jdbcQuery(sql.toString(), page, AssetinfModel.class);
		} catch (RuntimeException e) {
			log.error("资产管理条件查询失败，请检查！", e);
			throw e;
		}
		
	}

	/**
	 * 根据资产名称Id获取资产信息
	 * 
	 * @param Id
	 * @return
	 */
	public Assetinf getByName(String name) {
		log.info("根据单位名称Id获取资产信息...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_assetinfo a ");
//数据库查询语句
/*			
 *          sql.append(" where a.company_Name = '" + name + "' ");
			sql.append(" limit 1 ");
			List<Assetinf> list = getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<Assetinf>(Assetinf.class));
			if (!list.isEmpty() && list.size() > 0) {
				return list.get(0);
			}
*/
			return null;
		} catch (RuntimeException e) {
			log.error("根据资产名称Id获取资产信息失败，请检查！", e);
			throw e;
		}
	}

	@Override
	public List<Assetinf> checkAssetinf(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssetinfModel getModelById(String id) {
		AssetinfModel model=new AssetinfModel();
		model.setassetId(id);
		List<AssetinfModel> list=findModelByCondition(model, null);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

}
