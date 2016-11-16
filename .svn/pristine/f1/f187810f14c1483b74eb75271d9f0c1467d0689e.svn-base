package com.ams.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.UrlfilterDao;
import com.ams.system.entity.Urlfilter;
import com.ams.system.model.UrlFilterModel;
import com.ams.system.service.UrlfilterService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * url过滤
 * @author Wymann
 * @Data 2015-1-5 下午12:34:48
 *
 */
@Service
public class UrlfilterServiceImpl implements UrlfilterService{
	
	@Resource
	private UrlfilterDao urlfilterDao;

	/**
	 * 保存
	 * @param url
	 * @return
	 */
	public Urlfilter save(Urlfilter url) {
		if(null!=url){
			url.setUrlId(IdGenerator.getInstance().getId());
			urlfilterDao.save(url);
		}
		return url;
	}

	/**
	 * 更新
	 * @param url
	 * @return
	 */
	public Urlfilter update(Urlfilter model) {
		if(null!=model && StringUtils.isNotEmpty(model.getUrlId())){
			Urlfilter url=urlfilterDao.get(model.getUrlId());
			if(null!=url){
				url.setAuthoritys(model.getAuthoritys());
				url.setDescription(model.getDescription());
				url.setFormtoken(model.getFormtoken());
				url.setName(model.getName());
				url.setParams(model.getParams());
				url.setPrivilegess(model.getPrivilegess());
				url.setPvtype(model.getPvtype());
				url.setReturnUrl(model.getReturnUrl());
				url.setRowFilter(model.getRowFilter());
				url.setUrl(model.getUrl());
				urlfilterDao.update(url);
			}
		}
		return model;
	}

	/**
	 * 删除
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Urlfilter url=urlfilterDao.get(id);
			if(null!=url){
				urlfilterDao.delete(url);
			}
		}
	}

	/**
	 * 根据id获取
	 * @param id
	 * @return
	 */
	public Urlfilter getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			return urlfilterDao.get(id);
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<UrlFilterModel> findByCondition(UrlFilterModel model, Pager page) {
		return urlfilterDao.findByCondition(model,page);
	}

	/**
	 * 检查url是否存在
	 * @param url
	 * @return
	 */
	public boolean checkUrl(String url,String id) {
		List<Urlfilter> list=urlfilterDao.checkUrl(url,id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
