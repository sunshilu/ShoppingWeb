package com.situ.Shoppingweb.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.PictureMapper;
import com.situ.Shoppingweb.system.model.CommodityPictureModel;
import com.situ.Shoppingweb.system.service.IPictureService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class PictureService implements IPictureService {
	
	@Autowired
	private PictureMapper pictureMapper;

	@Override
	public String insert(CommodityPictureModel commodityPictureModel) {
		return pictureMapper.insert(commodityPictureModel)+"";
	}

	@Override
	public List<CommodityPictureModel> selectAll(CommodityPictureModel model) {
		return pictureMapper.selectAll(model);
	}

	@Override
	public String deleteModel(CommodityPictureModel commodityPictureModel) {
		if(!FmtEmpty.isEmpty(pictureMapper.selectModel(commodityPictureModel.getName()))){
			System.out.println("删除！——————————————————————");
			return pictureMapper.del(commodityPictureModel)+"";
		}
		return "2";
		
	}

	@Override
	public String updType(CommodityPictureModel ppm) {
		return pictureMapper.upd(ppm)+"";
	}
}
