<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="DeathGhost">
<meta name="description" content="DeathGhost">
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cart.css">
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
<script>
	$(document).ready(function() {
		$("nav .indexAsideNav").hide();
		$("nav .category").mouseover(function() {
			$(".asideNav").slideDown();
		});
		$("nav .asideNav").mouseleave(function() {
			$(".asideNav").slideUp();
		});
	});
</script>
</head>
<body>
	<%@include file="/jsp/web/header2.jsp"%>
	<section class="wrap" style="margin-top:20px;overflow:hidden;">
	<form class="layui-form" lay-filter="upduser" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input readonly type="text" name="code" readonly lay-verify="required"
						placeholder="请输入编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="state">
						<option  value="">未知</option>
						<option value="未付款">未付款</option>
						<option value="已付款">已付款</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">订单时间</label>
				<div class="layui-input-inline">
					<input readonly type="text" id="test1" name="time" autocomplete="off"
						class="layui-input">
				</div>
				<label class="layui-form-label">地址</label>
				<div class="layui-input-inline">
					<input readonly type="text" name="addressCode" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</form>
	
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>商品列表</legend>
		</fieldset>

		<div class="layui-upload">
			<div class="layui-upload-list">
				<table class="layui-table">
					<thead>
						<tr>
							<th>商品图片</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="demoList2"></tbody>
				</table>
			</div>
		</div></section>
		<script>
			var code = '<%=request.getParameter("code")%>';
			init();

			function init() {
				//加载订单信息
				$.ajax({
					url : con.app + '/orderForm/initUpd.do',
					data : {
						code : code
					},
					dataType : 'json',
					type : 'post',
					success : function(data) {
						console.log(data);
						console.log(data.commodityTypeCode);
						form.val("upduser", {
							code : data.code,
							userCode : data.userCode,
							time : data.time,
							addressCode : data.addressCode,
							state : data.state,
						});
						form.render();
					}
				});
				//加载订单商品
				ajax(
					'/orderFormCommodity/getList.do', {
						orderFormCode: code
					},
					"json",
					function(data) {
						console.log(data);
						var html = "";
						$.each(data.list, function(i, dom) {
							// 						html+=getlaytpl("#tradd", data);
							html += '<tr><td><img src="/image/' + dom.mainPic + '"></td><td>'+dom.quantity+'</td><td>'+dom.price+'</td><td>' +
								'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete" onclick="del(\'' +
								dom.commodityCode +
								'\')">删除</button>&nbsp' +
								'<button class="layui-btn" onclick="upd(\'' +
								dom.commodityCode +
								'\')">修改</button></td></tr>';
						});
						$("#demoList2").html(html);
						form.render();
					})
			}

			function upd(name) {
				console.log(name);
				openConfirm(function(index) {
					ajax('/picture/upd.do', {
						name: name
					}, 'json', function(data) {
						console.log(data);
						if (data == 1) {
							layer.msg('设置成功');
							$("input[name='pageIndex']").val(1);
						} else if (data == 2) {
							layer.msg('设置主图失败');
						}
						init();
					})
				})
			}

			function del(commodityCode) {
				console.log(commodityCode);
				openConfirm(function(index) {
					ajax('/orderFormCommodity/del.do', {
						orderFormCode: code,
						commodityCode: commodityCode
					}, 'json', function(data) {
						console.log(data);
						if (data == 1) {
							layer.msg('删除成功');
							$("input[name='pageIndex']").val(1);
						} else if (data == 2) {
							layer.msg('删除失败--商品不存在');
						}
						init();
					})
				})
			}
		</script>

</body>
</html>