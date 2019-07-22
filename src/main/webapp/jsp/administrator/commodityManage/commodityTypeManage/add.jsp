<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%><title>Insert
	title here</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>用户维护--添加信息</legend>

		<form class="layui-form" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">分类编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" lay-verify="required"
						placeholder="请输入编号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">分类名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">分类描述</label>
				<div class="layui-input-inline">
					<textarea name="description" placeholder="请输入内容"
						class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">上级分类</label>
				<div class="layui-input-inline">
					<select name="parentCode"></select>
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
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit
						lay-filter="addUser" value="确定" /> <input type="button"
						class="layui-btn" onclick="closeThis()" value="取消" />
				</div>
			</div>
		</form>
	</fieldset>
	<script type="text/javascript">
		initSelect();
		function initSelect() {
			ajax("/commodityType/selectBox.do", {}, "json", function(data) {
				console.log(data);
				var html="";
				$.each(data,function(i,dom){
					var code= dom.code;
					var name= dom.name;
					var d={
						code:code,
						name:name
					}
					console.log(d);
					console.log(d.code);
					html+=getlaytpl("#tradd",d);
				});
				$("select[name='parentCode']").html(html);
				form.render();
			});
		}
		formSubmit('/commodityType/add.do', 'submit(addUser)', 'text', function(data) {
			if (data == 0) {
				layer.msg('添加成功');
			} else if (data == 1) {
				layer.msg('账号已存在');
			} else if (data == 3) {
				layer.msg('验证码错误');
			} else if (data == 2) {
				layer.msg('添加失败');
			}
			closeThis(1000);
		});
	</script>
<script id="tradd" type="text/html">
<option value="{{d.code}}">{{d.name}}</option>
</script>


</body>
</html>