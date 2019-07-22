package com.situ.Shoppingweb.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.situ.Shoppingweb.system.model.CommodityTypeModel;

public interface ICommodityTypeService {

	List<CommodityTypeModel> getList(CommodityTypeModel ctm1);

	String getCount(CommodityTypeModel ctm1);

	List<CommodityTypeModel> getParentCodeAndName();

	String add(CommodityTypeModel model, String vCode, HttpServletRequest request);

	String delModel(String code);

	CommodityTypeModel initUpd(String code);

	String updModel(CommodityTypeModel model);

	List<CommodityTypeModel> getSecondCodeAndName();

	Map<String, Object> initType();

}
