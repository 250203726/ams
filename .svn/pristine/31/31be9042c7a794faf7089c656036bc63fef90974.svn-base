package com.util.excel;

/**
 * excel列信息
 *
 * @createTime: 2012-4-19 下午12:03:49
 * @version: 0.1
 * @lastVersion: 0.1
 * @updateTime: 
 * @changesSum: 
 * 
 */
public class ExcelColumn {
	/**
	 * 索引
	 */
	private int index;
	
	/**
	 * 字段名称
	 */
	private String fieldName;
	
	/**
	 * 字段显示名称
	 */
	private String fieldDispName;
	
	/**
	 * 字段类型
	 */
	private int type;
	
	/**
	 * 是否为空，默认为true-可为空
	 */
	private boolean isNull=true;
	
	/**
	 * 列宽
	 */
	private int width;
	
	/**
	 * 列高
	 */
	private int height;
	
	
	public ExcelColumn() {
		
	}
	
	public ExcelColumn(int index,String fieldName,String fieldDispName, int width) {
		super();
		this.index=index;
		this.fieldName=fieldName;
		this.fieldDispName = fieldDispName;
		this.width = width;
	}


	public ExcelColumn(int index, String fieldName, String fieldDispName) {
		super();
		this.index = index;
		this.fieldName = fieldName;
		this.fieldDispName = fieldDispName;
	}
	
	public ExcelColumn(int index, String fieldName, String fieldDispName,boolean flag) {
		super();
		this.index = index;
		this.fieldName = fieldName;
		this.fieldDispName = fieldDispName;
		this.isNull=flag;
	}
	
	public int getIndex() {
		return index;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldDispName() {
		return fieldDispName;
	}

	public void setFieldDispName(String fieldDispName) {
		this.fieldDispName = fieldDispName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public boolean isNull() {
		return isNull;
	}

	public void setNull(boolean isNull) {
		this.isNull = isNull;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

}
