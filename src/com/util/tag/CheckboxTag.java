package com.util.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.ams.system.entity.Dictionary;
import com.util.enums.LanEnum;
import com.util.load.DictionaryTranslate;

/**
 * 自定义复选框标签
 * @author Wymann
 * @Date 2013-10-14 下午01:20:12
 *
 */
public class CheckboxTag extends BodyTagSupport{

	private static final long serialVersionUID = 2030334426768403632L;
	
	private static final Logger log=Logger.getLogger(CheckboxTag.class);
	
	//样式
	private String theClass;
	
	//组名
	private String groupName;
	
	//name属性名
	private String name;
	
	//选择的值,多个值用','隔开
	private String selectedValue;
	
	//语种,如lan="ch"
	private String lan;
	
	//过滤表达式 ，> < >= <=,如expression=">"
	private String expression;
	
	//过滤条件-过滤的值,如filter='1'
	private String filter;
	
	//每组显示区间数,中间用","分割，如limit='3,5'
	private String limit;

	public CheckboxTag(){
		super();
	}
	
	@Override
	public int doStartTag(){
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspTagException{
		if(log.isInfoEnabled()) log.info("正在执行生成复选框标签操作...");
		try{
			//取出该组的所有数据
			if(!StringUtils.isEmpty(groupName)){
				List<Dictionary> dicList=new ArrayList<Dictionary>();
				dicList=DictionaryTranslate.getInstance().getListByFilter(groupName, expression, filter);
				if(!dicList.isEmpty()){
					if(!StringUtils.isEmpty(limit) && limit.indexOf(",")>0){
						List<Dictionary> curList=new ArrayList<Dictionary>();
						String[] str =limit.split(",");
						for(int i=Integer.valueOf(str[0]);i<dicList.size();i++){
							curList.add(dicList.get(i));
							if(i==Integer.valueOf(str[1])){
								break;
							}
						}
						dicList=curList;
					}
					String displayName="";	//显示的名称
					String checked="";		//是否勾选
					//添加样式
					theClass=StringUtils.isEmpty(theClass)?"":" class='"+theClass+"'";
					for(Dictionary dic:dicList){
						//是否选中某值
						checked=StringUtils.isNotEmpty(selectedValue) && selectedValue.indexOf(dic.getValue().toString())>=0?"checked='checked'":"";
						displayName=StringUtils.isEmpty(lan) || LanEnum.CH.toString().equalsIgnoreCase(lan)?dic.getName():dic.getCode();
						pageContext.getOut().println("<input type='checkbox' id='"+name+"_"+dic.getValue()
								+"' name='"+name+"' value='"+dic.getValue()+"' "+theClass+" "+checked+"/>");
						pageContext.getOut().println("<span>"+displayName+"</span>");
					}
					if(log.isInfoEnabled()) log.info("成功生成！");
				}
			}
		}catch(Exception e){
			if (log.isInfoEnabled())
				log.error("根据<groupName=" + groupName + ">生成复选框失败，原因是："
						+ e.getMessage());
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	@Override
	public void release(){
		super.release();
	}
	
	public String getTheClass() {
		return theClass;
	}

	public void setTheClass(String theClass) {
		this.theClass = theClass;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSelectedValue() {
		return selectedValue;
	}

	public void setSelectedValue(String selectedValue) {
		this.selectedValue = selectedValue;
	}

	public String getLan() {
		return lan;
	}

	public void setLan(String lan) {
		this.lan = lan;
	}

	public String getExpression() {
		return expression;
	}

	public void setExpression(String expression) {
		this.expression = expression;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public static Logger getLog() {
		return log;
	}
	
}
