<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login3.css">
<title>Insert title here</title>
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
					<span>注册</span> <a href="${pageContext.request.contextPath}/jsp/user/login3.jsp">去登录</a>
				</div>
				<form class="layui-form" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">账号</label>
						<div class="layui-input-inline">
							<input type="text" name="code" lay-verify="required"
								placeholder="请输入账号" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码</label>
						<div class="layui-input-inline">
							<input type="password" name="password" lay-verify="required"
								placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-inline">
							<input type="text" name="name" placeholder="请输入姓名"
								autocomplete="off" class="layui-input">
						</div>
					</div>
<!-- 					<div class="layui-form-item"> -->
<!-- 						<label class="layui-form-label">注册时间</label> -->
<!-- 						<div class="layui-input-inline"> -->
<!-- 							<input type="text" id="time" name="time" placeholder="请输入时间" -->
<!-- 								autocomplete="off" class="layui-input"> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="layui-form-item">
						<label class="layui-input-inline"><img
							src="${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();"
							alt="图片未加载"
							onclick="this.src='${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();"></label>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<input type="text" name="vCode" required lay-verify="required"
								placeholder="请输入验证码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="submit">
						<button type="button" class="s_hover" data-form="submit"
							lay-submit lay-filter="login">注册</button>
					</div>
				</form>
			</div>
		</div>
		<div id="footer"></div>
	</div>
	<script type="text/javascript">
		formSubmit('/user/add.do', 'submit(login)', 'text', function(data) {
			if (data == 0) {
				layer.msg('注册成功');
// 				window.location.href="${pageContext.request.contextPath}/jsp/web/home.jsp";
			} else if (data == 1) {
				layer.msg('账号已存在');
			} else if (data == 3) {
				layer.msg('验证码错误');
			} else if (data == 2) {
				layer.msg('注册失败');
			}
			closeThis(1000);
		});
		laydate.render({
			elem : '#time', //指定元素
			type : 'datetime'
		});
	</script>



</body>
</html>