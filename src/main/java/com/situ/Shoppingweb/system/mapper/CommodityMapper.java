package com.situ.Shoppingweb.system.mapper;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.CommodityTypeModel;

public interface CommodityMapper {

	List<CommodityModel> selectAll(CommodityModel cm);

	int selectCount(CommodityModel cm);

	CommodityModel selectModel(String code);

	int insert(CommodityModel model);

	int del(String code);

	int upd(CommodityModel model);

}
