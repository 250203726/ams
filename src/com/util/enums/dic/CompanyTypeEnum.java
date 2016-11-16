package com.util.enums.dic;

/**
 * 单位类型
 * @author Wymann
 * @Data 2015-1-12 下午03:21:51
 *
 */
public enum CompanyTypeEnum {
	FGS("1"),		//分公司
	NBDW("2"),		//内部单位
	WBDW("3"),		//外部单位
	SBGYS("4");		//设备供应商
	
	private String value;
	private CompanyTypeEnum(String value){
		this.value=value;
	}
	@Override
	public String toString(){
		return this.value;
	}
}
