package com.situ.Shoppingweb.users.mapper;

import java.util.List;

import com.situ.Shoppingweb.users.model.ShoppingCartModel;

public interface ShoppingCartMapper {

	List<ShoppingCartModel> selectAll(ShoppingCartModel model);

	ShoppingCartModel selectModel(ShoppingCartModel model);

	int insert(ShoppingCartModel model);

	int updModel(ShoppingCartModel model2);

	int del(ShoppingCartModel model);

}
