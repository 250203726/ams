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
 * 自定义下拉选择框标签
 * @author Wymann
 * @Date 2013-10-12 下午03:10:23
 *
 */
public class SelectOptionTag extends BodyTagSupport{

	private static final long serialVersionUID = -2953711755509296511L;
	
	private static final Logger log=Logger.getLogger(SelectOptionTag.class);

	public SelectOptionTag() {
		super();
	}

	// 分组名 必须的
	private String groupName;

	// 需选中的值 不是必须的
	private String selectedValue;
	
	// 过滤表达式 ，> < >= <=,如expression=">"
	private String expression;
	
	//过滤条件-过滤的值,如filter="1"
	private String filter;
	
	//显示的语言,如lan="ch"
	private String lan;

	// 是否加上提示,如flag="flag"
	private String flag;

	// 在value和name之间加连接符,如link="--"
	private String link;


	@Override
	public int doStartTag() {
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspTagException {
		if(log.isInfoEnabled()) log.info("正在执行生成下拉框标签操作...");
		try{
			if(StringUtils.isNotEmpty(selectedValue)){
				if(selectedValue.endsWith(".0")){
					selectedValue=selectedValue.substring(0, selectedValue.lastIndexOf("."));
				}
			}
			//取出该组的所有数据
			if(!StringUtils.isEmpty(groupName)){
				List<Dictionary> dicList=new ArrayList<Dictionary>();
				dicList=DictionaryTranslate.getInstance().getListByFilter(groupName, expression, filter);
				//根据条件过滤
				if(!dicList.isEmpty()){
					//为下拉框加入默认提示
					if(null!=flag && flag.length()>0){
						pageContext.getOut().print("<option value=''>"+flag+"</option>");
					}
					String value="";
					String name="";
					String isSelected="";
					for(Dictionary dic: dicList){
						value=dic.getValue().toString();
						//显示语言类型
						name=StringUtils.isEmpty(lan) || LanEnum.CH.toString().equalsIgnoreCase(lan)?dic.getName():dic.getCode();
						//是否选中
						isSelected=!StringUtils.isEmpty(selectedValue) && value.equals(selectedValue)?"selected":"";
						pageContext.getOut().print("<option value='"+value+"'" + isSelected 
								+">"+name+"</option>");
					}
					if(log.isInfoEnabled()) log.info("成功生成！");
				}
			}
		
		}catch(Exception e){
			if (log.isInfoEnabled())
				log.error("根据<" + groupName + ">生成下拉框出错，原因是："
						+ e.getMessage());
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	@Override
	public void release() {
		super.release();
	}
	
	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getSelectedValue() {
		return selectedValue;
	}

	public void setSelectedValue(String selectedValue) {
		this.selectedValue = selectedValue;
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

	public String getLan() {
		return lan;
	}

	public void setLan(String lan) {
		this.lan = lan;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
}
