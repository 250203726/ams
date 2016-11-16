package com.util.load;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ams.system.entity.Urlfilter;
import com.util.spring.SpringBeanLocator;

/**
 * 请求url
 * @author Wymann
 * @Data 2015-1-5 下午12:40:02
 *
 */
public class UrlFilterTranslate {
	private static final Logger log = Logger.getLogger(AuthTranslate.class);
	
	private static final String BEAN_NAME = "jdbcTemplate";
	
	private static UrlFilterTranslate translate ;
	
	
	// 缓存url
	private static List<Urlfilter> urlList = new ArrayList<Urlfilter>();
	
	//spring访问数据库
	private static JdbcTemplate jdbcTemplate; 
	
	private UrlFilterTranslate(){
		this.clean();
		urlList=findAll();
		if(urlList != null){
			log.info("共加载url："+urlList.size());
		}
	}
	
	//单列
	public static UrlFilterTranslate getInstance() {
		if(null == jdbcTemplate){
			jdbcTemplate=(JdbcTemplate)SpringBeanLocator.getBean(BEAN_NAME);
		}
		if(null == translate){
			translate = new UrlFilterTranslate();
		}
		return translate;
	}
	
	//查找所有url
	private List<Urlfilter> findAll() {
		log.info("正在从数据库中获取全部的url...");
		try{
			List<Urlfilter> urlList=new ArrayList<Urlfilter>();
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*				");
			sql.append("  from t_urlfilter a	");
			sql.append(" order by a.urlId asc		");
			urlList=jdbcTemplate.query(sql.toString(), new BeanPropertyRowMapper<Urlfilter>(Urlfilter.class));
			return urlList;
		}catch(RuntimeException e){
			log.error("从数据库中获取全部的url失败！",e);
			throw e;
		}
	}
	
	/**
	 * 获取所有
	 * @return
	 */
	public List<Urlfilter> getAll(){
		return urlList;
	}
	
	/**
	 * 根据url,获取url实体
	 * @param url
	 * @return
	 */
	public Urlfilter getByUrl(String url){
		if(StringUtils.isNotEmpty(url)){
			for (Urlfilter u : urlList) {
				if(url.equals(u.getUrl())){
					return u;
				}
			}
		}
		return null;
	}
	
	/**
	 * 清除缓存中的url
	 */
	public void clean(){
		if(log.isInfoEnabled()) log.info("正在清除缓存中的url...");
		urlList.clear();
		if(urlList.size() == 0){
			if(log.isInfoEnabled()) log.info("清除缓存中的url成功。");
		}else{
			if(log.isInfoEnabled()) log.info("清除缓存中的url失败。");
		}
	}
	
	/**
	 * 刷新缓存中的url
	 */
	public void refresh() {
		if(log.isInfoEnabled()) log.info("正在刷新缓存中的url...");
		translate = new UrlFilterTranslate();
		if(log.isInfoEnabled()) log.info("刷新缓存中的url结束...");
	}
}
