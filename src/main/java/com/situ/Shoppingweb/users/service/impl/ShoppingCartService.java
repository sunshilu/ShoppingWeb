package com.situ.Shoppingweb.users.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.CommodityMapper;
import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.users.mapper.ShoppingCartMapper;
import com.situ.Shoppingweb.users.model.ShoppingCartModel;
import com.situ.Shoppingweb.users.service.IShoppingCartService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class ShoppingCartService implements IShoppingCartService {

	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	
	@Autowired
	private CommodityMapper commodityMapper;

	@Override
	public List<CommodityModel> initCart(ShoppingCartModel model) {
		List<ShoppingCartModel>list=shoppingCartMapper.selectAll(model);
		List<CommodityModel> list2=new ArrayList<>();
		for(ShoppingCartModel scm:list){
			CommodityModel cm=commodityMapper.selectModel(scm.getCommodityCode());
			cm.setQuantity(scm.getQuantity());
			list2.add(cm);
		}
		return list2;
	}


	@Override
	public String add(ShoppingCartModel model) {
		ShoppingCartModel model0=new ShoppingCartModel();
		model0.setCommodityCode(model.getCommodityCode());
		model0.setUserCode(model.getUserCode());
		ShoppingCartModel model2=shoppingCartMapper.selectModel(model0);
		if (FmtEmpty.isEmpty(model2)) {
			if(FmtEmpty.isEmpty(shoppingCartMapper.insert(model))){
				return "2";
			};
			return "0";
		}else{
			model2.setQuantity(model.getQuantity()+model2.getQuantity());
			if(FmtEmpty.isEmpty(shoppingCartMapper.updModel(model2))){
				return "2";
			};
			return "0";
		}
	}


	@Override
	public String delModel(ShoppingCartModel model) {
		if(!FmtEmpty.isEmpty(shoppingCartMapper.selectModel(model))){
			System.out.println("删除！——————————————————————");
			return shoppingCartMapper.del(model)+"";
		}
		return "3";
	}


	@Override
	public String updModel(ShoppingCartModel model) {
		ShoppingCartModel model0=new ShoppingCartModel();
		model0.setCommodityCode(model.getCommodityCode());
		model0.setUserCode(model.getUserCode());
		ShoppingCartModel model2=shoppingCartMapper.selectModel(model0);
		if(!FmtEmpty.isEmpty(model2)){
			model2.setQuantity(model.getQuantity()+model2.getQuantity());
			return shoppingCartMapper.updModel(model)+"";
		}
		return "3";
	}


	@Override
	public List<CommodityModel> initAddress(String userCode, String str) {
		if(userCode.equals(null)){
			return null;
		}
		String[] strArr=str.split(",");
		if(strArr.length==0){
			return null;
		}
		System.out.println("数组_____________"+Arrays.toString(strArr));
		ShoppingCartModel model=new ShoppingCartModel();
		model.setUserCode(userCode);
		List<CommodityModel> list=new ArrayList<>();
		Integer quantity=null;
		for(String s:strArr){
			System.out.println("SSSSSSSSSS"+s);
			model.setCommodityCode(s);
			System.out.println("用户编号"+userCode);
			System.out.println("查询条件"+model);
			model=shoppingCartMapper.selectModel(model);
			System.out.println("查询出的一条数据"+model);
			quantity= model.getQuantity();
			CommodityModel cm=commodityMapper.selectModel(s);
			cm.setQuantity(quantity);
			list.add(cm);
		}
		return list;
	}


	@Override
	public String delAll(ShoppingCartModel model) {
		String allCode=model.getCommodityCode();
		String[] commodityCode=allCode.split(",");
		model.setCommodityCode(null);
		List<ShoppingCartModel> list=shoppingCartMapper.selectAll(model);
		for(ShoppingCartModel scm:list){
			for(String c:commodityCode){
				if(c.equals(scm.getCommodityCode())){
					shoppingCartMapper.del(scm);
				}
			}
		}
		return "1";
	}
}
