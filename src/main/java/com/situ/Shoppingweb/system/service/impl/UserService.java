package com.situ.Shoppingweb.system.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.UserMapper;
import com.situ.Shoppingweb.system.model.UserModel;
import com.situ.Shoppingweb.system.service.IUserService;
import com.situ.Shoppingweb.util.FmtEmpty;
import com.situ.Shoppingweb.util.MD5;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<UserModel> getList(UserModel um1) {
		return userMapper.selectAll(um1);
	}

	@Override
	public String getCount(UserModel um1) {
		return userMapper.selectCount(um1) + "";
	}

	@Override
	public String add(UserModel model, String vCode, HttpServletRequest request) {
		String iCode = (String) request.getSession().getAttribute("authCode");
		String code = model.getCode();
		String time=new Date().toString();
		model.setTime(time);
		String password=model.getPassword();
		model.setPassword(MD5.encode(password));
		if (!iCode.equals(vCode)) {
			return "3";
		}
		if (FmtEmpty.isEmpty(userMapper.selectModel(code))) {
			model.setType("user");
			if (FmtEmpty.isEmpty(userMapper.insert(model))) {
				return "2";
			}
			return "0";
		}
		return "1";
	}

	@Override
	public UserModel getModel(String code) {
		return userMapper.selectModel(code);
	}

	@Override
	public String delModel(String code) {
		if (!FmtEmpty.isEmpty(getModel(code))) {
			System.out.println("删除！——————————————————————");

			return userMapper.del(code) + "";
		}
		return "3";
	}

	@Override
	public UserModel initUpd(String code) {
		return userMapper.selectModel(code);
	}

	@Override
	public String updModel(UserModel model) {
		if (!FmtEmpty.isEmpty(getModel(model.getCode()))) {
			return userMapper.upd(model) + "";
		}
		return "0";
	}

	@Override
	public String login(UserModel model, String vCode, HttpServletRequest request) {
		String iCode = (String) request.getSession().getAttribute("authCode");
		if (!iCode.equals(vCode)) {
			return "3";
		}
		UserModel um1 = getModel(model.getCode());
		if (!FmtEmpty.isEmpty(um1)) {
			if (um1.getType().trim().equals("admin")) {
				if (um1.getPassword().trim().equals(model.getPassword().trim())) {
					request.getSession().setAttribute("adminCode", model.getCode());
					return "1";
				}
				return "2";
			}
			return "4";
		}
		return "0";
	}

}
