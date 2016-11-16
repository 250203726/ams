package com.ams.system.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.system.dao.CodeDao;
import com.ams.system.entity.Code;
import com.ams.system.model.CodeModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;
import com.util.string.StringUtil;

/**
 * 合同简码管理
 * @author Wymann
 * @Date 2014-6-11 下午08:24:50
 *
 */
@Repository
public class CodeDaoImpl extends BaseDaoImpl<Code> implements CodeDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return 
	 * @author Whymann 2014-6-11 下午08:36:39
	 */
	public List<CodeModel> findByCondition(CodeModel model, Pager page) {
		log.info("条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*		");
			sql.append("  from t_code a	");
			sql.append(" where 1 = 1	");
			if(StringUtils.isNotEmpty(model.getCode())){
				sql.append("   and a.code = '"+model.getCode()+"'	");
			}
			if(StringUtils.isNotEmpty(model.getCodeName())){
				sql.append("   and a.codeName like '%"+StringUtil.filter(model.getCodeName())+"%'");
			}
			if(StringUtils.isNotEmpty(model.getModelType())){
				sql.append("   and a.modelType = '"+model.getModelType()+"'");
			}
			if(StringUtils.isNotEmpty(model.getCodeType())){
				sql.append("   and a.codeType = '"+model.getCodeType()+"'");
			}
			sql.append(" order by a.sort asc");
			
			String query=sql.toString();
			if(null!=page){
				query=getPageSql(query, page);
			}
			return getJdbcTemplate().query(query, new BeanPropertyRowMapper<CodeModel>(CodeModel.class));
		}catch(RuntimeException e){
			log.error("条件查询失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据模块分类，查找合同编号简码
	 * @param moduleType
	 * @param contractType
	 * @return 
	 * @author Whymann 2014-6-12 下午01:49:43
	 */
	public List<Code> getCode(String moduleType) {
		log.info("根据模块分类，和合同类型，查找合同编号简码...");
		try{
			String sql="select a.* from t_code a where a.modelType='"+moduleType+"' ";
			return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Code>(Code.class));
		}catch(RuntimeException e){
			log.error("根据模块分类，和合同类型，查找合同编号简码失败，请检查！", e);
			throw e;
		}
	}

}
