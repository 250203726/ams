package com.util.excel;

import java.util.Date;

/**
 * AgAgentSalesDetail entity. @author MyEclipse Persistence Tools
 */
public class AgentSalesDetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private String orderNo;
	private Date orderDate;
	private Integer orderType;
	private String belongOrgId;
	private String belongOrgName;
	private String agentId;
	private String agentName;
	private String entId;
	private String entName;
	private Integer businessSum;
	private Integer contractSum;
	private Integer dividePercent;
	private Integer divideSum;
	private Integer payforSum;
	private Date payforDate;
	private Integer isReceive;
	private Integer receiveSum;
	private Date receiveDate;
	private String remark;
	private Date createDate;

	// Constructors

	/** default constructor */
	public AgentSalesDetail() {
	}

	/** minimal constructor */
	public AgentSalesDetail(Date orderDate, Integer orderType,
			String belongOrgName, String agentName, String entName,
			Integer businessSum, Integer contractSum, Integer dividePercent,
			Integer divideSum, Integer payforSum, Integer isReceive) {
		this.orderDate = orderDate;
		this.orderType = orderType;
		this.belongOrgName = belongOrgName;
		this.agentName = agentName;
		this.entName = entName;
		this.businessSum = businessSum;
		this.contractSum = contractSum;
		this.dividePercent = dividePercent;
		this.divideSum = divideSum;
		this.payforSum = payforSum;
		this.isReceive = isReceive;
	}

	/** full constructor */
	public AgentSalesDetail(String orderNo, Date orderDate,
			Integer orderType, String belongOrgId, String belongOrgName,
			String agentId, String agentName, String entId, String entName,
			Integer businessSum, Integer contractSum, Integer dividePercent,
			Integer divideSum, Integer payforSum, Date payforDate,
			Integer isReceive, Integer receiveSum, Date receiveDate,
			String remark, Date createDate) {
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderType = orderType;
		this.belongOrgId = belongOrgId;
		this.belongOrgName = belongOrgName;
		this.agentId = agentId;
		this.agentName = agentName;
		this.entId = entId;
		this.entName = entName;
		this.businessSum = businessSum;
		this.contractSum = contractSum;
		this.dividePercent = dividePercent;
		this.divideSum = divideSum;
		this.payforSum = payforSum;
		this.payforDate = payforDate;
		this.isReceive = isReceive;
		this.receiveSum = receiveSum;
		this.receiveDate = receiveDate;
		this.remark = remark;
		this.createDate = createDate;
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	
	public Integer getOrderType() {
		return this.orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	
	public String getBelongOrgId() {
		return this.belongOrgId;
	}

	public void setBelongOrgId(String belongOrgId) {
		this.belongOrgId = belongOrgId;
	}

	
	public String getBelongOrgName() {
		return this.belongOrgName;
	}

	public void setBelongOrgName(String belongOrgName) {
		this.belongOrgName = belongOrgName;
	}

	
	public String getAgentId() {
		return this.agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}

	
	public String getAgentName() {
		return this.agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	
	public String getEntId() {
		return this.entId;
	}

	public void setEntId(String entId) {
		this.entId = entId;
	}

	
	public String getEntName() {
		return this.entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	
	public Integer getBusinessSum() {
		return this.businessSum;
	}

	public void setBusinessSum(Integer businessSum) {
		this.businessSum = businessSum;
	}

	
	public Integer getContractSum() {
		return this.contractSum;
	}

	public void setContractSum(Integer contractSum) {
		this.contractSum = contractSum;
	}

	
	public Integer getDividePercent() {
		return this.dividePercent;
	}

	public void setDividePercent(Integer dividePercent) {
		this.dividePercent = dividePercent;
	}

	
	public Integer getDivideSum() {
		return this.divideSum;
	}

	public void setDivideSum(Integer divideSum) {
		this.divideSum = divideSum;
	}

	
	public Integer getPayforSum() {
		return this.payforSum;
	}

	public void setPayforSum(Integer payforSum) {
		this.payforSum = payforSum;
	}

	public Date getPayforDate() {
		return this.payforDate;
	}

	public void setPayforDate(Date payforDate) {
		this.payforDate = payforDate;
	}

	
	public Integer getIsReceive() {
		return this.isReceive;
	}

	public void setIsReceive(Integer isReceive) {
		this.isReceive = isReceive;
	}

	
	public Integer getReceiveSum() {
		return this.receiveSum;
	}

	public void setReceiveSum(Integer receiveSum) {
		this.receiveSum = receiveSum;
	}

	public Date getReceiveDate() {
		return this.receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "AgentSalesDetail [agentId=" + agentId + ", agentName="
				+ agentName + ", belongOrgId=" + belongOrgId
				+ ", belongOrgName=" + belongOrgName + ", businessSum="
				+ businessSum + ", contractSum=" + contractSum
				+ ", createDate=" + createDate + ", dividePercent="
				+ dividePercent + ", divideSum=" + divideSum + ", entId="
				+ entId + ", entName=" + entName + ", id=" + id
				+ ", isReceive=" + isReceive + ", orderDate=" + orderDate
				+ ", orderNo=" + orderNo + ", orderType=" + orderType
				+ ", payforDate=" + payforDate + ", payforSum=" + payforSum
				+ ", receiveDate=" + receiveDate + ", receiveSum=" + receiveSum
				+ ", remark=" + remark + "]";
	}

}