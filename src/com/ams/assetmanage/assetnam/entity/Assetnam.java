package com.ams.assetmanage.assetnam.entity;

/**
 *  资产名称实体
 * @author 
 */
public class Assetnam {

	private String assetnameId;		//主键
	private String assetName;		//资产名称
	private String assetType;		//资产类别
	
	
	public String getassetnameId() {
		return assetnameId;
	}
	public void setassetnameId(String assetnameId) {
		this.assetnameId = assetnameId;
	}
	public String getassetName() {
		return assetName;
	}
	public void setassetName(String assetName) {
		this.assetName = assetName;
	}
	public String getassetType() {
		return assetType;
	}
	public void setassetType(String assetType) {
		this.assetType = assetType;
	}
}
