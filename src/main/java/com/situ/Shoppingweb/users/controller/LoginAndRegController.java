package com.situ.Shoppingweb.users.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.Shoppingweb.system.model.UserModel;
import com.situ.Shoppingweb.users.service.ILoginAndRegService;

@Controller
@RequestMapping("/loginAndReg")
public class LoginAndRegController {

	@Autowired 
	private ILoginAndRegService loginAndRegService;
	
	@ResponseBody
	@RequestMapping(value="/login")
	public String login(UserModel model,String vCode,HttpServletRequest request){
		return loginAndRegService.login(model,vCode,request);
		
	}
	@ResponseBody
	@RequestMapping(value="/loginOut")
	public String loginOut(HttpServletRequest request){
		return loginAndRegService.loginloginOut(request);
		
	}
	
}
