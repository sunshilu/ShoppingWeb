package com.situ.Shoppingweb.system.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.Shoppingweb.system.model.OrderFormCommodityModel;
import com.situ.Shoppingweb.system.service.IOrderFormCommodityService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/orderFormCommodity")
public class OrderFormCommodityController {
	@Autowired
	private IOrderFormCommodityService orderFormCommodityService;

	@RequestMapping(value = "getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	private String getList(OrderFormCommodityModel model) {
		Map<String, Object> map = new HashMap<>();
		map.put("list", orderFormCommodityService.selectAll(model));
		System.out.println(map);
		return JSONObject.fromObject(map).toString();
	}
	@ResponseBody
	@RequestMapping("/del")
	public String del(OrderFormCommodityModel model){
		return orderFormCommodityService.delModel(model);
	}

}
