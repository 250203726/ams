package com.ams.system.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.ams.system.dao.UrlfilterDao;
import com.ams.system.entity.Urlfilter;
import com.ams.system.model.UrlFilterModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * url过滤
 * @author Wymann
 * @Data 2015-1-5 下午12:35:38
 *
 */
@Repository
public class UrlfilterDaoImpl extends BaseDaoImpl<Urlfilter> implements UrlfilterDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<UrlFilterModel> findByCondition(UrlFilterModel model, Pager page) {
		log.info("条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append(" select a.* from t_urlfilter a");
			sql.append(" 	where 1=1 ");
			if(StringUtils.isNotEmpty(model.getName())){
				sql.append(" and a.name like '%"+model.getName()+"%'");
			}
			if(StringUtils.isNotEmpty(model.getFormtoken())){
				sql.append(" and a.formtoken ='"+model.getFormtoken()+"'");
			}
			if(StringUtils.isNotEmpty(model.getPrivilegess())){
				sql.append(" and a.privilegess='"+model.getPrivilegess()+"'");
			}
			if(StringUtils.isNotEmpty(model.getPvtype())){
				sql.append(" and a.pvtype='"+model.getPvtype()+"'");
			}
			if(StringUtils.isNotEmpty(model.getRowFilter())){
				sql.append(" and a.rowFilter='"+model.getRowFilter()+"'");
			}
			sql.append(" order by a.urlId asc");
			
			return jdbcQuery(sql.toString(), page, UrlFilterModel.class);
		}catch (RuntimeException e) {
			log.error("条件查询失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 检查url是否存在
	 * @param url
	 * @param id
	 * @return
	 */
	public List<Urlfilter> checkUrl(String url, String id) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select a.* from t_urlfilter a");
		sql.append(" 	where a.url='"+url+"'");
		if(StringUtils.isNotEmpty(id)){
			sql.append(" and a.urlId!='"+id+"'");
		}
		return jdbcQuery(sql.toString(), null, Urlfilter.class);
	}

}
