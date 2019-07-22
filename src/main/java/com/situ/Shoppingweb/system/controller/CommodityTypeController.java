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

import com.situ.Shoppingweb.system.model.CommodityTypeModel;
import com.situ.Shoppingweb.system.model.UserModel;
import com.situ.Shoppingweb.system.service.ICommodityTypeService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Controller
@RequestMapping("/commodityType")
public class CommodityTypeController {
	
	@Autowired
	private ICommodityTypeService commodityTypeService;
	
	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=utf-8")
	public String search(CommodityTypeModel ctm1,String level) {
		String code=ctm1.getCode();
		String name=ctm1.getName();
		System.out.println(ctm1);
		System.out.println(ctm1.getParentCode());
		if(!FmtEmpty.isEmpty(code)){
			ctm1.setCode("%"+code+"%");
		}
		if(!FmtEmpty.isEmpty(name)){
			ctm1.setName("%"+name+"%");
		}
		if(level.equals("一级分类")){
			ctm1.setParentCode("一级分类");
		}
		if(level.equals("二级分类")){
			ctm1.setParentCode("二级分类");
		}
		System.out.println(ctm1);
		List<CommodityTypeModel> list=commodityTypeService.getList(ctm1);
		String count=commodityTypeService.getCount(ctm1);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		System.out.println(map);
		return new JSONObject(map).toString();

	}
	@ResponseBody
	@RequestMapping(value="/selectBox",produces = "application/json;charset=utf-8")
	public String initSelect(){
		List<CommodityTypeModel> list=commodityTypeService.getParentCodeAndName();
		CommodityTypeModel model =new CommodityTypeModel();
		model.setCode("");
		model.setName("无");
		list.add(0,model);
		System.out.println(list);
		return new JSONArray(list).toString();
	}
	@ResponseBody
	@RequestMapping("/add")
	public String add(CommodityTypeModel model,String vCode,HttpServletRequest request){
		return commodityTypeService.add(model,vCode,request);
		
	}
	@ResponseBody
	@RequestMapping("/del")
	public String del(String code){
		return commodityTypeService.delModel(code);
	}
	@ResponseBody
	@RequestMapping(value="/initUpd",produces = "application/json;charset=utf-8")
	public String initUpd(String code){
		CommodityTypeModel model=commodityTypeService.initUpd(code);
		System.out.println(model);
		return new JSONObject(model).toString();
	}
	@ResponseBody
	@RequestMapping(value="/upd")
	public String upd(CommodityTypeModel model){
		return commodityTypeService.updModel(model);
	}
	@ResponseBody
	@RequestMapping(value = "/searchAllType", produces = "application/json;charset=utf-8")
	public String searchAllType() {
		System.out.println(commodityTypeService.initType());
		return new JSONObject(commodityTypeService.initType()).toString();

	}
}
