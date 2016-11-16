package com.util.tag;

import java.util.List;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.util.enums.LanEnum;
import com.util.load.DictionaryTranslate;

/**
 * 自定义二级代码转化标签
 * @author Wymann
 * @Date 2013-10-17 上午09:55:32
 *
 */
public class CodeToNameTag extends BodyTagSupport{

	private static final long serialVersionUID = 611931038124776072L;
	
	private static final Logger log=Logger.getLogger(CodeToNameTag.class);
	
	//组名
	private String groupName;
	
	//待转换的值,多个值用","隔开
	private String value;
	
	//语言类型
	private String lan;
	
	//样式
	private String theClass;
	
	@Override
	public int doStartTag(){
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspTagException{
		if(log.isInfoEnabled()) log.info("正在执行二级代码转化标签操作...");
		try{
			
			if(!StringUtils.isEmpty(groupName)){
				String out="";
				if(StringUtils.isEmpty(lan)){
					lan=LanEnum.CH.toString();
				}
				List<String> list=DictionaryTranslate.getInstance().getListBySplitStr(groupName, value, lan);
				if(StringUtils.isNotEmpty(theClass)){
					theClass="class="+"'"+theClass+"'";
					if(null!=list && list.size()>0){
						for(String str: list){
							out+="<span "+theClass+">"+str+"<span>";
						}
					}else{
						out=value;
					}
				}else{
					if(null!=list && list.size()>0){
						for(int i=0;i<list.size();i++){
							out+=list.get(i);
							if(i!=list.size()-1){
								out+="，";
							}
						}
					}else{
						out=value;
					}
				}
				pageContext.getOut().print(out.trim());
			}
		}catch(Exception e){
			if (log.isInfoEnabled())
				log.error("根据<groupName=" + groupName + ",value="+value+">转化值出错，原因是："
						+ e.getMessage());
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	public void realese(){
		super.release();
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLan() {
		return lan;
	}

	public void setLan(String lan) {
		this.lan = lan;
	}

	public String getTheClass() {
		return theClass;
	}

	public void setTheClass(String theClass) {
		this.theClass = theClass;
	}
	
}
