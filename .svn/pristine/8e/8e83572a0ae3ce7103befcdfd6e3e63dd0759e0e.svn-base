package com.ams.system.dao;

import java.util.List;

import com.ams.system.entity.Urlfilter;
import com.ams.system.model.UrlFilterModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * url过滤
 * @author Wymann
 * @Data 2015-1-5 下午12:35:21
 *
 */
public interface UrlfilterDao extends BaseDao<Urlfilter>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<UrlFilterModel> findByCondition(UrlFilterModel model, Pager page);

	/**
	 * 检查url是否存在
	 * @param url
	 * @param id
	 * @return
	 */
	List<Urlfilter> checkUrl(String url, String id);

}
