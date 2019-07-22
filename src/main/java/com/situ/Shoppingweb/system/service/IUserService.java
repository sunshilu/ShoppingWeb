package com.situ.Shoppingweb.system.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.situ.Shoppingweb.system.model.UserModel;

public interface IUserService {

	List<UserModel> getList(UserModel um1);

	String getCount(UserModel um1);

	String add(UserModel model,String vCode,HttpServletRequest request);
	
	UserModel getModel(String code);

	String delModel(String code);

	UserModel initUpd(String code);

	String updModel(UserModel model);

	String login(UserModel model,String vCode,HttpServletRequest request);

}
