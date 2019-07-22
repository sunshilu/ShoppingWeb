<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--header-->
<header> <!--topNavBg-->
<div class="topNavBg">
	<div class="wrap">
		<!--topLeftNav-->
		<ul class="topLtNav">
<li><a href="javascript:loginOut()">注销</a></li>
			<li><a href="">移动端</a></li>
		</ul>
		<!--topRightNav-->
		<ul class="topRtNav">
			<%
				if (request.getSession().getAttribute("userCode") == null
						|| request.getSession().getAttribute("userCode") == "") {
			%>
			<li><a
				href="${pageContext.request.contextPath}/jsp/user/login3.jsp"
				class="obviousText">亲，请登录</a></li>
			<%
				} else {
			%>
			<li><a
				href="${pageContext.request.contextPath}/jsp/user/main.jsp"
				class="obviousText">当前用户：[<%=request.getSession().getAttribute("userCode")%>]
			</a></li>
			<%
				}
			%>
			<li><a href="${pageContext.request.contextPath}/jsp/web/reg.jsp">注册</a></li>
			
			<li><a href="${pageContext.request.contextPath}/jsp/user/shoppingCart.jsp" class="cartIcon">购物车</a></li>
			<li><a
				href="${pageContext.request.contextPath}/jsp/user/orderFormManage/list.jsp"
				class="favorIcon">我的订单</a></li>
				<li><a href="${pageContext.request.contextPath}/jsp/user/main2.jsp">个人中心</a></li>
			<li><a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/user.html">商家中心</a></li>
			<li><a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/article_read.html"
				class="srvIcon">客户服务</a></li>
			<li><a
				href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/union_login.html">联盟管理</a></li>
		</ul>
	</div>
</div>
<!--logoArea-->
<div class="wrap logoSearch">
	<!--logo-->
	<div class="logo">
		<h1>
			<img src="${pageContext.request.contextPath}/img/logo.png">
		</h1>
	</div>
	<!--search-->
	<div class="search">
		<ul class="switchNav">
			<li class="active" id="chanpin">产品</li>
			<li id="shangjia">商家</li>
			<li id="zixun">搭配</li>
			<li id="wenku">文库</li>
		</ul>
		<div class="searchBox">
			<form>
				<div class="inputWrap">
					<input name="name" type="text" placeholder="输入产品关键词或货号">
				</div>
				<div class="btnWrap">
					<input onclick="searchCommodity()" type="button" value="搜索"
						style="color: white; font-size: 16px; height: 34px; background: none; border: none; cursor: pointer; font-size: 20px; letter-spacing: 5px; text-indent: 5px; font-weight: bolder;">
				</div>
			</form>
			<a href="" class="advancedSearch">高级搜索</a>
		</div>
	</div>
</div>
<!--nav--> <nav>
<ul class="wrap navList">
	<li class="category"><a>全部产品分类</a>
		<dl class="commodityType asideNav indexAsideNav" style="display: none;">
			
		</dl></li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/index.html"
		class="active">首页</a></li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">时尚搭配</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/channel.html">原创设计</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/channel.html">时尚代购</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/channel.html">民族风</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/information.html">时尚搭配</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/library.html">搭配知识</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">促销专区</a>
	</li>
	<li><a
		href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html#">其他</a>
	</li>
</ul>
</nav> </header>
<script type="text/javascript">
	init()
	function init() {
		ajax("/commodityType/searchAllType.do", {}, "json", function(data) {
			console.log(data);
			var list = data.list;
			var list2 = data.list2;
			var count = data.count;
			var html = "";
			var i2 = 0;
			$.each(count, function(i, dom) {
				html += '<dt><a href="${pageContext.request.contextPath}/jsp/web/firstTypeSearch.jsp?firstCode='+list[i].code+'">' + list[i].name + '</a></dt><dd>';
				for (i3 = 0; i3 < dom; i3++) {
					html += '<a href="${pageContext.request.contextPath}/jsp/web/firstTypeSearch.jsp?secondCode='+list2[i2].code+'">' + list2[i2].name + '</a>';
					i2++;
				}
				html += "</dd>";
			})
			$(".commodityType").html(html);
		})
	}
</script>
<script>
 $(document).ready(function(){
   //测试效果，程序对接如需变动重新编辑
   $(".switchNav li").click(function(){
     $(this).addClass("active").siblings().removeClass("active");
     });
   $("#chanpin").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入产品关键词或货号");
     });
   $("#shangjia").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入商家店铺名");
     });
   $("#zixun").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入关键词查找文章内容");
     });
   $("#wenku").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入关键词查找文库内容");
     });
   });
   
 </script>
<script>
	function searchCommodity() {
		window.location.href = '${pageContext.request.contextPath}/jsp/web/searchResult.jsp?name='
				+ $("input[name='name']").val();
	}
	function loginOut(){
		ajax("/loginAndReg/loginOut.do", {}, "text", function(data){
			if(data=="0"){
				location.href=con.app + "/jsp/web/home.jsp";
			}
		})
	}
</script>