package com.situ.Shoppingweb.system.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.situ.Shoppingweb.system.model.CommodityPictureModel;
import com.situ.Shoppingweb.system.service.IPictureService;
import com.situ.Shoppingweb.util.FmtEmpty;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/picture")
public class PictureController {

	@Autowired
	private IPictureService prictureService;

	private String PATH = "D:/image/";

	@RequestMapping("/upload")
	@ResponseBody
	public String upload(HttpServletRequest request, String code) throws IllegalStateException, IOException {
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator<String> iter = multiRequest.getFileNames();
			// 一次遍历所有文件
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					String filename = file.getOriginalFilename();
					String saveName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
					String path = PATH + saveName;
					file.transferTo(new File(path));// 上传
					prictureService.insert(new CommodityPictureModel(code, saveName, "2"));
				}
			}
		}
		Map<String, String> result = new HashMap<>();
		result.put("code", "0");
		return JSONObject.fromObject(result).toString();
	}

	@RequestMapping(value = "getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	private String getList(CommodityPictureModel productPicModel) {
		System.out.println("commodityCode======"+productPicModel.getCommodityCode());
		// productPicModel.setOrderby("type");
		Map<String, Object> map = new HashMap<>();
		map.put("list", prictureService.selectAll(productPicModel));
		System.out.println(map);
		return JSONObject.fromObject(map).toString();
	}

	@RequestMapping("del")
	@ResponseBody
	public String del(CommodityPictureModel commodityPictureModel) {
		File file = new File(PATH + commodityPictureModel.getName());
		file.delete();
		return prictureService.deleteModel(commodityPictureModel) + "";
	}

	@RequestMapping("upd")
	@ResponseBody
	public String setMain(CommodityPictureModel productPicModel) {
//		Integer id = productPicModel.getId();
		String name=productPicModel.getName();
		CommodityPictureModel t = new CommodityPictureModel();
		t.setCommodityCode(productPicModel.getCommodityCode());
		// t.setType("2");
		// productPicService.updateActive(t);
		// t = new ProductPicModel();
		// t.setId(id);
		// t.setType("1");
		// productPicService.updateActive(t);
		List<CommodityPictureModel> list = prictureService.selectAll(t);
		System.out.println("设为主图操作"+list);
		for (CommodityPictureModel ppm : list) {
			// if (id.equals(ppm.getId())) {
			// ppm.setType("1");
			// } else {ppm.setType("2");}
			if (name.equals(ppm.getName())) {
				ppm.setType("1");
				System.out.println("修改为主图");
			} else if (ppm.getType().equals("1")) {
				ppm.setType("2");
			} else {
				continue;
			}
			prictureService.updType(ppm);
		}
		return "1";
	}
}
