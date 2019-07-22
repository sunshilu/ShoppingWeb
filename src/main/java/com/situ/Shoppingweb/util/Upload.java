package com.situ.Shoppingweb.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload {
	public static String upload(HttpServletRequest request, int d)
			throws FileUploadException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		System.out.println(request.toString());
		List<FileItem> items = upload.parseRequest(request);
		
		String fn=null;
		int i = 1;
		for (FileItem item : items) {
			if (!item.isFormField()) {
				// 文本域表单元素-复制文件
				InputStream is = item.getInputStream();
				byte[] b = new byte[1024 * 1024];
				int length = is.read(b);// 没有读到数据就返回-1
				if (length < 0)
					continue;
				fn = getFName();
				System.out.println(fn);
				OutputStream fos = new FileOutputStream(getFPath() + "/" + fn);
				fos.write(b, 0, length);
				fos.flush();
				fos.close();
				is.close();
				// request.setAttribute("fn" + i++, "/image/" + fn);// 虚拟路径+文件名
			}
		}
		return fn;
	}

	public static Map<String, Object> upload(HttpServletRequest request) throws FileUploadException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items = upload.parseRequest(request);
		Map<String, Object> map = new HashMap<>();
		List<String> filename = new ArrayList<>();
		int i = 1;
		for (FileItem item : items) {
			if (item.isFormField()) {// isFormField()判断是否为文本域表单元素
				if (item.getString().equals("")) {
					continue;
				}
				System.out.println("1--" + item.getFieldName());// 获得元素名
				String value = item.getString();
				value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
				map.put(item.getFieldName(), value);
				System.out.println("2--" + value);
			} else {// 文本域表单元素-复制文件
				InputStream is = item.getInputStream();
				byte[] b = new byte[1024 * 1024];
				int length = is.read(b);// 没有读到数据就返回-1
				if (length < 0)
					continue;
				String fn = getFName();
				System.out.println(fn);
				OutputStream fos = new FileOutputStream(getFPath() + "/" + fn);
				fos.write(b, 0, length);
				fos.flush();
				fos.close();
				is.close();
				filename.add(fn);
				// request.setAttribute("fn" + i++, "/image/" + fn);// 虚拟路径+文件名
			}
		}
		map.put("list", filename);
		return map;
	}

	private static File getFPath() {
		File f = new File("D:/workspace/image");
		if (!f.exists()) {
			f.mkdirs();// 如果不存在文件夹，就创建
		}
		return f;
	}

	private static String getFName() {
		// 根据时间戳创建文件名
		// String fileName = System.currentTimeMillis() + ".jpg";
		// 随机数创建文件名
		String fileName = UUID.randomUUID().toString() + ".jpg";
		return fileName;
	}
}
