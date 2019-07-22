package com.situ.Shoppingweb.system.model;

import java.awt.print.Paper;

import com.situ.Shoppingweb.util.Pager;

public class CommodityTypeModel extends Pager{
	private Integer id;
	private String code;
	private String name;
	private String description;
	private String parentCode;
	
	private String parentName;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	@Override
	public String toString() {
		return "CommodityTypeModel [id=" + id + ", code=" + code + ", name=" + name + ", description=" + description
				+ ", parentCode=" + parentCode + ", parentName=" + parentName + "]";
	}


}
