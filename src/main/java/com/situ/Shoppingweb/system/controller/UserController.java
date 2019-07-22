package com.situ.Shoppingweb.system.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.Shoppingweb.system.model.UserModel;
import com.situ.Shoppingweb.system.service.IUserService;
import com.situ.Shoppingweb.util.FmtEmpty;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=utf-8")
	public String search(UserModel um1) {
		String code=um1.getCode();
		String name=um1.getName();
		if(!FmtEmpty.isEmpty(code)){
			um1.setCode("%"+code+"%");
		}
		if(!FmtEmpty.isEmpty(name)){
			um1.setName("%"+name+"%");
		}
		System.out.println(um1);
		List<UserModel> list=userService.getList(um1);
		String count=userService.getCount(um1);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		System.out.println(map);
		return new JSONObject(map).toString();

	}
	@ResponseBody
	@RequestMapping(value = "/add", produces = "application/json;charset=utf-8")
	public String add(UserModel model,String vCode,HttpServletRequest request){
		return userService.add(model,vCode,request);
		
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String del(String code){
		return userService.delModel(code);
	}
	@ResponseBody
	@RequestMapping(value="/initUpd",produces = "application/json;charset=utf-8")
	public String initUpd(String code){
		UserModel model=userService.initUpd(code);
		System.out.println(model);
		return new JSONObject(model).toString();
	}
	@ResponseBody
	@RequestMapping(value="/upd")
	public String upd(UserModel model){
		return userService.updModel(model);
	}
	
	@ResponseBody
	@RequestMapping(value="/login")
	public String login(UserModel model,String vCode,HttpServletRequest request){
		return userService.login(model,vCode,request);
		
	}
}
