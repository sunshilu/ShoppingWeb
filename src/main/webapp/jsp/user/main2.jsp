<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
 <!--右侧：内容区域-->
 <div class="user_rt_cont">
  <div class="top_title">
   <strong><em>DeathGhost</em>欢迎回到用户中心</strong>
  </div>
  <!--用户信息-->
  <div class="user_factbook">
   <a class="user_icon" href="profile.html">
    <img src="images/icon/DefaultAvatar.jpg">
    <span>修改头像</span>
   </a>
   <div class="user_infor">
    <p><strong>DeathGhost</strong>（商户会员）<span class="user_vip unaccredited">未认证！</span><a href="authenticate.html">申请入驻</a></p><!--**未认证的class值为"unaccredited"**-->
    <p>上次登录时间：<time>2013-01-14 13:55</time>，登录ip：192.168.1.1</p>
    <p>账户余额：<strong class="rmb_icon">0.00</strong><a class="btn" href="account.html">充值</a><a class="btn" href="account.html">提现</a></p>
   </div>
  </div>
  <!--买家订单提醒-->
  <dl class="user_order_tips">
   <dt>买家订单提醒</dt>
   <dd>
    <a href="order_list.html">
     <strong>20</strong>
     <em>待付款订单</em>
    </a>
   </dd>
   <dd>
    <a href="order_list.html">
     <strong>10</strong>
     <em>待发货订单</em>
    </a>
   </dd>
   <dd>
    <a href="order_list.html">
     <strong>30</strong>
     <em>待确认订单</em>
    </a>
   </dd>
   <dd>
    <a href="order_list.html">
     <strong>15</strong>
     <em>待评价订单</em>
    </a>
   </dd>
  </dl>
  <!--卖家订单提醒-->
  <dl class="user_order_tips">
   <dt>卖家订单提醒</dt>
   <dd>
    <a href="#">
     <strong>9</strong>
     <em>待付款订单</em>
    </a>
   </dd>
   <dd>
    <a href="#">
     <strong>10</strong>
     <em>待发货订单</em>
    </a>
   </dd>
   <dd>
    <a href="#">
     <strong>20</strong>
     <em>待评价订单</em>
    </a>
   </dd>
   <dd>
    <a href="#">
     <strong>2</strong>
     <em>退换货订单</em>
    </a>
   </dd>
  </dl>
 </div>
</section>
	
	<%@include file="/jsp/web/footer.jsp"%>
</body>
</html>