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
		<legend>用户维护--修改信息</legend>
		<form class="layui-form" lay-filter="upduser" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" readonly lay-verify="required"
						placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="text" name="password" placeholder="请输入姓名"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入姓名"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<%if(request.getSession().getAttribute("adminCode")!=null){ %>
			<div class="layui-form-item">
				<label class="layui-form-label">类别</label>
				<div class="layui-input-inline">
						<select name="type">
						<option value="user">用户</option>
						<option value="admin">管理员</option>
						</select>
				</div>
			</div>
			<%} %>
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
	var userCode = '<%=request.getSession().getAttribute("userCode")%>';
	var adminCode = '<%=request.getSession().getAttribute("adminCode")%>';
	console.log("u"+userCode+"a"+adminCode);
init();
function init(){
	
    var code = '<%=request.getParameter("code")%>';
			$.ajax({
				url : con.app + '/user/initUpd.do',
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
						password:data.password,
						type:data.type
					});
					form.render();
				}
			})
		}
		formSubmit('/user/upd.do', 'submit(updUser)', 'text',
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
	<option value="{{d.value1}}">{{d.value}}</option>
</script>
</body>
</html>