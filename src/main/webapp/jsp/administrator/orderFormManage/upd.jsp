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
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code" readonly lay-verify="required"
						placeholder="请输入编号" autocomplete="off" class="layui-input">
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
	laydate.render({
		elem: '#test1', //指定元素
		type: 'datetime'
	});
	form.render();
init();
function init(){
	
    var code = '<%=request.getParameter("code")%>';
				
// 				初始化修改页面
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
				})
		}
		formSubmit('/orderForm/upd.do', 'submit(updUser)', 'text',
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