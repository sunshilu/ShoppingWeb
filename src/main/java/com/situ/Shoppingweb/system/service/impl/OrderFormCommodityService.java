package com.situ.Shoppingweb.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.OrderFormCommodityMapper;
import com.situ.Shoppingweb.system.model.OrderFormCommodityModel;
import com.situ.Shoppingweb.system.service.IOrderFormCommodityService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class OrderFormCommodityService implements IOrderFormCommodityService{

	@Autowired
	private OrderFormCommodityMapper orderFormCommodityMapper;

	@Override
	public List<OrderFormCommodityModel> selectAll(OrderFormCommodityModel model) {
		return orderFormCommodityMapper.selectAll(model);
	}

	@Override
	public String delModel(OrderFormCommodityModel model) {
		if(!FmtEmpty.isEmpty(orderFormCommodityMapper.selectModel(model))){
			System.out.println("删除！——————————————————————");
			return orderFormCommodityMapper.del(model)+"";
		}
		return "3";
	}
}
