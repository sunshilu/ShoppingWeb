<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>登录</title>
</head>
<body>
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title" style="text-align:center">用户登录</h2>
			<div class="layui-colla-content layui-show" style="text-align:center">
				<fieldset class="layui-inline">
					<legend>登录</legend>
					<form method="post" class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">账号：</label>
							<div class="layui-input-inline">
								<input type="text" name="code" required lay-verify="required"
									placeholder="请输入管理员账号" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码：</label>
							<div class="layui-input-inline">
								<input type="password" name="password" required
									lay-verify="required" placeholder="请输入密码" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><img
								src="${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();"
								alt="图片未加载"
								onclick="this.src='${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();"></label>
							<div class="layui-input-inline">
								<input type="text" name="vCode" required lay-verify="required"
									placeholder="请输入验证码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button type="button" class="layui-btn" lay-submit
									lay-filter="login">登录</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
								<button type="button" class="layui-btn" onclick="goJspReg()">返回注册</button>
							</div>
						</div>
						
					</form>
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
										location.href = con.app + con.user_main;
									} else if (data == 3) {
										layer.msg('验证码错误！')
									} else if (data == 2) {
										layer.msg('密码错误！');
									} else if (data == 4){
										layer.msg('权限错误！');
									}
								}
							});
						});
						var form = layui.form;
						form.render();
					</script>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>