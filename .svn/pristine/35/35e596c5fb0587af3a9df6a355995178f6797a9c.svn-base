package com.util.load;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ams.system.entity.Dictionary;
import com.util.enums.LanEnum;
import com.util.expression.Operator;
import com.util.spring.SpringBeanLocator;

/**
 * 系统字典表初始化
 * @author Wymann
 * @Date 2013-10-12 上午09:56:40
 *
 */
public class DictionaryTranslate {
	
	private static final Logger log = Logger.getLogger(DictionaryTranslate.class);
	
	private static final String BEAN_NAME = "jdbcTemplate";
	
	private static DictionaryTranslate translate ;
	
	// 缓存字典表的数据
	private static Map<String, List<Dictionary>> dicMap = new HashMap<String, List<Dictionary>>();
	
	//spring访问数据库
	private static JdbcTemplate jdbcTemplate; 
	
	private DictionaryTranslate(){
		this.clean();
		dicMap=findAll();
		if(dicMap != null){
			int i=0;
			for(String key: dicMap.keySet()){
				i++;
				System.out.println("[第"+i+"组]："+key+"->"+dicMap.get(key).get(0).getGroupTranslate());
			}
			log.info("共加载字典分组："+dicMap.size());
		}
	}
	
	//单列
	public static DictionaryTranslate getInstance() {
		if(null == jdbcTemplate){
			jdbcTemplate=(JdbcTemplate)SpringBeanLocator.getBean(BEAN_NAME);
		}
		if(null == translate){
			translate = new DictionaryTranslate();
		}
		return translate;
	}
	
	//查找所有字典表数据
	private Map<String,List<Dictionary>> findAll() {
		log.info("正在从数据库中获取全部的字典数据...");
		try{
			List<Dictionary> dicList=new ArrayList<Dictionary>();
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*							");
			sql.append("  from t_dictionary a						");
			sql.append(" order by a.Groupname asc, a.SortCode asc	");
			dicList=jdbcTemplate.query(sql.toString(), new BeanPropertyRowMapper<Dictionary>(Dictionary.class));
			//按组名重新封装字典表数据
			if(dicList != null && dicList.size() > 0)
			{
				String groupName="";
				for(Dictionary dic : dicList)
				{
					groupName = dic.getGroupname();
					if(dicMap.containsKey(groupName)){
						List<Dictionary> currList = dicMap.get(groupName);
						currList.add(dic);
					}else{
						List<Dictionary> currList=new ArrayList<Dictionary>();
						currList.add(dic);
						dicMap.put(groupName, currList);
					}				
				}
			}
			return dicMap;
		}catch(RuntimeException e){
			log.error("从数据库中获取全部的字典数据失败！",e);
			throw e;
		}
	}

	/**
	 * 查找所有组名
	 * @return
	 * @author Whymann 2014-1-21 下午02:58:21
	 */
	public Map<String,String> getGroup(){
		Map<String,String> map=new HashMap<String, String>();
		for(String key: dicMap.keySet()){
			if(map.containsKey(key)){
				continue;
			}else{
				if(null!=dicMap.get(key) && dicMap.get(key).size()>0){
					map.put(key, dicMap.get(key).get(0).getGroupTranslate());
				}
			}
		}
		return map;
	}
	
	/**
	 * 根据分组名称(groupName)从缓存字典中获取数据
	 * @param groupName:组名
	 * @return
	 */
	public List<Dictionary> getListByGroupName(String groupName){
		List<Dictionary> dicList = new ArrayList<Dictionary>();
		if(!StringUtils.isEmpty(groupName)){
			if(dicMap.containsKey(groupName)){
				dicList = dicMap.get(groupName);
			}else{
				if (log.isInfoEnabled()) log.info("根据<groupName="+groupName+">没有找到合适的字典项，请检查groupName是否正确。");
			}
		}
		return dicList;
	}
	
	
	/**
	 * 根据组名和值获取一条字典数据
	 * @param groupName：组名
	 * @param value：值
	 * @return
	 */
	public Dictionary getDic(String groupName,String value){
		Dictionary dictionary=null;
		if(!StringUtils.isEmpty(groupName)){
			List<Dictionary> dicList = this.getListByGroupName(groupName);
			if(!StringUtils.isEmpty(value)){
				for(Dictionary dic: dicList){
					if(value.equals(dic.getValue().toString())){
						dictionary=dic;
						break;
					}
				}
			}
			else{
				if(log.isInfoEnabled()) log.info("根据<groupName="+groupName+",value="+value+">没有找到合适的字典项，请检查value是否正确。");
			}
		}
		return dictionary;
	}
	
	/**
	 * 根据组名和名称获取一条字典数据
	 * @param groupName
	 * @param name
	 * @return
	 */
	public Dictionary getDicByName(String groupName,String name){
		Dictionary dictionary=null;
		if(!StringUtils.isEmpty(groupName)){
			List<Dictionary> dicList = this.getListByGroupName(groupName);
			if(!StringUtils.isEmpty(name)){
				for(Dictionary dic: dicList){
					if(name.equals(dic.getName())){
						dictionary=dic;
						break;
					}
				}
			}
			else{
				if(log.isInfoEnabled()) log.info("根据<groupName="+groupName+",name="+name+">没有找到合适的字典项，请检查name是否正确。");
			}
		}
		return dictionary;
	}
	
	/**
	 * 根据组名和简码获取一条字典数据
	 * @param groupName
	 * @param name
	 * @return
	 */
	public Dictionary getDicByCode(String groupName,String code){
		Dictionary dictionary=null;
		if(!StringUtils.isEmpty(groupName)){
			List<Dictionary> dicList = this.getListByGroupName(groupName);
			if(!StringUtils.isEmpty(code)){
				for(Dictionary dic: dicList){
					if(code.equals(dic.getCode())){
						dictionary=dic;
						break;
					}
				}
			}
			else{
				if(log.isInfoEnabled()) log.info("根据<groupName="+groupName+",code="+code+">没有找到合适的字典项，请检查name是否正确。");
			}
		}
		return dictionary;
	}
	
	/**
	 * 根据分组名称(groupName)，过滤条件(filter)从缓存字典中获取数据
	 * @param groupName:组名
	 * @param expression：过滤条件，如>,<,>=,<=,=(注：等号可以多值),!=
	 * @param filter:被过滤的值
	 * @return
	 */
	public List<Dictionary> getListByFilter(String groupName,String expression,String filter){
		List<Dictionary> dicList = this.getListByGroupName(groupName);
		
		if(!StringUtils.isEmpty(expression) && !StringUtils.isEmpty(filter)){
			
			String opr = expression.trim();
			String[] values = filter.trim().split(",");
			List<Dictionary> filterList = new ArrayList<Dictionary>();
			if(dicList != null && dicList.size() > 0)
			{
				int iFilter = 0;
				for(Dictionary dic : dicList)
				{
					if(!StringUtils.isEmpty(dic.getFilter())) 
					{
						iFilter = Integer.parseInt(dic.getFilter());
						if(opr.equals(Operator.GREATER_EQUAL)){
							if(values.length==1 && iFilter >= Integer.parseInt(values[0])) filterList.add(dic);
						}else if(opr.equals(Operator.LESS_EQUAL)){
							if(values.length==1 && iFilter <= Integer.parseInt(values[0])) filterList.add(dic);
						}else if(opr.equals(Operator.UNEQUAL)){
							if(iFilter != Integer.parseInt(values[0])) filterList.add(dic);
						}else if(opr.equals(Operator.GREATER)){
							if(values.length==1 && iFilter > Integer.parseInt(values[0])) filterList.add(dic);
						}else if(opr.equals(Operator.LESS)){
							if(values.length==1 && iFilter < Integer.parseInt(values[0])) filterList.add(dic);
						}else if(opr.equals(Operator.EQUAL)){
							for(int i=0;i<values.length;i++){
								if(iFilter == Integer.parseInt(values[i])) filterList.add(dic);
							}
						}
					}
				}
				return filterList;
			}
		}else{
			if(log.isInfoEnabled()) log.info("根据<groupName="+groupName+",expression="+expression+",filter="+filter+">没有找到合适的字典项，请检查expression,filter是否正确。");
		}
		return dicList;
	}
	
	/**
	 * 根据一组分割的字符获取字典表Name
	 * @param groupName
	 * @param splitStr
	 * @param lan: 返回语言种类
	 * @return
	 * @author Whymann 2013-12-8 上午11:29:16
	 */
	public List<String> getListBySplitStr(String groupName,String splitStr,String lan){
		List<String> list=new ArrayList<String>();
		List<Dictionary> DicList=this.getListByGroupName(groupName);
		if(StringUtils.isNotEmpty(splitStr)){
			if(LanEnum.CH.toString().equalsIgnoreCase(lan)){
				for(Dictionary dic: DicList){
					if(splitStr.indexOf(dic.getValue())>=0){
							list.add(dic.getName());
					}
				}
			}else if(LanEnum.EN.toString().equalsIgnoreCase(lan)){
				for(Dictionary dic: DicList){
					if(splitStr.indexOf(dic.getValue())>=0){
							list.add(dic.getCode());
					}
				}
			}
		}else{
			if(log.isInfoEnabled()) log.info("查找的分割字符串为空，请检查！");
		}
		return list;
	}
	
	/**
	 * 清除缓存中的字典表数据
	 */
	public void clean(){
		if(log.isInfoEnabled()) log.info("正在清除缓存中的字典表数据...");
		dicMap.clear();
		if(dicMap.size() == 0){
			if(log.isInfoEnabled()) log.info("清除缓存中的字典表数据成功。");
		}else{
			if(log.isInfoEnabled()) log.info("清除缓存中的字典表数据失败。");
		}
	}
	
	/**
	 * 刷新缓存中的字典表数据
	 */
	public static void refresh() {
		if(log.isInfoEnabled()) log.info("正在刷新缓存中的字典表数据...");
		translate = new DictionaryTranslate();
		if(log.isInfoEnabled()) log.info("刷新缓存中的字典表数据结束...");
	}

}
