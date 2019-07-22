package com.situ.Shoppingweb.users.service;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.users.model.ShoppingCartModel;

public interface IShoppingCartService {

	List<CommodityModel> initCart(ShoppingCartModel model);

	String add(ShoppingCartModel model);

	String delModel(ShoppingCartModel model);

	String updModel(ShoppingCartModel model);

	List<CommodityModel> initAddress(String userCode, String str);

	String delAll(ShoppingCartModel model);

}
