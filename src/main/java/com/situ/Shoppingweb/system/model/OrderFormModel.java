package com.situ.Shoppingweb.system.model;

import com.situ.Shoppingweb.util.Pager;

public class OrderFormModel extends Pager {
	private Integer id;
	private String code;
	private String userCode;
	private String time;
	private String addressCode;
	private String state;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddressCode() {
		return addressCode;
	}
	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "OrderForm [id=" + id + ", code=" + code + ", userCode=" + userCode + ", time=" + time + ", addressCode="
				+ addressCode + ", state=" + state + "]";
	}
	public OrderFormModel(String code, String userCode, String time, String addressCode, String state) {
		super();
		this.code = code;
		this.userCode = userCode;
		this.time = time;
		this.addressCode = addressCode;
		this.state = state;
	}
	public OrderFormModel() {
		super();
	}
	
	
	
}
