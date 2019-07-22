package com.situ.Shoppingweb.system.model;

public class ShoppingCartModel {
	private Integer id;
	private String userCode;
	private String commodityCode;
	private Integer quantity;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getCommodityCode() {
		return commodityCode;
	}
	public void setCommodityCode(String commodityCode) {
		this.commodityCode = commodityCode;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "ShoppingCart [id=" + id + ", userCode=" + userCode + ", commodityCode=" + commodityCode + ", quantity="
				+ quantity + "]";
	}
	
}
