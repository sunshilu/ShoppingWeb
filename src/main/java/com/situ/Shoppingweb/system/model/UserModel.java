package com.situ.Shoppingweb.system.model;

import com.situ.Shoppingweb.util.Pager;

public class UserModel extends Pager{
	private Integer id;
	private String code;
	private String password;
	private String name;
	private String type;
	private String time;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", code=" + code + ", password=" + password + ", name=" + name + ", type=" + type
				+ ", time=" + time + "]";
	}
	
}
