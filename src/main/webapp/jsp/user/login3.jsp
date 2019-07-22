<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login3.css">
</head>
<body>
	<div id="main">
		<div id="header"></div>
		<div class="container">
			<div class="bgPic">
				<img src="${pageContext.request.contextPath}/img/b3_1.jpg" alt="">
			</div>
			<div class="register">
				<div class="title">
					<span>登录</span> <a href="${pageContext.request.contextPath}/jsp/web/reg.jsp">去注册</a>
				</div>
				<form autocomplete="off" class="layui-form">
					<div class="default">
						<p>请输入用户名或手机号码</p>
						<input id="uname" name="code" data-form="uname" type="text"placeholder="请输入账号">
					</div>
					<div class="default">
						<p>请输入账号密码</p>
						<input id="upwd" name="password" data-form="upwd" type="password"placeholder="请输入密码">
					</div>
					<div class="default"style="display:inline">

						<img
							src="${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();"
							alt="图片未加载"
							onclick="this.src='${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();">
					</div>
					<div class="default" style="display:inline">
						<input type="text" name="vCode" required lay-verify="required"
							placeholder="请输入验证码" autocomplete="off" class="layui-input">
					</div>
					<div class="submit">
						<button type="button" class="s_hover" data-form="submit"
							lay-submit lay-filter="login">登录</button>
					</div>
				</form>
				<div class="other_login">
					<div class="log">
						<span>社交账号登录</span>
					</div>
					<div class="icon">
						<ul>
							<li data-log="icon" class="i_hover"><img data-icon="wx"
								src="${pageContext.request.contextPath}/img/wx.png" alt="">
								<span class="prompt">微信登录</span></li>
							<li data-log="icon" class="i_hover"><img data-icon="qq"
								src="${pageContext.request.contextPath}/img/qq.png" alt="">
								<span class="prompt">QQ登录</span></li>
							<li data-log="icon" class="i_hover"><img data-icon="wb"
								src="${pageContext.request.contextPath}/img/wb.png" alt="">
								<span class="prompt">微博登录</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
	<script>
		form.on('submit(login)', function(data) {
			console.log(data.field);
			$.ajax({
				url : con.app + "/loginAndReg/login.do",
				data : data.field,
				dataType : 'text',
				type : 'post',
				success : function(data) {
					if (data == 0) {
						layer.msg('账号不存在！');
					} else if (data == 1) {
						layer.msg('登录成功！');
						location.href = con.app + con.home;
					} else if (data == 3) {
						layer.msg('验证码错误！')
					} else if (data == 2) {
						layer.msg('密码错误！');
					} else if (data == 4) {
						layer.msg('权限错误！');
					}
				}
			});
		});
		var form = layui.form;
		form.render();
	</script>

</body>
</html>