package com.ams.assetmanage.assetchange.entity;

import java.sql.Timestamp;

/**
 * 资产调拨实体
 * @author simon
 * @date 2016年11月1日 上午10:44:23
 */
public class AssetChange {

	private String aciId;		//资产调拨编号，主键
	private String assetId;		//资产编号
	private String originalDepartment;		//原使用部门
	private String originalPrincipal;		//原使用人
	private String nowDepartment;
	private String nowPrincipal;			//现使用人
	private Timestamp changeTmie;			//现负责人
	private String assetStatus;				//调拨时间
	private String asseAttach;				//资产状态
	private String remark;					//备注
	public String getAciId() {
		return aciId;
	}
	public void setAciId(String aciId) {
		this.aciId = aciId;
	}
	public String getAssetId() {
		return assetId;
	}
	public void setAssetId(String assetId) {
		this.assetId = assetId;
	}
	public String getOriginalDepartment() {
		return originalDepartment;
	}
	public void setOriginalDepartment(String originalDepartment) {
		this.originalDepartment = originalDepartment;
	}
	public String getOriginalPrincipal() {
		return originalPrincipal;
	}
	public void setOriginalPrincipal(String originalPrincipal) {
		this.originalPrincipal = originalPrincipal;
	}
	public String getNowDepartment() {
		return nowDepartment;
	}
	public void setNowDepartment(String nowDepartment) {
		this.nowDepartment = nowDepartment;
	}
	public String getNowPrincipal() {
		return nowPrincipal;
	}
	public void setNowPrincipal(String nowPrincipal) {
		this.nowPrincipal = nowPrincipal;
	}
	public Timestamp getChangeTmie() {
		return changeTmie;
	}
	public void setChangeTmie(Timestamp changeTmie) {
		this.changeTmie = changeTmie;
	}
	public String getAssetStatus() {
		return assetStatus;
	}
	public void setAssetStatus(String assetStatus) {
		this.assetStatus = assetStatus;
	}
	public String getAsseAttach() {
		return asseAttach;
	}
	public void setAsseAttach(String asseAttach) {
		this.asseAttach = asseAttach;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
