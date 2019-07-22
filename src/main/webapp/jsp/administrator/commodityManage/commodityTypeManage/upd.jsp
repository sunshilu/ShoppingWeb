<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>分类维护--修改信息</legend>
		<form class="layui-form" lay-filter="upduser" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">分类编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" readonly lay-verify="required"
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
    		ajax("/commodityType/selectBox.do", {}, "json", function(data){
    			console.log(data);
				var html="";
				$.each(data,function(i,dom){
					var d={
						code:dom.code?dom.code:"",
						name:dom.name?dom.name:""
					}
					html+=getlaytpl("#tradd",d);
				});
				$("select[name='parentCode']").html(html);
				form.render();
    		});
			$.ajax({
				url : con.app + '/commodityType/initUpd.do',
				data : {
					code : code
				},
				dataType : 'json',
				type : 'post',
				success : function(data) {
					console.log(data);
					form.val("upduser", {
						name : data.name,
						code : data.code,
						description:data.description,
						parentCode:data.parentCode ? data.parentCode:""
					});
					form.render();
				}
			})
		}
		formSubmit('/commodityType/upd.do', 'submit(updUser)', 'text',
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