package com.situ.Shoppingweb.system.service;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.OrderFormModel;

public interface IOrderFormService {

	List<OrderFormModel> getList(OrderFormModel ofm);

	String getCount(OrderFormModel ofm);

	String add(OrderFormModel model);

	String delModel(String code);

	OrderFormModel initUpd(String code);

	String updModel(OrderFormModel model);

}
