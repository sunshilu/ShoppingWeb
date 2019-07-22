package com.situ.Shoppingweb.system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/login")
	private String login(String code,Model model,HttpSession session){
		if(code.equals("123")){
			session.setAttribute("code", code);
			model.addAttribute("model",code);
			return "res1";
		}
		return "res2";
	}

}
