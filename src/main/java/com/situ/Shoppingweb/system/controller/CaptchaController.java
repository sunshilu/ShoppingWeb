package com.situ.Shoppingweb.system.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/captcha")
public class CaptchaController {

	@ResponseBody
	@RequestMapping("/vCode")
	public String vCode(HttpServletRequest request, HttpServletResponse response) {
		Random r = new Random();
		char[] chs = "1234567890".toCharArray();
		int IMG_WIDTH = 75;
		int IMG_HEIGHT = 25;
		int NUMBER_OF_CHS = 4;

		BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB); // 实例化BufferedImage
		// Graphics2D g = (Graphics2D) image.getGraphics();
		Graphics2D g = image.createGraphics();
		g.setColor(new Color(200, 200, 255));// 验证码图片的背景颜色
		g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT); // 图片的边框
		g.setFont(new Font("隶书", Font.BOLD, 15));// 设定字体

		StringBuffer sb = new StringBuffer(); // 用于保存验证码字符串
		for (int i = 0; i < NUMBER_OF_CHS; i++) {
			int index = r.nextInt(chs.length); // 随机一个下标
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255))); // 随机一个颜色
			g.drawString(chs[index] + "", 15 * i + 3, 18); // 画出字符
			sb.append(chs[index]); // 验证码字符串
		}

		request.getSession().setAttribute("authCode", sb.toString()); // 将验证码字符串保存到session中
		System.out.println(sb.toString());
		try {
			ImageIO.write(image, "jpg", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 向页面输出图像
		return null;

	}
}
