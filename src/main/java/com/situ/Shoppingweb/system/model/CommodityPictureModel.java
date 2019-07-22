package com.situ.Shoppingweb.system.model;

public class CommodityPictureModel {
	private Integer id;
	private String commodityCode;
	private String name;
	private String type;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getCommodityCode() {
		return commodityCode;
	}
	public void setCommodityCode(String commodityCode) {
		this.commodityCode = commodityCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public CommodityPictureModel() {
		super();
	}
	public CommodityPictureModel(String commodityCode, String name, String type) {
		super();
		this.commodityCode = commodityCode;
		this.name = name;
		this.type = type;
	}
	@Override
	public String toString() {
		return "CommodityPictureModel [id=" + id + ", commodityCode=" + commodityCode + ", name=" + name + ", type="
				+ type + "]";
	}
	
	
	
}
