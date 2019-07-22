package com.situ.Shoppingweb.users.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.UserMapper;
import com.situ.Shoppingweb.system.model.UserModel;
import com.situ.Shoppingweb.users.service.ILoginAndRegService;
import com.situ.Shoppingweb.util.FmtEmpty;
import com.situ.Shoppingweb.util.MD5;

@Service
public class LoginAndRegService implements ILoginAndRegService {
	
	@Autowired
	private UserMapper userMapper;
	
	public UserModel selectModel(String code) {
		return userMapper.selectModel(code);
	}

	@Override
	public String login(UserModel model, String vCode, HttpServletRequest request) {
		String iCode=(String)request.getSession().getAttribute("authCode");
		if(!iCode.equals(vCode)){
			return "3";
		}
		UserModel um1=selectModel(model.getCode());
		if(!FmtEmpty.isEmpty(um1)){
			
			if(um1.getType().trim().equals("user")){
				if(um1.getPassword().trim().equals(MD5.encode(model.getPassword()))){
					request.getSession().setAttribute("userCode", model.getCode());
					return "1";
				}
				return "2";
			}
			return "4";
		}
		return "0";
	}

	@Override
	public String loginloginOut(HttpServletRequest request) {
		request.getSession().removeAttribute("userCode");
		return "0";
	}

}
