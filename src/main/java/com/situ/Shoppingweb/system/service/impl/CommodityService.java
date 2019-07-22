package com.situ.Shoppingweb.system.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.CommodityMapper;
import com.situ.Shoppingweb.system.mapper.CommodityTypeMapper;
import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.CommodityTypeModel;
import com.situ.Shoppingweb.system.service.ICommodityService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class CommodityService implements ICommodityService {

	@Autowired
	private CommodityMapper commodityMapper;
	
	@Autowired
	private CommodityTypeMapper commodityTypeMapper;

	@Override
	public List<CommodityModel> getList(CommodityModel cm) {
		System.out.println("根据二级分类查"+cm);
		System.out.println("结果是"+commodityMapper.selectAll(cm));
		return commodityMapper.selectAll(cm);
	}

	@Override
	public String getCount(CommodityModel cm) {
		return commodityMapper.selectCount(cm)+"";
	}

	@Override
	public List<CommodityTypeModel> getParentCodeAndName() {
		return commodityTypeMapper.selectParent();
	}

	@Override
	public List<CommodityTypeModel> getSonCodeAndName(String parentCode) {
		return commodityTypeMapper.selectSon(parentCode);
	}

	@Override
	public String add(CommodityModel model, String vCode, HttpServletRequest request) {
		String iCode=(String)request.getSession().getAttribute("authCode");
		String code=model.getCode();
		if(!iCode.equals(vCode)){
			return "3";
		}
		if (FmtEmpty.isEmpty(commodityMapper.selectModel(code))) {
			if(FmtEmpty.isEmpty(commodityMapper.insert(model))){
				return "2";
			};
			return "0";
		}
		return "1";
	}

	@Override
	public List<CommodityTypeModel> getSecondCodeAndName() {
		return commodityTypeMapper.selectAllSecond();
	}

	@Override
	public String delModel(String code) {
		if(!FmtEmpty.isEmpty(commodityMapper.selectModel(code))){
			System.out.println("删除！——————————————————————");

			return commodityMapper.del(code)+"";
		}
		return "3";
	}

	@Override
	public CommodityModel initUpd(String code) {
		return commodityMapper.selectModel(code);
	}

	@Override
	public String updModel(CommodityModel model) {
		if(!FmtEmpty.isEmpty(commodityMapper.selectModel(model.getCode()))){
			return commodityMapper.upd(model)+"";
		}
		return "0";
	}

	
}
