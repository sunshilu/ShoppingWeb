<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>商品维护--修改信息</legend>
		<form class="layui-form" lay-filter="upduser" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">一级分类</label>
				<div class="layui-input-inline">
					<select name="parentCode" lay-filter="selectChange"></select>
				</div>
				<label class="layui-form-label">二级分类</label>
				<div class="layui-input-inline">
					<select name="commodityTypeCode"></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" lay-verify="required" readonly
						placeholder="请输入编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单价</label>
				<div class="layui-input-inline">
					<input type="text" name="unitPrice" autocomplete="off"
						class="layui-input">
				</div>
				<label class="layui-form-label">库存</label>
				<div class="layui-input-inline">
					<input type="text" name="inventory" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品描述</label>
				<div class="layui-input-inline">
					<textarea name="description" placeholder="请输入内容"
						class="layui-textarea"></textarea>
				</div>
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<select name="state">
						<option value="">未知</option>
						<option value="上架">上架</option>
						<option value="下架">下架</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit
						lay-filter="updUser" value="确定" /> <input type="button"
						class="layui-btn" onclick="closeThis()" value="取消" />
				</div>
			</div>
		</form>
	</fieldset>
	<script type="text/javascript">
init();
function init(){
	
    var code = '<%=request.getParameter("code")%>';
			ajax("/commodity/selectBox.do", {}, "json", function(data) {
				console.log(data);
				//加载一级分类的选项
				var html = '<option value="">未选择</option>';
				$.each(data, function(i, dom) {
					html += getlaytpl("#tradd", dom);
				});
				$("select[name='parentCode']").html(html);
				form.render();
				
// 				初始化修改页面
				$.ajax({
					url : con.app + '/commodity/initUpd.do',
					data : {
						code : code
					},
					dataType : 'json',
					type : 'post',
					success : function(d) {
						//加载二级分类的选项
		 				var html2 = '';
		 				$.each(d.list, function(i, dom) {
		 					html2 += getlaytpl("#tradd", dom);
		 				});
		 				$("select[name='commodityTypeCode']").html(html2);
						
						var data=d.model;
						console.log(data);
						console.log(data.commodityTypeCode);
						form.val("upduser", {
							code : data.code,
							name : data.name,
							unitPrice : data.unitPrice,
							description : data.description,
							inventory : data.inventory,
							state : data.state,
							parentCode:data.parentCode,
							commodityTypeCode : data.commodityTypeCode
							
						});
						form.render();
					}
				})
			});
		}
form.on('select(selectChange)', function(data) {
// 	$("select[name='commodityTypeCode']").removeAttr("disabled");
	//console.log(data.elem); //得到select原始DOM对象
	//console.log(data.othis); //得到美化后的DOM对象
	console.log(data.value); //得到被选中的值
	ajax("/commodity/selectNextBox.do", {parentCode:data.value}, "json", function(data) {
		console.log(data);
		var html = "";
		$.each(data, function(i, dom) {
			var code = dom.code;
			var name = dom.name;
			var d = {
				code : code,
				name : name
			}
			html += getlaytpl("#tradd", d);
		});
		$("select[name='commodityTypeCode']").html(html);
		form.render();
	});
});
		formSubmit('/commodity/upd.do', 'submit(updUser)', 'text',
				function(data) {
					if (data == 1) {
						layer.msg('修改成功');
						closeThis(1000);
					} else {
						layer.msg('修改失败');
					}
				});
	</script>
	<script id="tradd" type="text/html">
	<option value="{{d.code}}">{{d.name}}</option>
</script>
</body>
</html>