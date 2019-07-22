package com.situ.Shoppingweb.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.CommodityTypeModel;
import com.situ.Shoppingweb.system.service.ICommodityService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
	@Autowired
	private ICommodityService commodityService;
	
	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=utf-8")
	public String search(CommodityModel cm) {
		String code=cm.getCode();
		String name=cm.getName();
		String state=cm.getState();
		String commodityTypeCode=cm.getCommodityTypeCode();
		if(!FmtEmpty.isEmpty(code)){
			cm.setCode("%"+code+"%");
		}
		if(!FmtEmpty.isEmpty(name)){
			cm.setName("%"+name+"%");
		}
		if(!FmtEmpty.isEmpty(state)){
			cm.setState("%"+state+"%");
		}
		List<CommodityModel> list=commodityService.getList(cm);
		List<CommodityTypeModel> list2=commodityService.getSecondCodeAndName();
		CommodityTypeModel model =new CommodityTypeModel();
		model.setCode("");
		model.setName("无");
		list2.add(0,model);
		String count=commodityService.getCount(cm);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("list2",list2);
		System.out.println(map);
		return new JSONObject(map).toString();

	}
	@ResponseBody
	@RequestMapping(value="/selectBox",produces = "application/json;charset=utf-8")
	public String initSelect(){
		List<CommodityTypeModel> list=commodityService.getParentCodeAndName();
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value="/selectNextBox",produces = "application/json;charset=utf-8")
	public String initSelect2(String parentCode){
		List<CommodityTypeModel> list=commodityService.getSonCodeAndName(parentCode);
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping(value="/add",produces = "application/json;charset=utf-8")
	public String add(CommodityModel model,String vCode,HttpServletRequest request){
		System.out.println(model.getState());
		return commodityService.add(model,vCode,request);
		
	}
	@ResponseBody
	@RequestMapping("/del")
	public String del(String code){
		return commodityService.delModel(code);
	}
	@ResponseBody
	@RequestMapping(value="/initUpd",produces = "application/json;charset=utf-8")
	public String initUpd(String code){
		CommodityModel model=commodityService.initUpd(code);
		List<CommodityTypeModel> list=commodityService.getSonCodeAndName(model.getParentCode());
		System.out.println(model);
		Map<String,Object> map=new HashMap<>();
		map.put("model", model);
		map.put("list", list);
		return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/upd")
	public String upd(CommodityModel model){
		System.out.println("修改条件"+model);
		return commodityService.updModel(model);
	}
	
	@ResponseBody
	@RequestMapping(value="/searchcommodityByCode",produces = "application/json;charset=utf-8")
	public String searchcommodityByCode(String firstCode, String secondCode,String pageIndex,String pageLimit){
		CommodityModel model=new CommodityModel();
		if(!secondCode.equals("null")){
			model.setCommodityTypeCode(secondCode);
		}
		if(!firstCode.equals("null")){
			model.setParentCode(firstCode);
		}
		model.setPageIndex(Integer.parseInt(pageIndex));
		model.setPageLimit(Integer.parseInt(pageLimit));
		System.out.println("查询条件"+model);
		List<CommodityModel> list=commodityService.getList(model);
		String count=commodityService.getCount(model);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		System.out.println("查询结果"+map);
		return new JSONObject(map).toString();
	}
}
