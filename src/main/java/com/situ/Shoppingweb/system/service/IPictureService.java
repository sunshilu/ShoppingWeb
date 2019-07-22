package com.situ.Shoppingweb.system.service;

import java.util.List;

import com.situ.Shoppingweb.system.model.CommodityPictureModel;

public interface IPictureService {

	String insert(CommodityPictureModel commodityPictureModel);

	List<CommodityPictureModel> selectAll(CommodityPictureModel productPicModel);

	String deleteModel(CommodityPictureModel commodityPictureModel);

	String updType(CommodityPictureModel ppm);
	
}
