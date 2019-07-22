package com.situ.Shoppingweb.users.controller;

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
import com.situ.Shoppingweb.users.model.ShoppingCartModel;
import com.situ.Shoppingweb.users.service.IShoppingCartService;

@Controller
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
	
	@Autowired
	private IShoppingCartService shoppingCartService;
	
	@ResponseBody
	@RequestMapping(value = "/init", produces = "application/json;charset=utf-8")
	private String initCart(ShoppingCartModel model){
		List<CommodityModel> list=shoppingCartService.initCart(model);
		Map<String,Object> map=new HashMap<>();
		map.put("list", list);
		return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/add",produces = "application/json;charset=utf-8")
	public String add(ShoppingCartModel model){
		System.out.println(model);
		return shoppingCartService.add(model);
		
	}
	@ResponseBody
	@RequestMapping("/del")
	public String del(ShoppingCartModel model){
		return shoppingCartService.delModel(model);
	}
	@ResponseBody
	@RequestMapping("/delAll")
	public String delAll(ShoppingCartModel model){
		return shoppingCartService.delAll(model);
	}
	@ResponseBody
	@RequestMapping("/updQuantity")
	public String updQuantity(ShoppingCartModel model){
		return shoppingCartService.updModel(model);
	}
	@ResponseBody
	@RequestMapping("/initAddress")
	public String initAddress(String userCode,String str){
		List<CommodityModel> list=shoppingCartService.initAddress(userCode,str);
		Map<String,Object> map=new HashMap<>();
		map.put("list", list);
		return new JSONObject(map).toString();
	}
	
	

}
