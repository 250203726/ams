package com.util.enums.dic;

/**
 * 是否虚拟合同
 * @author Wymann
 * @Data 2014-12-15 下午05:10:38
 *
 */
public enum VirtualEnum {
	FALSE("0"),	//否
	TRUE("1");	//是
	
	private String value;
	private VirtualEnum(String value){
		this.value=value;
	}
	@Override
	public String toString(){
		return this.value;
	}
}