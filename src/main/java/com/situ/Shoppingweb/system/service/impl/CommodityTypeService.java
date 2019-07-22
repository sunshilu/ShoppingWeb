package com.situ.Shoppingweb.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.CommodityTypeMapper;
import com.situ.Shoppingweb.system.model.CommodityTypeModel;
import com.situ.Shoppingweb.system.service.ICommodityTypeService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class CommodityTypeService implements ICommodityTypeService {

	@Autowired
	private CommodityTypeMapper commodityTypeMapper;

	@Override
	public List<CommodityTypeModel> getList(CommodityTypeModel ctm1) {
		return commodityTypeMapper.selectAll(ctm1);
	}

	@Override
	public String getCount(CommodityTypeModel ctm1) {
		return commodityTypeMapper.selectCount(ctm1) + "";
	}

	@Override
	public List<CommodityTypeModel> getParentCodeAndName() {

		return commodityTypeMapper.selectParent();
	}

	@Override
	public String add(CommodityTypeModel model, String vCode, HttpServletRequest request) {
		String iCode = (String) request.getSession().getAttribute("authCode");
		String code = model.getCode();
		if (!iCode.equals(vCode)) {
			return "3";
		}
		if (FmtEmpty.isEmpty(commodityTypeMapper.selectModel(code))) {
			if (FmtEmpty.isEmpty(commodityTypeMapper.insert(model))) {
				return "2";
			}
			;
			return "0";
		}
		return "1";
	}

	@Override
	public String delModel(String code) {
		if (!FmtEmpty.isEmpty(commodityTypeMapper.selectModel(code))) {
			System.out.println("删除！——————————————————————");

			return commodityTypeMapper.del(code) + "";
		}
		return "3";
	}

	@Override
	public CommodityTypeModel initUpd(String code) {
		return commodityTypeMapper.selectModel(code);
	}

	@Override
	public String updModel(CommodityTypeModel model) {
		if (!FmtEmpty.isEmpty(commodityTypeMapper.selectModel(model.getCode()))) {
			return commodityTypeMapper.upd(model) + "";
		}
		return "0";
	}

	@Override
	public List<CommodityTypeModel> getSecondCodeAndName() {
		return commodityTypeMapper.selectAllSecond();
	}

	@Override
	public Map<String,Object> initType() {
		int count = 0;
		List<CommodityTypeModel> list = commodityTypeMapper.selectParent();
		List<Integer> list1 =new ArrayList<>();
		List<CommodityTypeModel> list2=new ArrayList<>();
		List<CommodityTypeModel> list3=new ArrayList<>();
		for (CommodityTypeModel m : list) {
			CommodityTypeModel model = new CommodityTypeModel();
			model.setParentCode(m.getCode());
			count = commodityTypeMapper.selectSecondCount(model);
			list2= commodityTypeMapper.selectSon(m.getCode());
			list1.add(count);
			for(CommodityTypeModel n : list2){
				list3.add(n);
			}
		}
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list1);
		map.put("list2", list3);
		return map;
	}

}
