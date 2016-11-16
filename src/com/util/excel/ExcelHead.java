package com.util.excel;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.CellStyle;

/**
 * Excel头信息
 *
 * @createTime: 2012-4-18 下午01:17:53
 * @version: 0.1
 * @lastVersion: 0.1
 * @updateTime: 
 * @changesSum: 
 * 
 */
public class ExcelHead {
	/**
	 * 列信息
	 */
	private List<ExcelColumn> columns;
	
	/**
	 * 需要转换的列
	 */
	private Map<String, Map> columnsConvertMap;
	
	/**
	 * 头部所占用的行数
	 */
	private int rowCount;
	
	/**
	 * 头部所占用的列数
	 */
	private int columnCount;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 标题样式
	 */
	private CellStyle titleStyle;	//标题样式
	
	/**
	 * 表格头样式
	 */
	private CellStyle clumnStyle;	//表格头样式
	
	/**
	 * 单元格样式
	 */
	private CellStyle cellStyle;

	public List<ExcelColumn> getColumns() {
		return columns;
	}

	public int getRowCount() {
		return rowCount;
	}

	public int getColumnCount() {
		return columnCount;
	}

	public void setColumns(List<ExcelColumn> columns) {
		this.columns = columns;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public void setColumnCount(int columnCount) {
		this.columnCount = columnCount;
	}

	public Map<String, Map> getColumnsConvertMap() {
		return columnsConvertMap;
	}

	public void setColumnsConvertMap(Map<String, Map> columnsConvertMap) {
		this.columnsConvertMap = columnsConvertMap;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public CellStyle getTitleStyle() {
		return titleStyle;
	}

	public void setTitleStyle(CellStyle titleStyle) {
		this.titleStyle = titleStyle;
	}

	public CellStyle getClumnStyle() {
		return clumnStyle;
	}

	public void setClumnStyle(CellStyle clumnStyle) {
		this.clumnStyle = clumnStyle;
	}

	public CellStyle getCellStyle() {
		return cellStyle;
	}

	public void setCellStyle(CellStyle cellStyle) {
		this.cellStyle = cellStyle;
	}
	
}
