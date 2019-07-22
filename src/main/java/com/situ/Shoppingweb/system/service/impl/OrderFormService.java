package com.situ.Shoppingweb.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.OrderFormMapper;
import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.OrderFormModel;
import com.situ.Shoppingweb.system.service.IOrderFormService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class OrderFormService implements IOrderFormService {
	
	@Autowired
	private OrderFormMapper orderFormMapper;

	@Override
	public List<OrderFormModel> getList(OrderFormModel ofm) {
		return orderFormMapper.selectAll(ofm);
	}

	@Override
	public String getCount(OrderFormModel ofm) {
		return orderFormMapper.selectCount(ofm)+"";
	}

	@Override
	public String add(OrderFormModel model) {
		String code=model.getCode();
		if (FmtEmpty.isEmpty(orderFormMapper.selectModel(code))) {
			if(FmtEmpty.isEmpty(orderFormMapper.insert(model))){
				return "2";
			};
			return "0";
		}
		return "1";
	}

	@Override
	public String delModel(String code) {
		if(!FmtEmpty.isEmpty(orderFormMapper.selectModel(code))){
			System.out.println("删除！——————————————————————");
			return orderFormMapper.del(code)+"";
		}
		return "3";
	}

	@Override
	public OrderFormModel initUpd(String code) {
		return orderFormMapper.selectModel(code);
	}

	@Override
	public String updModel(OrderFormModel model) {
		if(!FmtEmpty.isEmpty(orderFormMapper.selectModel(model.getCode()))){
			return orderFormMapper.upd(model)+"";
		}
		return "0";
	}

}
