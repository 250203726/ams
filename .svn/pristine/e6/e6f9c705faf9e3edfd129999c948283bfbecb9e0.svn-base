package com.util.load;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ams.system.entity.Menu;
import com.util.enums.dic.StateEnum;
import com.util.spring.SpringBeanLocator;

/**
 * 菜单缓存
 * @author Wymann
 * @Data 2015-1-8 上午09:26:51
 *
 */
public class MenuTranslate {
	private static final Logger log = Logger.getLogger(MenuTranslate.class);
	
	private static final String BEAN_NAME = "jdbcTemplate";
	
	private static MenuTranslate translate ;
	
	
	// 缓存菜单
	private static List<Menu> menuList = new ArrayList<Menu>();
	
	//spring访问数据库
	private static JdbcTemplate jdbcTemplate; 
	
	private MenuTranslate(){
		this.clean();
		menuList=findAll();
		if(menuList != null){
			log.info("共加载菜单："+menuList.size());
		}
	}
	
	//单列
	public static MenuTranslate getInstance() {
		if(null == jdbcTemplate){
			jdbcTemplate=(JdbcTemplate)SpringBeanLocator.getBean(BEAN_NAME);
		}
		if(null == translate){
			translate = new MenuTranslate();
		}
		return translate;
	}
	
	//查找所有菜单
	private List<Menu> findAll() {
		log.info("正在从数据库中获取全部的菜单...");
		try{
			List<Menu> menuList=new ArrayList<Menu>();
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*				");
			sql.append("  from t_menu a	");
			sql.append(" order by a.parentId asc,a.sortCode asc ");
			menuList=jdbcTemplate.query(sql.toString(), new BeanPropertyRowMapper<Menu>(Menu.class));
			return menuList;
		}catch(RuntimeException e){
			log.error("从数据库中获取全部的菜单失败！",e);
			throw e;
		}
	}
	
	/**
	 * 获取所有
	 * @return
	 */
	public List<Menu> getAll(){
		return menuList;
	}
	
	/**
	 * 根据父级菜单，获取子集菜单
	 * @return
	 */
	public List<Menu> getByParentId(String parentId){
		List<Menu> list=new ArrayList<Menu>();
		for (Menu m : menuList) {
			if(parentId.equals(m.getMenuId())){
				list.add(m);
			}
		}
		return list;
	}
	
	/**
	 * 获取一级菜单
	 * @return
	 */
	public List<Menu> getParentMenus(){
		List<Menu> list=new ArrayList<Menu>();
		for (Menu m : menuList) {
			if("0".equals(m.getParentId()) && StateEnum.VALID.toString().equals(m.getEnable())){
				list.add(m);
			}
		}
		return list;
	}
	
	/**
	 * 获取所有子菜单
	 * @return
	 */
	public List<Menu> getSubMenus(){
		List<Menu> list=new ArrayList<Menu>();
		for (Menu m : menuList) {
			if(!"0".equals(m.getParentId()) && StateEnum.VALID.toString().equals(m.getEnable())){
				list.add(m);
			}
		}
		return list;
	}
	
	/**
	 * 根据菜单,获取菜单实体
	 * @param id
	 * @return
	 */
	public Menu getById(String id){
		if(StringUtils.isNotEmpty(id)){
			for (Menu m : menuList) {
				if(id.equals(m.getMenuId())){
					return m;
				}
			}
		}
		return null;
	}
	
	/**
	 * 清除缓存中的菜单
	 */
	public void clean(){
		if(log.isInfoEnabled()) log.info("正在清除缓存中的菜单...");
		menuList.clear();
		if(menuList.size() == 0){
			if(log.isInfoEnabled()) log.info("清除缓存中的菜单成功。");
		}else{
			if(log.isInfoEnabled()) log.info("清除缓存中的菜单失败。");
		}
	}
	
	/**
	 * 刷新缓存中的菜单
	 */
	public void refresh() {
		if(log.isInfoEnabled()) log.info("正在刷新缓存中的菜单...");
		translate = new MenuTranslate();
		if(log.isInfoEnabled()) log.info("刷新缓存中的菜单结束...");
	}
}
