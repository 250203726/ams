package com.util.page;

import java.util.List;

/**
 * 分页实体模型
 * @version 1.0,2013-9-3
 * @author Wymann
 */
public class Pager {
	
	//某一页的记录列表
	private List<?> rows;
	//总记录数
	private int total;
	//总页数
	private int totalPage;
	//当前页,从第1页开始计数
	private int page=1;
	//每页记录数
	private int pageSize=20;
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotalPage() {
		if(this.pageSize!=0 && this.total%this.pageSize>0){
			totalPage=this.total/this.pageSize+1;
		}else if(this.pageSize!=0 && this.total%this.pageSize==0){
			totalPage=this.total/this.pageSize;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
