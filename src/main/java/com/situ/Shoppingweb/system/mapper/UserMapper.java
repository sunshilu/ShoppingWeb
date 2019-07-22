package com.situ.Shoppingweb.system.mapper;

import java.util.List;

import com.situ.Shoppingweb.system.model.UserModel;

public interface UserMapper {

	List<UserModel> selectAll(UserModel um1);

	int insert(UserModel model);

	int del(String code);

	int upd(UserModel model);

	int selectCount(UserModel um1);

	UserModel selectModel(String code);

}
