package com.situ.Shoppingweb.system.mapper;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityPictureModel;

public interface PictureMapper {

	int insert(CommodityPictureModel commodityPictureModel);

	List<CommodityPictureModel> selectAll(CommodityPictureModel model);

	int del(CommodityPictureModel commodityPictureModel);

	CommodityPictureModel selectModel(String name);

	int upd(CommodityPictureModel ppm);

}
