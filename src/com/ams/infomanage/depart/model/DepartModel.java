package com.ams.infomanage.depart.model;

/**
 * 部门的视图实体
 * @author simon
 */
public class DepartModel {

	private String departId;		//主键
	private String departName;		//部门名称
	private String departAdd;		//部门地址
	private String departOwner;		//部门负责人
	
	public String getDepartId() {
		return departId;
	}
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	public String getDepartName() {
		return departName;
	}
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	public String getDepartAdd() {
		return departAdd;
	}
	public void setDepartAdd(String departAdd) {
		this.departAdd = departAdd;
	}
	public String getDepartOwner() {
		return departOwner;
	}
	public void setDepartOwner(String departOwner) {
		this.departOwner = departOwner;
	}

	

}
