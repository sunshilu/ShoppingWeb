<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login2.css" />
<title>Insert title here</title>
</head>
<body>
	<!-- SDK 登录 -->
	<div class="w">
		<div id="logo">
			<a href="" clstag="pageclick|keycount|20150112ABD|45"> <img
				width="170" height="60" alt="京东"
				src="${pageContext.request.contextPath}/img/logo-201305-b.png">
			</a> <b></b>
		</div>
	</div>
	<div id="content">
		<div class="login-wrap">
			<div class="w">
				<div class="login-form">
					<div class="tips-wrapper">
						<div class="tips-inner">
							<div class="cont-wrapper">
								<i class="icon-tips"></i>
								<p>京东不会以任何理由要求您转账汇款，谨防诈骗。</p>
							</div>
						</div>
					</div>
					<div class="login-box" style="display: block; visibility: visible;">
						<div class="mt tab-h"></div>
						<div class="msg-wrap">
							<div class="msg-error hide">
								<b></b>
							</div>
						</div>
						<div class="mc">
							<div class="form">
								<form id="formlogin" method="post"class="layui-form">
									<div class="item item-fore1">
										<label class="login-label name-label" for="loginname"></label>
										<input name="code" tabindex="1" class="itxt"
											id="loginname" type="text" placeholder="邮箱/用户名/已验证手机"
											value="17865426360" autocomplete="off"> <span
											class="clear-btn" style="display: inline;"></span>
									</div>

									<div class="item item-fore2" id="entry"
										style="visibility: visible;">
										<label class="login-label pwd-label" for="nloginpwd"></label>
										<input name="password" tabindex="2" class="itxt itxt-error"
											id="nloginpwd" type="password" placeholder="密码"
											autocomplete="off"> <span class="clear-btn"></span> <span
											class="capslock" style="display: none;"><b></b>大小写锁定已打开</span>
									</div>


									<div class="item item-vcode item-fore3" id="o-authcode">
										<img
											src="${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();"
											alt="图片未加载"
											onclick="this.src='${pageContext.request.contextPath}/captcha/vCode.do?'+Math.random();">

										<input name="vCode" tabindex="3" class="itxt itxt02"
											id="authcode" style="ime-mode: disabled;" type="text">
									</div>

									<div class="item item-fore5">
										<div class="login-btn">
											<a tabindex="6" class="btn-img btn-entry" id="loginsubmit"
												href="javascript:;" lay-submit lay-filter="login"
												clstag="pageclick|keycount|login_pc_201804112|12">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="coagent" id="kbCoagent">
						<ul>
							<li class="extra-r">
								<div>
									<div class="regist-link">
										<a href="" target="_blank"
											clstag="pageclick|keycount|login_pc_201804112|5"><b></b>立即注册</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="login-banner" style="background-color: #e93854">
				<div class="w">
					<div class="i-inner" id="banner-bg"
						style="background: url(${pageContext.request.contextPath}/img/5aa68632Nd7790d0c.png) 0px 0px no-repeat; background-color: #e93854"
						clstag="pageclick|keycount|20150112ABD|46"></div>
				</div>
			</div>
		</div>
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
						location.href = con.app + con.user_main;
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