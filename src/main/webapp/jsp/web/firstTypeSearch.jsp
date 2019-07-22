<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<meta name="keywords" content="DeathGhost">
<meta name="description" content="DeathGhost">
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/html5.js"></script>
<script src="${pageContext.request.contextPath}/js/swiper.min.js"></script>
<style>
.IdxmainArea ul li {
	float: left;
	width: 140px;
	margin: 10.8px 5px;
	border: 1px #d2d2d2 solid;
	text-align: center;
	overflow: hidden;
	padding: 2px;
	position: relative;
}
</style>
</head>
<body>
	<%@include file="/jsp/web/header.jsp"%>
	<!--advertisment area-->
	<section class="wrap"> <!--ctCont-->
	<div class="IdxmainArea">
		<section class="deal-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<div class="new-arrivals">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<div class="owl-demo-outer">
									<div class="deals-wk2 owl-carousel owl-theme" id="owl-demo8"
										style="display: block; opacity: 1;">
										<div class="owl-wrapper-outer">
											<div class="owl-wrapper"
												style="left: 0px; width: 3000px; display: block;">
												<div class="owl-item" style="width: 750px;">
													<div class="commodityShow item"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		<input type="hidden" name="pageIndex" value="1" /> <input
			type="hidden" name="pageLimit" value="3" />
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>

	</div>
	</section>


	<style>
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3,
	.col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9,
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
	.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9,
	.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3,
	.col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9,
	.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
	float: left;
}

.col-xs-12 {
	width: 100%;
}
/* @media all and (min-width:768px) */
.col-sm-8 {
	width: 66.66%;
}

/* @media all and (min-width:1200px) */
.container {
	width: 1170px;
}

.owl-carousel .owl-wrapper-outer {
	overflow: hidden;
	position: relative;
	width: 100%;
}

.owl-carousel .owl-item {
	float: left;
}

/* @media all and (min-width:992px) */
.col-md-4 {
	width: 33.33%;
}

.text-center {
	text-align: center;
}

.new-arrivals .pro-text {
	border: 1px solid #f1f1f1;
	border-radius: 3px;
	margin-top: 30px;
}

.add-btn {
	background: #b11e22 none repeat scroll 0 0;
	border-radius: 3px;
	color: #fff;
	display: inline-block;
	margin: 20px 0;
	padding: 6px 32px;
	font-size: 12px;
	text-transform: uppercase;
}

.new-arrivals .add-btn {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: 1px solid #eee;
	color: #a7a7a7;
	transition: all 0.15s ease-in-out 0s;
}
.inputWrap{
height:40px;
}
</style>
	<script type="text/javascript">
	var firstCode='<%=request.getParameter("firstCode")%>';
	var secondCode = '<%=request.getParameter("secondCode")%>';
	var userCode = '<%=request.getSession().getAttribute("userCode")%>';
	console.log(firstCode+" "+secondCode);
	init();
	function init(){
		ajax(
				"/commodity/searchcommodityByCode.do",
				{
					secondCode : secondCode,
					firstCode : firstCode,
					pageIndex : $("input[name='pageIndex']").val(),
					pageLimit : $("input[name='pageLimit']").val()
				},
				"json",
				function(data) {
					var curr = $("input[name='pageIndex']").val();
					var limit = $("input[name='pageLimit']").val();
					setPageInfoTheme(
							'pageInfoUser',
							data.count,
							curr,
							limit,
							'#e4393c',
							function(obj, first) {
								$("input[name='pageIndex']").val(obj.curr);
								$("input[name='pageLimit']").val(obj.limit);
								if (!first) {
									init();
								}//首次不执行
							});
					form.render();
					console.log(data);
					var html = "";
					$.each(data.list,function(i, dom) {
										// 				html += '<li><a href=""><img src="/image/'+dom.mainPic+'"><h3>'
										// 						+ dom.name + '</h3><p><span>' + dom.unitPrice
										// 						+ '</span></p></a></li>'

						html += '<li class="col-xs-12 col-sm-6 col-md-4"><div class="pro-text text-center">'
							+ ' <a href="javascript:openDetail(\''+dom.code+'\')"><div class="pro-img"><img width="206" height="214"alt="2" src="/image/'+dom.mainPic+'"></div></a>'
							+ '<div class="pro-text-outer"><span>'
							+ dom.name
							+ '</span><p style="text-align:center" class="wk-price">￥'
							+ dom.unitPrice
							+ '</p>'
							+ '<a class="add-btn" href="javascript:addCart(\''+dom.code+'\')">Add to cart</a></div></div></li>';

									});
					// 			html += "</ul>";
					$(".commodityShow").html(html);
				})
	}
	function openDetail(code){
		window.location.href = '${pageContext.request.contextPath}/jsp/web/productDetail.jsp?code='
			+ code;
	}	
	function addCart(code){
		if(userCode==null||userCode==""||userCode=="null"){
			window.location.href="${pageContext.request.contextPath}/jsp/user/login3.jsp";
		}else{
			ajax("/shoppingCart/add.do", {userCode:userCode,commodityCode:code,quantity:"1"}, "json", function(data) {
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