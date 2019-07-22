<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品详情</title>
<meta name="keywords" content="DeathGhost">
<meta name="description" content="DeathGhost">
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/product.css">
<script src="${pageContext.request.contextPath}/js/product.js"></script>
<script src="${pageContext.request.contextPath}/js/swiper.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("nav .indexAsideNav").hide();
				$("nav .category").mouseover(function() {
					$(".asideNav").slideDown();
				});
				$("nav .asideNav").mouseleave(function() {
					$(".asideNav").slideUp();
				});
				//detail tab
				$(".product_detail_btm .item_tab a").click(
						function() {
							var liindex = $(".product_detail_btm .item_tab a")
									.index(this);
							$(this).addClass("curr_li").parent().siblings()
									.find("a").removeClass("curr_li");
							$(".cont_wrap").eq(liindex).fadeIn(150).siblings(
									".cont_wrap").hide();
						});
				//radio
				$(".horizontal_attr label").click(
						function() {
							$(this).addClass("isTrue").siblings().removeClass(
									"isTrue");
						});
			});
</script>
</head>
<body>
	<%@include file="/jsp/web/header2.jsp"%>

	<!--导航指向-->
	<aside class="wrap insideLink"> <a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/index.html">首页</a>
	<a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product_list.html">时尚女装</a>
	</aside>
	<section class="wrap product_detail"> <!--img:left-->
	<div class="gallery">
		<div>
			<div id="preview" class="spec-preview">
				<span class="mainPic jqzoom"></span>
			</div>
			<!--缩图开始-->
			<div class="spec-scroll">
				<a class="prev">&lt;</a> <a class="next">&gt;</a>
				<div class="items">
					<ul>
						<li><img bimg="upload/goods.jpg" src="${pageContext.request.contextPath}/img/goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods004.jpg" src="./goods004small.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
						<li><img bimg="upload/goods.jpg" src="./goodssmall.jpg"
							onmousemove="preview(this);"></li>
					</ul>
				</div>
			</div>
			<!--缩图结束-->
		</div>
	</div>
	<!--text:right-->
	<div class="rt_infor">
		<!--lt_infor-->
		<div class="goods_infor">
			<h1 class="commodity_name"></h1>
			<ul class="commodity_property">
				<li>
					<dl class="horizontal">
						<dt>价格：</dt>
						<dd>
							<strong class="unitPrice rmb_icon univalent"></strong>
						</dd>
					</dl>
				</li>
				<li>
					<dl class="horizontal">
						<dt>状态：</dt>
						<dd>
							<time class="state"></time>
						</dd>
					</dl>
				</li>
<!-- 				<li> -->
<!-- 					<dl class="horizontal"> -->
<!-- 						<dt>分类：</dt> -->
<!-- 						<dd> -->
<!-- 							<em>品牌名</em> -->
<!-- 						</dd> -->
<!-- 					</dl> -->
<!-- 				</li> -->
				<li class="statistics">
					<dl class="vertical">
						<dt>月销量</dt>
						<dd>20</dd>
					</dl>
					<dl class="vertical">
						<dt>累计评论</dt>
						<dd>198</dd>
					</dl>
					<dl class="vertical">
						<dt>关注</dt>
						<dd>230</dd>
					</dl>
				</li>
				<li>
					<dl class="horizontal horizontal_attr">
						<dt>规格：</dt>
						<dd>
							<label><input type="radio" name="guige">S码</label> <label><input
								type="radio" name="guige">M码</label> <label><input
								type="radio" name="guige">L码</label> <label><input
								type="radio" name="guige">XL码</label> <label><input
								type="radio" name="guige">XXL码</label>
						</dd>
					</dl>
				</li>
				<li>
					<dl class="horizontal horizontal_attr">
						<dt>颜色：</dt>
						<dd>
							<label><input type="radio" name="yanse">黑色</label> <label><input
								type="radio" name="yanse">蓝色</label> <label><input
								type="radio" name="yanse">白色</label>
						</dd>
					</dl>
				</li>

				<li>
					<dl class="horizontal horizontal_attr">
						<dt>数量：</dt>
						<dd>
							<input type="button" onclick="sub()" value="-" class="jj_btn"> <input
								type="text" id="quantity" value="1" readonly="" class="num"> <input
								type="button" value="+" onclick="add()" class="jj_btn"> <span class="inventory"></span>
						</dd>
					</dl>
				</li>
				<li class="last_li"><input type="button" value="立即询价"
					class="buy_btn" onclick="">
					<input type="button" value="立即购买" class="buy_btn"
					onclick=""> <input
					type="button" value="加入购物车" class="add_btn" onclick="openCart()"></li>
			</ul>
		</div>
		<!--rt_infor-->
		<div class="shop_infor">
			<dl class="business_card">
				<dt>xx有限公司</dt>
				<dd>资质：生产商</dd>
				<dd>联系人：*先生（先生）</dd>
				<dd>邮件：******@Foxmail.com</dd>
				<dd>电话：4008-******</dd>
				<dd>所在地：陕西省西安市</dd>
				<dd>地址：陕西省西安市**区**街232号</dd>
				<dd class="center">
					<a
						href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/shop.html"
						class="link_btn">进入店铺</a> <a class="link_btn">收藏店铺</a>
				</dd>
			</dl>
		</div>
	</div>
	</section>
	<!--detail-->
	<section class="wrap product_detail_btm"> <article>
	<ul class="item_tab">
		<li><a class="curr_li">商品详情</a></li>
		<li><a>商品评价（2893）</a></li>
		<li><a>成交记录（1892）</a></li>
	</ul>
	<!--商品详情-->
	<div class="cont_wrap active">
		该商品参与了公益宝贝计划，卖家承诺每笔成交将为壹乐园计划捐赠0.02元。该商品已累积捐赠24560笔。
		善款用途简介：基于游戏教育在儿童成长中的重要性，壹基金设立了“壹乐园计划”，帮助提供滑梯、攀爬架、跷跷板、秋千、乒乓球桌等，为灾后及贫困地区的孩子们搭建课<br>
		该商品参与了公益宝贝计划，卖家承诺每笔成交将为壹乐园计划捐赠0.02元。该商品已累积捐赠24560笔。
		善款用途简介：基于游戏教育在儿童成长中的重要性，壹基金设立了“壹乐园计划”，帮助提供滑梯、攀爬架、跷跷板、秋千、乒乓球桌等，为灾 <img
			src="./goods005.jpg"><br>
		该商品参与了公益宝贝计划，卖家承诺每笔成交将为壹乐园计划捐赠0.02元。该商品已累积捐赠24560笔。
		善款用途简介：基于游戏教育在儿童成长中的重要性，壹基金设立了“壹乐园计划”，帮助提供滑梯、攀爬架、跷跷板、秋千、乒乓球桌等，为灾后及贫困地区的孩子们搭建课<br>
		该商品参与了公益宝贝计划，卖家承诺每笔成交将为壹乐园计划捐赠0.02元。该商品已累积捐赠24560笔。
		善款用途简介：基于游戏教育在儿童成长中的重要性，壹基金设立了“壹乐园计划”，帮助提供滑梯、攀爬架、跷跷板、秋千、乒乓
	</div>
	<!--商品评价-->
	<div class="cont_wrap">
		<table class="table">
			<tbody>
				<tr>
					<td width="20%" align="center">李*锋</td>
					<td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
					<td width="20%" align="center"><time>2013-01-13 15:06</time></td>
				</tr>
				<tr>
					<td width="20%" align="center">彭**法</td>
					<td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
					<td width="20%" align="center"><time>2013-01-13 15:06</time></td>
				</tr>
				<tr>
					<td width="20%" align="center">代**彭</td>
					<td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
					<td width="20%" align="center"><time>2013-01-13 15:06</time></td>
				</tr>
			</tbody>
		</table>
		<!--分页-->
		<div class="paging">
			<a>第一页</a> <a class="active">2</a> <a>3</a> <a>...</a> <a>89</a> <a>最后一页</a>
		</div>
	</div>
	<!--成交记录-->
	<div class="cont_wrap">
		<table class="table">
			<tbody>
				<tr>
					<th>买家</th>
					<th>产品属性</th>
					<th>数量</th>
					<th>成交时间</th>
				</tr>
				<tr>
					<td align="center">李**强</td>
					<td>
						<p>颜色：黑色</p>
						<p></p>
						<p>规格：M</p>
						<p></p>
					</td>
					<td align="center"><b>1</b></td>
					<td align="center"><time>2013-01-13 15:25:39</time></td>
				</tr>
				<tr>
					<td align="center">李**强</td>
					<td>
						<p>颜色：黑色</p>
						<p></p>
						<p>规格：L</p>
						<p></p>
					</td>
					<td align="center"><b>1</b></td>
					<td align="center"><time>2013-01-13 15:25:39</time></td>
				</tr>
				<tr>
					<td align="center">葛**华</td>
					<td>
						<p>颜色：白色</p>
						<p></p>
						<p>规格：XL</p>
						<p></p>
					</td>
					<td align="center"><b>5</b></td>
					<td align="center"><time>2013-01-13 15:25:39</time></td>
				</tr>
			</tbody>
		</table>
		<!--分页-->
		<div class="paging">
			<a>第一页</a> <a class="active">2</a> <a>3</a> <a>...</a> <a>89</a> <a>最后一页</a>
		</div>
	</div>
	</article> <aside>
	<dl class="aside_pro_list">
		<dt>
			<strong>精品推荐</strong> <a>更多</a>
		</dt>
		<dd>
			<a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#"
				class="goods_img"><img src="./goods002.jpg"></a>
			<div class="rt_infor">
				<h3>
					<a
						href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">时尚女装
						2019春季针织衫</a>
				</h3>
				<p>
					<del class="rmb_icon">1298.00</del>
				</p>
				<p>
					<strong class="rmb_icon">980.00</strong>
				</p>
			</div>
		</dd>
		<dd>
			<a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#"
				class="goods_img"><img src="./goods002.jpg"></a>
			<div class="rt_infor">
				<h3>
					<a
						href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">时尚女装
						2019春季针织衫</a>
				</h3>
				<p>
					<del class="rmb_icon">1298.00</del>
				</p>
				<p>
					<strong class="rmb_icon">980.00</strong>
				</p>
			</div>
		</dd>
		<dd>
			<a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#"
				class="goods_img"><img src="./goods002.jpg"></a>
			<div class="rt_infor">
				<h3>
					<a
						href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">时尚女装
						2019春季针织衫</a>
				</h3>
				<p>
					<del class="rmb_icon">1298.00</del>
				</p>
				<p>
					<strong class="rmb_icon">980.00</strong>
				</p>
			</div>
		</dd>
		<dd>
			<a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#"
				class="goods_img"><img src="./goods002.jpg"></a>
			<div class="rt_infor">
				<h3>
					<a
						href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">时尚女装
						2019春季针织衫</a>
				</h3>
				<p>
					<del class="rmb_icon">1298.00</del>
				</p>
				<p>
					<strong class="rmb_icon">980.00</strong>
				</p>
			</div>
		</dd>
	</dl>
	</aside> </section>
	<%@include file="/jsp/web/footer.jsp"%>
	<script>
	var userCode = '<%=request.getSession().getAttribute("userCode")%>';
	var code = '<%=request.getParameter("code")%>';
	console.log(userCode);
	console.log(code);
	init();
	function init(){
		ajax("/commodity/initUpd.do", {code:code}, "json", function(data){
			console.log(data);
			var model=data.model;
			$(".mainPic").html('<img width=420px height=420px  jqimg="upload/goods.jpg"src="/image/'+model.mainPic+'">')
			$(".commodity_name").html(model.name);
			$(".inventory").html("库存："+model.inventory);
			$(".unitPrice").html(model.unitPrice);
			$(".state").html(model.state);
		});
	}
	function add(){
		var number=parseInt($("#quantity").val());
		var unitPrice=parseInt($(".unitPrice").html());
		number+=1;
		$("#quantity").val(number);
	}
	function sub(){
		var number=$("#quantity").val();
		var unitPrice=parseInt($(".unitPrice").html());
		if(number<2){
			return;
		}
		number-=1;
		$("#quantity").val(number);
	}
	function openCart(){
		if(userCode==null||userCode==""||userCode=="null"){
			window.location.href="${pageContext.request.contextPath}/jsp/user/login3.jsp";
		}else{
			ajax("/shoppingCart/add.do", {userCode:userCode,commodityCode:code,quantity:$("#quantity").val()}, "json", function(data) {
				if (data == 0) {
					layer.msg('成功添加到购物车');
				} else if(data == 2){
					layer.msg('添加购物车失败');
				}
				closeThis(1000);
			});
// 			window.location.href="${pageContext.request.contextPath}/jsp/user/shoppingCart.jsp";
		}
	}
	
</script>

</body>
</html>