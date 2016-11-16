package com.ams.assetmanage.maintenanceRecord.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;



import com.ams.assetmanage.maintenanceRecord.dao.MaintenanceRecordDao;
import com.ams.assetmanage.maintenanceRecord.entity.MaintenanceRecord;
import com.ams.assetmanage.maintenanceRecord.model.MaintenanceRecordModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 资产维护记录dao实现类
 * @author JackH
 *
 */
@Repository
public class MaintenanceRecordDaoImpl extends BaseDaoImpl<MaintenanceRecord> implements MaintenanceRecordDao{

	/**
	 * 条件查询
	 */
	@Override
	public List<MaintenanceRecordModel> findByCondition(MaintenanceRecordModel model,
			Pager page) {
		log.info("资产维护记录条件查询...");
//		try{
//			StringBuffer sql = new StringBuffer();
//			sql.append("select * from t_maintenancerecord a where 1=1");
//			if (StringUtils.isNotEmpty(model.getMaintenancerecordId())) {
//				sql.append("   and a.maintenancerecordId like '%"+ model.getMaintenancerecordId() + "%' ");
//			}
//			if (StringUtils.isNotEmpty(model.getAssetId())) {
//				sql.append("   and a.assetId like '%" + model.getAssetId() + "%' ");
//			}
		
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.maintenancerecordId,c.assetName as assetId,a.recordPeople,a.recordInfo,a.repairTime,a.repairExstatus,a.repairContent,a.repairAftstatus,a.acceptancePerson,a.recordTime,a.AcceptanceEvaluation ");
			sql.append("FROM t_maintenancerecord a LEFT JOIN t_assetinfo b ON a.assetId = b.assetId LEFT JOIN t_assetname c ON c.assetnameId = b.assetnameId");
			sql.append(" where 1 = 1 ");
			//资产维护编号
			if (StringUtils.isNotEmpty(model.getMaintenancerecordId())) {
				sql.append("   and a.maintenancerecordId = '"+ model.getMaintenancerecordId() + "' ");
			}
			//将资产编号替换成资产名称
			if(StringUtils.isNotEmpty(model.getAssetId())){
				sql.append("   and c.assetName = '"+model.getAssetId()+"' ");
			}
			
			sql.append(" order by a.maintenancerecordId asc ");
			return jdbcQuery(sql.toString(), page, MaintenanceRecordModel.class);
		}catch(RuntimeException e){
			log.error("资产维护记录条件查询失败，请检查！", e);
			throw e;
		}
	}


	/**
	 * 根据资产id获取维护记录model
	 */
	@Override
	public MaintenanceRecordModel getModel(String id) {
		MaintenanceRecordModel model = new MaintenanceRecordModel();
		model.setMaintenancerecordId(id);
		List<MaintenanceRecordModel> maintenanceRecordModel = findByCondition(model, null);
		if(maintenanceRecordModel.size()>0){
			return maintenanceRecordModel.get(0);
		}
		return null;
	}


	/**
	 * 检查当前资产维护记录是否存在
	 */
	@Override
	public List<MaintenanceRecord> checkMaintenanceRecord(String name, String id) {
		log.info("检查当前资产维护记录是否存在...");
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_maintenancerecord a ");
			sql.append(" where a.maintenancerecordId = '" + name + "' ");
			if (StringUtils.isNotEmpty(id)) {
				sql.append("   and a.assetId != '" + id + "' ");
			}
			sql.append(" limit 1 ");

			return getJdbcTemplate().query(sql.toString(),
					new BeanPropertyRowMapper<MaintenanceRecord>(MaintenanceRecord.class));
		} catch (RuntimeException e) {
			log.error("检查当前资产维护是否存在失败，请检查！", e);
			throw e;
		}
		
	}

	
	
}
