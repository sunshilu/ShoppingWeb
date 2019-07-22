package com.situ.Shoppingweb.system.mapper;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityTypeModel;

public interface CommodityTypeMapper  {

	List<CommodityTypeModel> selectAll(CommodityTypeModel ctm1);

	int selectCount(CommodityTypeModel ctm1);

	List<CommodityTypeModel> selectParent();

	CommodityTypeModel selectModel(String code);

	int insert(CommodityTypeModel model);

	int del(String code);

	int upd(CommodityTypeModel model);

	List<CommodityTypeModel> selectSon(String code);

	List<CommodityTypeModel> selectAllSecond();

	int selectSecondCount(CommodityTypeModel model);

}
