package com.core.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import cfg.PropertyConst;

import com.core.dao.BaseDao;
import com.util.page.Pager;
import com.util.web.ResourceContext;


/**
 * DAOImpl父类
 * @version 1.0,2013-9-1
 * @author Wymann
 * @param <T> 实体模型
 */
public abstract class BaseDaoImpl<T> implements BaseDao<T>{		
	
	//oracel数据库驱动
	private String ORACLE_DRIVER="ORACLE";			
	
	//mysql数据库驱动
	private String MYSQL_DRIVER="MYSQL";	
	
	//SQLServer数据库驱动
	private String SQLSERVER_DRIVER="SQLSERVER";
	
	//创建hibernate操作数据库session
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;							
	
	//spring访问数据库
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	//实体
	protected Class<T> entity;
	
	//日志参数
	public Logger log=Logger.getLogger(BaseDaoImpl.class);	
	
	@SuppressWarnings("unchecked")
	public BaseDaoImpl(){
		this.entity=(Class<T>) ((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		this.log=Logger.getLogger(this.getClass());
	}

	/**
	 * 保存实体
	 * @param 实体
	 * @return model
	 */
	@Override
	public T save(T t) {
		log.info("saving "+entity.getSimpleName()+" instance! ");
		try {
			getSession().save(t);
			return t;
		} catch (RuntimeException e) {
			log.error("saving "+t.getClass().getSimpleName()+" fail! ", e);
			throw e;
		}
	}
	
	/**
	 * 修改实体
	 * @param model：实体模型
	 * @return
	 */
	@Override
	public void update(T t) {
		log.info("updating "+entity.getSimpleName()+" instance! ");
		try {
			getSession().update(t);
		} catch (RuntimeException e) {
			log.error("updating "+t.getClass().getSimpleName()+" fail! ",e);
			throw e;
		}
	}
	
	/**
	 * 删除实体
	 * @param t 
	 * @author Whymann 2014-5-3 下午12:55:25
	 */
	public void delete(T t){
		log.info("deleting "+entity.getSimpleName()+" instance! ");
		try {
			getSession().delete(t);
		} catch (RuntimeException e) {
			log.error("updating "+t.getClass().getSimpleName()+" fail! ",e);
			throw e;
		}
	}
	
	/**
	 * 通过 Id获取实体
	 * @param id：主键id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T get(String id) {
		log.info("getting "+entity.getSimpleName()+" instance by Id:"+id);
		try {
			T t=(T)getSession().get(this.entity, id);
			return t;
		} catch (RuntimeException e) {
			log.error("getting "+entity.getSimpleName()+" instance by Id:"+id+" fail! ", e);
			throw e;
		}
	}
	
	/**
	 * 通过 Id获取实体
	 * @param id：主键id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public T get(int id) {
		log.info("getting "+entity.getSimpleName()+" instance by Id:"+id);
		try {
			T t=(T)getSession().get(this.entity, id);
			return t;
		} catch (RuntimeException e) {
			log.error("getting "+entity.getSimpleName()+" instance by Id:"+id+" fail! ", e);
			throw e;
		}
	}
	
	/**
	 * 保存，更新缓存
	 * @param t
	 */
	
	public T saveCache(T t){
		log.info("saving "+entity.getSimpleName()+" instance! ");
		try {
			getSession().save(t);
			return t;
		} catch (RuntimeException e) {
			log.error("saving "+t.getClass().getSimpleName()+" fail! ", e);
			throw e;
		}
	}
	
	/**
	 * 封装Spring jdbc 查询结果映射为相应实体
	 * @param <T>,查询结果映射类
	 * @param sql，查询语句
	 * @param page，分页实体
	 * @param t，映射实体
	 * @return
	 */
	protected <T> List<T> jdbcQuery(String sql,Pager page,Class<T> t){
		if(null!=page){
			sql=getPageSql(sql, page);
		}
		return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<T>(t));
	}
	
	/**
	 * 获得分页操作
	 * @param querySQL
	 * @param pager
	 * @return
	 */
	protected String getPageSql(String query,Pager page){
		StringBuffer totalQuerySQL = new StringBuffer("select count(*) from (" + query + ") a ");
		int total = getJdbcTemplate().queryForInt(totalQuerySQL.toString());
		page.setTotal(total);
		
		//访问的当前页数大于总页数时，查询最后一页
		if(page.getPage()>page.getTotalPage() && page.getTotalPage()>=1){
			page.setPage(page.getTotalPage());
		}else if(page.getPage()<=0){
			page.setPage(1);
		}
		
		if(isOracle())
		{
			int first = (page.getPage() - 1) * page.getPageSize();
			int max = page.getPage() * page.getPageSize();
			if (max > total) max = total;

			StringBuffer queryPageSQL = new StringBuffer();
			queryPageSQL.append("select *                            ");
			queryPageSQL.append("  from (select a.*, rownum num      ");
			queryPageSQL.append("          from (" + query + ") a     ");
			queryPageSQL.append("         where rownum <= " + max + ")   ");
			queryPageSQL.append(" where num > " + first + "              ");
			
			return queryPageSQL.toString();			
		}
		else if(isMySQL())
		{
			int first = (page.getPage() - 1) * page.getPageSize();
			StringBuffer queryPageSQL = new StringBuffer();
			queryPageSQL.append(query+" limit "+first+","+page.getPageSize());
			return queryPageSQL.toString();	
		}
		else if(isSQLServer())
		{
			return null;
		}
		else{
			return null;
		}
	}
	
	/**
	 * 判断系统调用的是否为oracel驱动
	 * @return
	 */
	private boolean isOracle(){
		boolean flag=false;
		String type=ResourceContext.getInstance().getValue(PropertyConst.SQL_TYPE).trim();
		if(ORACLE_DRIVER.equals(type)){
			flag=true;
		}
		return flag;
	}
	
	/**
	 * 判断系统调用的是否为MySQL驱动
	 * @return
	 */
	private boolean isMySQL(){
		boolean flag=false;
		String type=ResourceContext.getInstance().getValue(PropertyConst.SQL_TYPE).trim();
		if(MYSQL_DRIVER.equals(type)){
			flag=true;
		}
		return flag;
	}
	
	/**
	 * 判断系统调用的是否为SQL Server驱动
	 * @return
	 */
	private boolean isSQLServer(){
		boolean flag=false;
		String type=ResourceContext.getInstance().getValue(PropertyConst.SQL_TYPE).trim();
		if(SQLSERVER_DRIVER.equals(type)){
			flag=true;
		}
		return flag;
	}
	
	/**
	 * 创建hibernate的session
	 * @return
	 */
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	protected JdbcTemplate getJdbcTemplate(){
		return jdbcTemplate;
	}
	
}
