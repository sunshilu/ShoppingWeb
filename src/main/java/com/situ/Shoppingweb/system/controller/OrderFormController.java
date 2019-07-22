package com.situ.Shoppingweb.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.CommodityTypeModel;
import com.situ.Shoppingweb.system.model.OrderFormModel;
import com.situ.Shoppingweb.system.service.IOrderFormService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Controller
@RequestMapping("/orderForm")
public class OrderFormController {
	
	@Autowired
	private IOrderFormService orderFormService;
	
	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=utf-8")
	public String search(OrderFormModel ofm) {
		String code=ofm.getCode();
		if(!FmtEmpty.isEmpty(code)){
			ofm.setCode("%"+code+"%");
		}
		String userCode=ofm.getUserCode();
		if(!FmtEmpty.isEmpty(userCode)){
			ofm.setUserCode("%"+userCode+"%");
		}
		List<OrderFormModel> list=orderFormService.getList(ofm);
		String count=orderFormService.getCount(ofm);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		System.out.println(map);
		return new JSONObject(map).toString();

	}
	@ResponseBody
	@RequestMapping("/add")
	public String add(OrderFormModel model){
		return orderFormService.add(model);
		
	}
	@ResponseBody
	@RequestMapping("/del")
	public String del(String code){
		return orderFormService.delModel(code);
	}
	@ResponseBody
	@RequestMapping(value="/initUpd",produces = "application/json;charset=utf-8")
	public String initUpd(String code){
		OrderFormModel model=orderFormService.initUpd(code);
		System.out.println(model);
		return new JSONObject(model).toString();
	}
	@ResponseBody
	@RequestMapping(value="/upd")
	public String upd(OrderFormModel model){
		System.out.println("修改条件"+model);
		return orderFormService.updModel(model);
	}
}
