package com.ams.customer.model;

public class CustomerModel {
	private String customerId;		//主键
	private String customerCode;	//组织机构代码
	private String customerName;	//客户名称
	private String customerType;	//客户类型
	private String contactPerson;	//联系人
	private String contatctPhone;	//联系电话
	private String contatctAddress;	//地址
	private String customerNote;	//说明
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getContatctPhone() {
		return contatctPhone;
	}
	public void setContatctPhone(String contatctPhone) {
		this.contatctPhone = contatctPhone;
	}
	public String getContatctAddress() {
		return contatctAddress;
	}
	public void setContatctAddress(String contatctAddress) {
		this.contatctAddress = contatctAddress;
	}
	public String getCustomerNote() {
		return customerNote;
	}
	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}
	
}
