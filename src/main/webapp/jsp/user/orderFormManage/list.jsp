<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
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
<style type="text/css">
.layui-btn{
background:#e4393c;
margin:2px}
</style>
</head>
<body>
<%@include file="/jsp/web/header2.jsp"%>
<section class="wrap user_center_wrap">
 <!--左侧导航-->
  <aside class="user_aside_nav">
  <dl>
   <dt>买家中心</dt>
   <dd><a href="order_list.html">我的订单</a></dd>
   <dd><a href="price_list.html">我的询价单</a></dd>
   <dd><a href="favorite.html">我的收藏</a></dd>
   <dd><a href="address.html">我的地址库</a></dd>
  </dl>
  <dl>
   <dt>商家管理中心</dt>
   <dd><a href="authenticate.html">我要开店</a></dd>
   <dd><a href="setting.html">店铺设置</a></dd>
   <dd><a href="seller_product_list.html">商品列表</a></dd>
   <dd><a href="seller_order_list.html">订单列表</a></dd>
   <dd><a href="offer_list.html">询价单</a></dd>
  </dl>
  <dl>
   <dt>控制面板</dt>
   <dd><a href="message.html">站内短消息</a></dd>
   <dd><a href="account.html">资金管理</a></dd>
   <dd><a href="profile.html">个人资料</a></dd>
   <dd><a href="change_password.html">修改密码</a></dd>
  </dl>
 </aside>
  <!--右侧导航-->
<div class="user_rt_cont">
  <div class="top_title">
   <strong>我的订单</strong>
  </div>
  <!--条件检索-->
  <div style="margin:8px 0;">
   <select class="select">
    <option>订单状态</option>
    <option>待付款</option>
    <option>待发货</option>
    <option>待确认</option>
    <option>待评价</option>
    <option>退货</option>
   </select>
   <input class="textbox textbox_225" type="text" placeholder="输入订单编号">
   <input class="group_btn" type="button" value="查询">
  </div>
  <ul class="orderForm order_li">
  </ul>
   <!--分页-->
   <input type="hidden" name="pageIndex" value="1" /> <input
							type="hidden" name="pageLimit" value="3" />
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
 </div>
</section>
	<%@include file="/jsp/web/footer.jsp"%>
	<script type="text/javascript">
	var userCode = '<%=request.getSession().getAttribute("userCode")%>';
		form.render();
		function processData(data){
			var curr = $("input[name='pageIndex']").val();
			var limit = $("input[name='pageLimit']").val();
			setPageInfoTheme('pageInfoUser', data.count, curr, limit,"#e4393c",
					function(obj, first) {
						$("input[name='pageIndex']").val(obj.curr);
						$("input[name='pageLimit']").val(obj.limit);
						if (!first) {
							refresh();
						}//首次不执行
					});
			console.log(data);

			var html = "";//加载表格中数据
			$.each(data.list, function(i, d) {
				html +='<li><table class="order_table"><caption>'+
				'<strong>订单编号：'+d.code+'</strong>'+
				'<a href="${pageContext.request.contextPath}/jsp/user/orderFormManage/orderFormDetail.jsp?code='+d.code+'">订单详情</a></caption>'+
				'<tbody id="orderFormCommodity'+d.code+'"></tbody></table></li>';
				$(".orderForm").html(html);
				ajax(
						'/orderFormCommodity/getList.do', {
							orderFormCode: d.code
						},
						"json",
						function(data) {
							console.log(data);
							var html2="";
							$.each(data.list, function(i, dom) {
								html2+='<tr><td class="center"><a href="${pageContext.request.contextPath}/jsp/web/productDetail.jsp?code='
									+ dom.commodityCode+'"><img style="width:50px;height:50px;" src="/image/' + dom.mainPic + '"></a></td>'
								+'<td><a href="${pageContext.request.contextPath}/jsp/web/productDetail.jsp?code='
									+ dom.commodityCode+'">'+dom.commodityName+'</a></td>'
								+'<td class="center"><span class="rmb_icon">'+dom.price+'</span></td>'
								+'<td class="center"><b>'+dom.quantity+'</b></td>'
								+'<td class="center"><strong class="rmb_icon">'+dom.price+'</strong></td>'
								+'</tr>';
							});
							$("#orderFormCommodity"+d.code).html(html2);
						});
			});
			form.render();
		}
		refresh();
		function refresh() {
			ajax("/orderForm/search.do", {userCode:userCode,pageIndex:$("input[name='pageIndex']").val(),pageLimit:$("input[name='pageLimit']").val()}, "json", function(data){
				processData(data);
			})
		}
		function openUpd(code) {
			openLayer(
					'/jsp/user/orderFormManage/updAddress.jsp?code='
							+ code, refresh)
		}
		function openDetail(code) {
			openLayer(
					'/jsp/administrator/orderFormManage/commodities.jsp?code='
							+ code, refresh)
		}
		function openPay(code) {
			openConfirm(function(index) {
				ajax('/orderForm/upd.do', {
					code : code,
					state:"已付款"
				}, 'text', function(data) {
					console.log(data);
					if (data == 1) {
						layer.msg('付款成功');
						$("input[name='pageIndex']").val(1);
					} else if (data == 0) {
						layer.msg('付款失败--当前订单不存在');
					}
					refresh();
				})
			})
		}
		function del(code) {
			openConfirm(function(index) {
				ajax('/orderForm/del.do', {
					code : code
				}, 'text', function(data) {
					console.log(data);
					if (data == 1) {
						layer.msg('取消订单成功');
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
<td style="text-align:center">{{ d.i }}</td><td>{{ d.code }}</td>
<td style="text-align:center">{{ d.time }}</td><td style="text-align:center">{{ d.addressCode }}</td>
<td style="text-align:center">{{ d.state }}</td>
<td style="text-align:center">
<div>
    <input type='button' value='修改地址' class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
	<input type='button' value='去付款' class='layui-btn' 
           onclick='openPay("{{ d.code }}")'/>&nbsp;</div><div>
	<input type='button' value='取消订单' class='layui-btn' 
           onclick='del("{{ d.code }}")'/>&nbsp;
	<input type='button' value='商品列表' class='layui-btn' 
           onclick='openDetail("{{ d.code }}")'/>&nbsp;</div>
</td>
</tr>
</script>
	<script id="model2" type="text/html">
<option value="{{d.code}}">{{d.name}}</option>
</script>

</body>
</html>