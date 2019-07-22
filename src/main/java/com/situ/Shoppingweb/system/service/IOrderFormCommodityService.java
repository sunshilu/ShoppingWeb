package com.situ.Shoppingweb.system.service;

import java.util.List;

import com.situ.Shoppingweb.system.model.OrderFormCommodityModel;

public interface IOrderFormCommodityService {

	List<OrderFormCommodityModel> selectAll(OrderFormCommodityModel model);

	String delModel(OrderFormCommodityModel model);

}
