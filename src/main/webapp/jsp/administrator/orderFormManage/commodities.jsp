<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
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
		</div>
		<script>
			var code = '<%=request.getParameter("code")%>';
			init();

			function init() {
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