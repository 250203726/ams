package com.util.enums.dic;

/**
 * 工程进度状态
 * @author Wymann
 * @Data 2014-12-31 上午10:31:41
 *
 */
public enum ProcessStateEnum {
	GDSD("1"),	//工单送达
	SBCG("2"),	//设备采购
	SJWT("3"),		//设计委托
	SJWB("4"),		//设计完毕
	SG("5"),		//施工
	JG("6"),		//竣工
	ZT("7"),		//暂停
	YS("8"),		//验收
	SD("9");		//送电
	
	private String value;
	private ProcessStateEnum(String value){
		this.value=value;
	}
	@Override
	public String toString(){
		return this.value;
	}
}
