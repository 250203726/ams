package com.util.load;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ams.system.entity.Auth;
import com.util.spring.SpringBeanLocator;

/**
 * 权限缓存
 * @author Wymann
 * @Data 2015-1-8 上午09:27:10
 *
 */
public class AuthTranslate {
	private static final Logger log = Logger.getLogger(AuthTranslate.class);
	
	private static final String BEAN_NAME = "jdbcTemplate";
	
	private static AuthTranslate translate ;
	
	
	// 缓存权限
	private static List<Auth> authList = new ArrayList<Auth>();
	
	//spring访问数据库
	private static JdbcTemplate jdbcTemplate; 
	
	private AuthTranslate(){
		this.clean();
		authList=findAll();
		if(authList != null){
			log.info("共加载权限："+authList.size());
		}
	}
	
	//单列
	public static AuthTranslate getInstance() {
		if(null == jdbcTemplate){
			jdbcTemplate=(JdbcTemplate)SpringBeanLocator.getBean(BEAN_NAME);
		}
		if(null == translate){
			translate = new AuthTranslate();
		}
		return translate;
	}
	
	//查找所有权限
	private List<Auth> findAll() {
		log.info("正在从数据库中获取全部的权限...");
		try{
			List<Auth> authList=new ArrayList<Auth>();
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*		");
			sql.append("  from t_auth a	");
			sql.append(" order by a.parentId asc,a.sortCode asc	");
			authList=jdbcTemplate.query(sql.toString(), new BeanPropertyRowMapper<Auth>(Auth.class));
			return authList;
		}catch(RuntimeException e){
			log.error("从数据库中获取全部的权限失败！",e);
			throw e;
		}
	}
	
	/**
	 * 获取所有
	 * @return
	 */
	public List<Auth> getAll(){
		return authList;
	}
	
	/**
	 * 根据权限,获取权限实体
	 * @param id
	 * @return
	 */
	public Auth getById(String id){
		if(StringUtils.isNotEmpty(id)){
			for (Auth a : authList) {
				if(id.equals(a.getAuthId())){
					return a;
				}
			}
		}
		return null;
	}
	
	/**
	 * 清除缓存中的权限
	 */
	public void clean(){
		if(log.isInfoEnabled()) log.info("正在清除缓存中的权限...");
		authList.clear();
		if(authList.size() == 0){
			if(log.isInfoEnabled()) log.info("清除缓存中的权限成功。");
		}else{
			if(log.isInfoEnabled()) log.info("清除缓存中的权限失败。");
		}
	}
	
	/**
	 * 刷新缓存中的权限
	 */
	public void refresh() {
		if(log.isInfoEnabled()) log.info("正在刷新缓存中的权限...");
		translate = new AuthTranslate();
		if(log.isInfoEnabled()) log.info("刷新缓存中的权限结束...");
	}
}
