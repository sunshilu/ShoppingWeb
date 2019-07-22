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
			<h2 class="layui-colla-title">商品分类维护</h2>
			<div class="layui-colla-content layui-show">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 0px; padding: 5px">
					<legend>分类信息-查询条件</legend>
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">分类编号</label>
							<div class="layui-input-inline">
								<input type="text" name="code" autocomplete="off"
									class="layui-input">
							</div>
							<label class="layui-form-label">分类名称</label>
							<div class="layui-input-inline">
								<input type="text" name="name" autocomplete="off"
									class="layui-input">
							</div>
							<label class="layui-form-label">分类级别</label>
							<div class="layui-input-inline">
								<select name="level" lay-verify="required">
									<option value="0">全部</option>
									<option value="一级分类">一级分类</option>
									<option value="二级分类">二级分类</option>
								</select>
							</div>
							<label class="layui-form-label"></label> <span> <input
								type="button" class="layui-btn" lay-submit
								lay-filter="user_search" value="查询" /> <input type="reset"
								class="layui-btn" value="重置" /> <input type="button"
								class="layui-btn" value="添加" onclick="openAdd()" />
							</span>
						</div>
						<input type="hidden" name="pageIndex" value="1" /> <input
							type="hidden" name="pageLimit" value="10" />
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="10%">
				<col width="30%">
				<col width="15%">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>分类编号</th>
					<th>分类名称</th>
					<th>分类描述</th>
					<th>上级分类</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="user_tbody"></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	</div>
	<script type="text/javascript">
		form.render();
		formSubmit('/commodityType/search.do', 'submit(user_search)', 'json',
				function(data) {// console.log(data)
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
						var code = dom.code ? dom.code : '';
						var name = dom.name ? dom.name : '';
						var description = dom.description ? dom.description
								: '';
						var parentCode = dom.parentCode ? dom.parentCode : '';
						var parentName = dom.parentName ? dom.parentName : '';
						var d = {
							i : (i + 1 + (curr - 1) * limit),
							name : name,
							code : code,
							description : description,
							parentCode : parentCode,
							parentName : parentName
						};
						html += getlaytpl('#tradd', d);// html += laytpl($("#tradd").html()).render(d);
					});
					$("#user_tbody").html(html);
				});
		refresh();
		function refresh() {
			$("input[value='查询']").click();
		}
		function openAdd() {
			openLayer(
					'/jsp/administrator/commodityManage/commodityTypeManage/add.jsp',
					refresh)
		}
		function openUpd(code) {
			openLayer(
					'/jsp/administrator/commodityManage/commodityTypeManage/upd.jsp?code='
							+ code, refresh)
		}
		function del(code) {
			openConfirm(function(index) {
				ajax('/commodityType/del.do', {
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
<td>{{ d.i }}</td><td>{{ d.code }}</td><td>{{ d.name }}</td>
<td>{{ d.description }}</td><td>{{ d.parentName }}</td>
<td>
    <input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
    <a href="javascript:del('{{ d.code }}')" 
       class="layui-btn layui-btn-xs layui-btn-danger">
        <i class="layui-icon layui-icon-delete"></i></a>&nbsp;
</td>
</tr>
</script>

</body>
</html>