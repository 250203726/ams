package com.ams.infomanage.unit.model;

/***
 * 单位model
 * @author simon
 * @date 2017年1月17日 下午2:53:09
 */
public class UnitModel {
	private String unitId; // 主键
	private String unitName; // 单位名称
	public String getUnitId() {
		return unitId;
	}
	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
}
