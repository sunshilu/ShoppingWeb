package com.situ.Shoppingweb.system.mapper;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.OrderFormModel;

public interface OrderFormMapper {

	List<OrderFormModel> selectAll(OrderFormModel ofm);

	int selectCount(OrderFormModel ofm);

	OrderFormModel selectModel(String code);

	int insert(OrderFormModel model);

	int del(String code);

	int upd(OrderFormModel model);

}
