package com.situ.Shoppingweb.system.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.CommodityTypeModel;

public interface ICommodityService {

	List<CommodityModel> getList(CommodityModel cm);

	String getCount(CommodityModel cm);

	List<CommodityTypeModel> getParentCodeAndName();

	List<CommodityTypeModel> getSonCodeAndName(String parentCode);

	String add(CommodityModel model, String vCode, HttpServletRequest request);

	String delModel(String code);

	CommodityModel initUpd(String code);

	List<CommodityTypeModel> getSecondCodeAndName();

	String updModel(CommodityModel model);


}
