package com.ams.system.service;

import java.util.List;

import com.ams.system.entity.Urlfilter;
import com.ams.system.model.UrlFilterModel;
import com.util.page.Pager;

/**
 * url过滤
 * @author Wymann
 * @Data 2015-1-5 下午12:34:19
 *
 */
public interface UrlfilterService{

	Urlfilter save(Urlfilter url);

	Urlfilter update(Urlfilter url);

	void delete(String id);

	Urlfilter getById(String id);

	List<UrlFilterModel> findByCondition(UrlFilterModel model, Pager page);

	boolean checkUrl(String url,String id);

}
