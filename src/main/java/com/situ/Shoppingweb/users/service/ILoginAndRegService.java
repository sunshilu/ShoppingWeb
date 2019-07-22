package com.situ.Shoppingweb.users.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.model.UserModel;

@Service
public interface ILoginAndRegService {

	String login(UserModel model, String vCode, HttpServletRequest request);

	String loginloginOut(HttpServletRequest request);

}
