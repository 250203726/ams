package com.ams.infomanage.project.model;

/**
 * 项目的视图实体
 * @author simon
 */
public class ProjectModel {

	private String projectId;		//主键
	private String projectName;		//项目名称
	private String projectHead;		//项目负责人
	
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectHead() {
		return projectHead;
	}
	public void setProjectHead(String projectHead) {
		this.projectHead = projectHead;
	}

	

}
