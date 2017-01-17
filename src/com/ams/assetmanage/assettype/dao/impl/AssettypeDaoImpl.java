package com.ams.assetmanage.assettype.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.assetmanage.assettype.dao.AssettypeDao;
import com.ams.assetmanage.assettype.entity.Assettype;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/***
 * 资产类型dao实现类
 * @author simon
 * @date 2017年1月17日 下午4:17:11
 */
@Repository
public class AssettypeDaoImpl extends BaseDaoImpl<Assettype> implements AssettypeDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Assettype> findByCondition(Assettype model, Pager page) {
		log.info("资产类型信息管理条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.assettypeId, ");
			sql.append("       a.assettypeName, ");
			sql.append("b.unitName as unitId ");
			sql.append("  from t_assettype a LEFT JOIN t_unit b ON a.unitId = b.unitId");
			sql.append(" where 1 = 1 ");
                        if(StringUtils.isNotEmpty(model.getAssettypeName())){
				sql.append("   and a.assettypeName like '%"+model.getAssettypeName()+"%' ");
			}
			           if(StringUtils.isNotEmpty(model.getUnitId())){
				sql.append("   and b.unitId = '"+model.getUnitId()+"' ");
			}
			
		    
			sql.append(" order by a.assettypeName asc, a.unitId asc");
			log.info(sql);
			return jdbcQuery(sql.toString(), page, Assettype.class);
		  }
		    catch(RuntimeException e){
			log.error("资产类型信息管理条件查询失败，请检查！", e);
			throw e;
		    }
	}
	

	/**
	 * 根据资产类型获取资产类型信息
	 * @param name
	 * @return
	 */
	public Assettype getByName(String name) {
		/*log.info("根据单位名称获取单位信息...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_company a ");
			sql.append(" where a.company_Name = '"+name+"' ");
			sql.append(" limit 1 ");
			List<Company> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Company>(Company.class));
			if(!list.isEmpty() && list.size()>0){
				return list.get(0);
			}
			return null;
		}catch (RuntimeException e) {
			log.error("根据单位名称获取单位信息失败，请检查！", e);
			throw e;
		}*/
		log.info("未定义函数功能");
		return null;
	}

	@Override
	public List<Assettype> checkAssettypeNam(String name, String id) {
		log.info("检查当前资产类型是否存在...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_assettype a ");
			sql.append(" where a.assettypeName = '"+name+"' ");
			if(StringUtils.isNotEmpty(id)){
				sql.append("   and a.assettypeId != '"+id+"' ");
			}
			sql.append(" limit 1 ");
			
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Assettype>(Assettype.class));
		}catch (RuntimeException e) {
			log.error("检查当前资产类型是否存在失败，请检查！", e);
			throw e;
		}
	}

}
