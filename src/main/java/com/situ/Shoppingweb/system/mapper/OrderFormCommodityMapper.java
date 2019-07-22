package com.situ.Shoppingweb.system.mapper;

import java.util.List;

import com.situ.Shoppingweb.system.model.OrderFormCommodityModel;

public interface OrderFormCommodityMapper {

	List<OrderFormCommodityModel> selectAll(OrderFormCommodityModel model);

	OrderFormCommodityModel selectModel(OrderFormCommodityModel model);

	int del(OrderFormCommodityModel model);

	int insert(OrderFormCommodityModel ofcm);

}
