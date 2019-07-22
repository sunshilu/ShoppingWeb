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
			<legend>高级应用：制作一个多文件列表</legend>
		</fieldset>

		<div class="layui-upload">
			<button class="layui-btn layui-btn-normal" id="testList" type="button">选择多文件</button>
			<button class="layui-btn" id="testListAction" type="button">开始上传</button>
			<div class="layui-upload-list">
				<table class="layui-table">
					<thead>
						<tr>
							<th>文件名</th>
							<th>大小</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="demoList"></tbody>
				</table>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>图片列表</legend>
		</fieldset>

		<div class="layui-upload">
			<div class="layui-upload-list">
				<table class="layui-table">
					<thead>
						<tr>
							<th>文件名</th>
							<th>图片</th>
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
				//多文件列表示例
				var demoListView = $('#demoList');
					uploadListIns = upload.render({
						elem: '#testList',
						url: con.app+'/picture/upload.do',
						data:{code:code},
						accept: 'images',
						multiple: true,
						auto: false,
						bindAction: '#testListAction',
						choose: function(obj) {
							var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
							//读取本地文件
							obj.preview(function(index, file, result) {
								var tr = $(['<tr id="upload-' + index + '">', '<td>' + file.name + '</td>', '<td>' + (file.size / 1014).toFixed(
										1) + 'kb</td>', '<td>等待上传</td>', '<td>',
									'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>',
									'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>', '</td>', '</tr>'
								].join(''));

								//单个重传
								tr.find('.demo-reload').on('click', function() {
									obj.upload(index, file);
								});

								//删除
								tr.find('.demo-delete').on('click', function() {
									delete files[index]; //删除对应的文件
									tr.remove();
									uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
								});

								demoListView.append(tr);
							});
						},
						done: function(res, index, upload) {
							if (res.code == 0) { //上传成功
								init()
								var tr = demoListView.find('tr#upload-' + index),
									tds = tr.children();
								tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
								tds.eq(3).html(''); //清空操作
								return delete this.files[index]; //删除文件队列已经上传成功的文件
							}
							this.error(index, upload);
						},
						error: function(index, upload) {
							var tr = demoListView.find('tr#upload-' + index),
								tds = tr.children();
							tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
							tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
						}
					});
			function init(){
				ajax('/picture/getList.do', {commodityCode:code}, "json", function(data){
					console.log(data);
					var html="";
					$.each(data.list,function(i,dom){
// 						html+=getlaytpl("#tradd", data);
						html+= '<tr><td>'+dom.name+'</td><td><img src="/image/'+dom.name+'"></td><td>'
						+'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete" onclick="del(\''+dom.name+'\')">删除</button>&nbsp'
						+'<button class="layui-btn" onclick="upd(\''+dom.name+'\')">设为主图</button></td></tr>';
					});
					$("#demoList2").html(html);
					form.render();
				})
			}
			function upd(name){
				console.log(name);
					openConfirm(function(index) {
						ajax('/picture/upd.do', {
							commodityCode:code,
							name:name
						}, 'json', function(data) {
							console.log(data);
							if (data == 1) {
								layer.msg('设置成功');
								$("input[name='pageIndex']").val(1);
							} else if (data == 2) {
								layer.msg('设置主图失败');
							}
							closeThis(500);
						})
					})
			}
			function del(name){
				console.log(name);
					openConfirm(function(index) {
						ajax('/picture/del.do', {
							name:name
						}, 'json', function(data) {
							console.log(data);
							if (data == 1) {
								layer.msg('删除成功');
								$("input[name='pageIndex']").val(1);
							} else if (data == 2) {
								layer.msg('删除失败--当前图片不存在');
							}
							init();
						})
					})
			}
		</script>
		<script id="#tradd" type="text/html"></script>
</body>
</html>