package com.situ.Shoppingweb.users.service;

import javax.servlet.http.HttpServletRequest;

public interface IUserOrderFormService {

	String add(String address, String commodityCode,HttpServletRequest request);

}
