<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<%@include file="/jsp/header.jsp" %>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">用户</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"><%=request.getSession().getAttribute("userCode") %>
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:close()">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class=""
						href="javascript:;">个人信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a
									href="javascript:openUrl('${pageContext.request.contextPath}/jsp/administrator/userManage/upd.jsp?code=' + <%=request.getSession().getAttribute("userCode")%>);">个人信息维护</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">收货地址管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:openUrl('http://localhost:8081/Shoppingweb/jsp/user/addressManage/list.jsp');">收货地址维护</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:openUrl('http://localhost:8081/Shoppingweb/jsp/user/orderFormManage/list.jsp');">订单信息维护</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">发布商品</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<!--<div style="padding: 15px;">内容主体区域</div> -->
			<iframe name='rightframe' id="if1" width="100%" height="100%"></iframe>

		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		</div>
	</div>
	<script>
		openUrl('http://localhost:8081/Shoppingweb/jsp/user/firstPage.jsp');
	
		element.render();
		function openUrl(url) {
			window.open(url, "rightframe");
		
		}
		function close(){
			ajax("/loginAndReg/loginOut.do", {}, "text", function(data){
				if(data=="0"){
					location.href=con.app + "/jsp/web/home.jsp";
				}
			})
		}
	</script>

</body>
</html>