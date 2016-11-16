package com.ams.customer.entity;

/**
 * 客户实体
 * @author Wymann
 * @Data 2014-12-12 下午06:06:59
 *
 */
public class Customer {

	private String customerId;		//主键
	private String customerCode;	//组织机构代码
	private String customerName;	//客户名称
	private String customerType;	//客户类型
	private String contactPerson;	//联系人
	private String contatctPhone;	//联系电话
	private String contatctAddress;	//地址
	private String customerNote;	//说明

	public String getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerCode() {
		return this.customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerType() {
		return this.customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getContactPerson() {
		return this.contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getContatctPhone() {
		return this.contatctPhone;
	}

	public void setContatctPhone(String contatctPhone) {
		this.contatctPhone = contatctPhone;
	}

	public String getContatctAddress() {
		return this.contatctAddress;
	}

	public void setContatctAddress(String contatctAddress) {
		this.contatctAddress = contatctAddress;
	}

	public String getCustomerNote() {
		return this.customerNote;
	}

	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}

}
