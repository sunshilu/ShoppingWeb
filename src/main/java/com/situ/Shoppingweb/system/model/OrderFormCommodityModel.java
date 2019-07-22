package com.situ.Shoppingweb.system.model;

public class OrderFormCommodityModel {
	private Integer id;
	private String orderFormCode;
	private String commodityCode;
	private Integer quantity;
	private String price;
	
	private String mainPic;
	private String commodityName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderFormCode() {
		return orderFormCode;
	}
	public void setOrderFormCode(String orderFormCode) {
		this.orderFormCode = orderFormCode;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMainPic() {
		return mainPic;
	}
	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}
	
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	
	@Override
	public String toString() {
		return "OrderFormCommodityModel [id=" + id + ", orderFormCode=" + orderFormCode + ", commodityCode="
				+ commodityCode + ", quantity=" + quantity + ", price=" + price + ", mainPic=" + mainPic
				+ ", commodityName=" + commodityName + "]";
	}
	public OrderFormCommodityModel(String orderFormCode, String commodityCode, Integer quantity, String price,
			String mainPic) {
		super();
		this.orderFormCode = orderFormCode;
		this.commodityCode = commodityCode;
		this.quantity = quantity;
		this.price = price;
		this.mainPic = mainPic;
	}
	public OrderFormCommodityModel() {
		super();
	}
	
	
}
