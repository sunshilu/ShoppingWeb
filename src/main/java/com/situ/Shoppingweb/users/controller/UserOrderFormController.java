package com.situ.Shoppingweb.users.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.Shoppingweb.users.service.IUserOrderFormService;

@Controller
@RequestMapping("/userOrderForm")
public class UserOrderFormController {

	@Autowired
	private IUserOrderFormService userOrderFormService;
	@ResponseBody
	@RequestMapping(value="/add",produces = "application/json;charset=utf-8")
	public String add(String address, String commodityCode,HttpServletRequest request){
		System.out.println(address+" "+commodityCode);
		return userOrderFormService.add(address,commodityCode,request);
		
	}
}
