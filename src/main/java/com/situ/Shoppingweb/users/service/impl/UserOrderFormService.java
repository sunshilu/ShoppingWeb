package com.situ.Shoppingweb.users.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.Shoppingweb.system.mapper.CommodityMapper;
import com.situ.Shoppingweb.system.mapper.OrderFormCommodityMapper;
import com.situ.Shoppingweb.system.mapper.OrderFormMapper;
import com.situ.Shoppingweb.system.model.CommodityModel;
import com.situ.Shoppingweb.system.model.OrderFormCommodityModel;
import com.situ.Shoppingweb.system.model.OrderFormModel;
import com.situ.Shoppingweb.users.mapper.ShoppingCartMapper;
import com.situ.Shoppingweb.users.model.ShoppingCartModel;
import com.situ.Shoppingweb.users.service.IUserOrderFormService;
import com.situ.Shoppingweb.util.FmtEmpty;

@Service
public class UserOrderFormService implements IUserOrderFormService {
	
	@Autowired
	private OrderFormMapper orderFormMapper;
	@Autowired
	private OrderFormCommodityMapper orderFormCommodityMapper;
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	@Autowired
	private CommodityMapper commodityMapper;

	@Override
	public String add(String address, String code,HttpServletRequest request) {
		String[] commodityCode=code.split(",");
		String userCode=(String)request.getSession().getAttribute("userCode");
		ShoppingCartModel model=new ShoppingCartModel();
		model.setUserCode(userCode);
		List<ShoppingCartModel> list=shoppingCartMapper.selectAll(model);
		String orderFormCode=UUID.randomUUID().toString();
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sdf.format(date);
		int f=1;
		for(String c:commodityCode){
		for(ShoppingCartModel scm:list){
			
				if(c.equals(scm.getCommodityCode())){
					OrderFormModel ofm =new OrderFormModel(orderFormCode,userCode,time, address, "未付款");
					if(FmtEmpty.isEmpty(orderFormMapper.selectModel(orderFormCode))){orderFormMapper.insert(ofm);}
					CommodityModel cm=commodityMapper.selectModel(c);
					Integer mul=Integer.parseInt(cm.getUnitPrice())*scm.getQuantity();
					OrderFormCommodityModel ofcm=new OrderFormCommodityModel(ofm.getCode(), c , scm.getQuantity(), mul.toString(),cm.getMainPic());
				int t=	orderFormCommodityMapper.insert(ofcm);
				if(t!=1){
					f=2;
				}
				shoppingCartMapper.del(scm);
				continue;
				}
			}
		}
		if(f==1){
			return "1";
		}else{
			return "0";
		}
		
	}
}
