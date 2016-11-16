package com.ams.assetmanage.assetchange.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.assetmanage.assetchange.dao.AssetChangeDao;
import com.ams.assetmanage.assetchange.entity.AssetChange;
import com.ams.assetmanage.assetchange.model.AssetChangeModel;
import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.depart.dao.DepartDao;
import com.ams.infomanage.depart.entity.Depart;
import com.ams.infomanage.depart.model.DepartModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 资产调拨DAO实现类
 * @author simon
 * @date 2016年11月1日 下午8:49:45
 */
@Repository
public class AssetChangeDaoImpl extends BaseDaoImpl<AssetChange> implements AssetChangeDao{

	/**
	 * 资产调拨条件查询，查询条件有资产编号、原使用部门、原负责人、先使用部门、先负责人、资产状态
	 * @author simon
	 * @return 返回的是视图
	 */
	public List<AssetChangeModel> findByCondition(AssetChangeModel model, Pager page) {
		log.info("资产调拨条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.aciId,a.asseAttach,a.changeTmie,a.Remark,g.assetName as assetId,b.departName as originalDepartment,d.userName as originalPrincipal,c.departName as nowDepartment,e.userName as nowPrincipal,a.assetStatus ");
			sql.append("from t_assetchangeinfo a LEFT JOIN t_depart b on a.originalDepartment=b.departId LEFT JOIN t_depart c ON a.nowDepartment=c.departId LEFT JOIN t_user d ON a.originalPrincipal=d.user_Id left join t_user e ON a.nowPrincipal=e.user_Id ");
			sql.append("left join t_assetinfo f ON a.assetId=f.assetId left join t_assetname g ON f.assetnameId =g.assetnameId");
			sql.append(" where 1 = 1 ");			
			if(StringUtils.isNotEmpty(model.getAssetId())){
				sql.append("   and g.assetName = '"+model.getAssetId()+"' ");
			}//资产编号
			if(StringUtils.isNotEmpty(model.getOriginalDepartment())){
				sql.append("   and b.departName = '"+model.getOriginalDepartment()+"' ");
			}//原使用部门
			if(StringUtils.isNotEmpty(model.getOriginalPrincipal())){
				sql.append("   and d.userName = '"+model.getOriginalPrincipal()+"' ");
			}//原负责人
			if(StringUtils.isNotEmpty(model.getNowDepartment())){
				sql.append("   and c.departName = '"+model.getNowDepartment()+"' ");
			}//现使用部门
			if(StringUtils.isNotEmpty(model.getNowPrincipal())){
				sql.append("   and e.userName = '"+model.getNowPrincipal()+"' ");
			}//现负责人
			if(StringUtils.isNotEmpty(model.getAssetStatus())){
				sql.append("   and a.assetStatus = '"+model.getAssetStatus()+"' ");
			}//资产状态
			sql.append(" order by a.assetId asc, a.assetStatus asc");
			log.info(sql);
			return jdbcQuery(sql.toString(), page, AssetChangeModel.class);
		}catch(RuntimeException e){
			log.error("资产调拨条件查询失败，请检查！", e);
			throw e;
		}
	}


	@Override
	public AssetChangeModel getModel(String id) {
		AssetChangeModel model=new AssetChangeModel();
		model.setAciId(id);
		List<AssetChangeModel> assetChangeModels=findByCondition(model, null);
		if(assetChangeModels.size()>0){
			return assetChangeModels.get(0);
		}
		return null;
	}

}
