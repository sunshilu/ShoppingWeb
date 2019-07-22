package com.situ.Shoppingweb.system.model;

import com.situ.Shoppingweb.util.Pager;

public class CommodityModel extends Pager {
	private Integer id;
	private String code;
	private String name;
	private String unitPrice;
	private String description;
	private Integer inventory;
	private String state;
	private String commodityTypeCode;
	
	private String commodityTypeName;
	private String parentCode;
	private String mainPic;
	private Integer quantity;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCommodityTypeCode() {
		return commodityTypeCode;
	}
	public void setCommodityTypeCode(String commodityTypeCode) {
		this.commodityTypeCode = commodityTypeCode;
	}
	public String getCommodityTypeName() {
		return commodityTypeName;
	}
	public void setCommodityTypeName(String commodityTypeName) {
		this.commodityTypeName = commodityTypeName;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	
	public String getMainPic() {
		return mainPic;
	}
	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "CommodityModel [id=" + id + ", code=" + code + ", name=" + name + ", unitPrice=" + unitPrice
				+ ", description=" + description + ", inventory=" + inventory + ", state=" + state
				+ ", commodityTypeCode=" + commodityTypeCode + ", commodityTypeName=" + commodityTypeName
				+ ", parentCode=" + parentCode + ", mainPic=" + mainPic + "]";
	}
	
	
}
