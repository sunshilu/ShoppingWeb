<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title">订单信息维护</h2>
			<div class="layui-colla-content layui-show">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 0px; padding: 5px">
					<legend>订单信息-查询条件</legend>
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">订单编号</label>
							<div class="layui-input-inline">
								<input type="text" name="code" readonly placeholder="请输入编号"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">用户编号</label>
							<div class="layui-input-inline">
								<input type="text" name="userCode" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">订单时间</label>
							<div class="layui-input-inline">
								<input type="text" id="test1" name="time" autocomplete="off"
									class="layui-input">
							</div>
							<label class="layui-form-label">地址编号</label>
							<div class="layui-input-inline">
								<input type="text" name="addressCode" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">状态</label>
							<div class="layui-input-inline">
								<select name="state">
									<option value="">未知</option>
									<option value="未付款">未付款</option>
									<option value="已付款">已付款</option>
								</select>
							</div>
						</div>
						<input type="hidden" name="pageIndex" value="1" /> <input
							type="hidden" name="pageLimit" value="10" />
						<div class="layui-form-item">
							<label class="layui-form-label"></label>
							<div class="layui-input-inline">
								<input type="button" class="layui-btn" lay-submit
									lay-filter="user_search" value="查询" /> <input type="button"
									class="layui-btn" onclick="closeThis()" value="取消" />
							</div>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="15%">
				<col width="10%">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>订单编号</th>
					<th>用户编号</th>
					<th>订单时间</th>
					<th>收货地址</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	</div>
	<script type="text/javascript">
		form.render();
		formSubmit('/orderForm/search.do', 'submit(user_search)', 'json',
				function(data) {
					console.log("111" + data);
					var curr = $("input[name='pageIndex']").val();
					var limit = $("input[name='pageLimit']").val();
					setPageInfo('pageInfoUser', data.count, curr, limit,
							function(obj, first) {
								$("input[name='pageIndex']").val(obj.curr);
								$("input[name='pageLimit']").val(obj.limit);
								if (!first) {
									refresh();
								}//首次不执行
							});
					console.log(data);

					var html = "";//加载表格中数据
					$.each(data.list, function(i, dom) {
						var d = {
							i : (i + 1 + (curr - 1) * limit),
							code : dom.code,
							userCode : dom.userCode,
							time : dom.time,
							addressCode : dom.addressCode,
							state : dom.state,
						};
						html += getlaytpl('#tradd', d);// html += laytpl($("#tradd").html()).render(d);
					});
					$("#user_tbody").html(html);

					//加载商品分类下拉框内容
					console.log(data.list2);
					var html = "";
					$.each(data.list2, function(i, dom) {
						var code = dom.code;
						var name = dom.name;
						var d2 = {
							code : code,
							name : name
						}
						html += getlaytpl("#model2", d2);
					});
					$("select[name='commodityTypeCode']").html(html);
					form.render();
				});
		refresh();
		function refresh() {
			$("input[value='查询']").click();
		}
		function openAdd() {
			openLayer('/jsp/administrator/orderFormManage/add.jsp', refresh)
		}
		function openUpd(code) {
			openLayer(
					'/jsp/administrator/orderFormManage/upd.jsp?code=' + code,
					refresh)
		}
		function openDetail(code) {
			openLayer(
					'/jsp/administrator/orderFormManage/commodities.jsp?code='
							+ code, refresh)
		}
		function del(code) {
			openConfirm(function(index) {
				ajax('/orderForm/del.do', {
					code : code
				}, 'text', function(data) {
					console.log(data);
					if (data == 1) {
						layer.msg('删除成功');
						$("input[name='pageIndex']").val(1);
					} else if (data == 2) {
						layer.msg('删除失败--账号已被使用');
					} else if (data == 3) {
						layer.msg('删除失败--当前账号不存在');
					}
					refresh();
				})
			})
		}
	</script>
	<script id="tradd" type="text/html">
<tr>
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.userCode }}</td>
<td>{{ d.time }}</td><td>{{ d.addressCode }}</td>
<td>{{ d.state }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:del('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
<input type='button' value='商品列表' class='layui-btn' 
           onclick='openDetail("{{ d.code }}")'/>&nbsp;
</td>
</tr>
</script>
	<script id="model2" type="text/html">
<option value="{{d.code}}">{{d.name}}</option>
</script>

</body>
</html>