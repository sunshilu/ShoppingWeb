<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单提交</title>
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
<section class="wrap" style="margin-top:20px;overflow:hidden;">
	<table class="order_table">
		<tbody class="commodity">
		</tbody>
	</table>
	<div class="order">
	<label>收货地址：</label>
	<select name="address">
	<option value="北京">北京</option>
	<option value="上海">上海</option>
	<option value="广州">广州</option>
	<option value="深圳">深圳</option>
	</select>
	</div>
	<div class="order_btm_btn">
		<label>共计金额<strong class="sumPrice rmb_icon"></strong></label>
		<a
			href="javascript:openOrderResult()"
			class="link_btn_02 add_btn">确认下单
		</a>
	</div>
	</section>
	
	<script>
	var userCode = '<%=request.getSession().getAttribute("userCode")%>';
	var sumPrice = '<%=request.getParameter("sumPrice")%>';
	$(".sumPrice").html(sumPrice);
	var str = '<%=request.getParameter("str")%>';
	var arr=[];
	arr=str.split(",");
	console.log(arr);
	console.log(userCode+" "+str);
	init();
	function init(){
		ajax("/shoppingCart/init.do", {userCode:userCode}, "json", function(data){
			console.log(data);
		    var html='<tr><th>产品</th><th>名称</th>'
		    +'<th>描述</th><th>单价</th><th>数量</th><th>小计</th></tr>';
			$.each(data.list,function(i,dom){
				for(var i=0;i<arr.length;i++){
					if(dom.code==arr[i]){
						html+='<tr><input id="hidden" type="hidden" value="'+dom.code+'"/>'
						+'<td class="commodityPic center"><a href="${pageContext.request.contextPath}/jsp/web/productDetail.jsp?code="><img'
						+' src="/image/'+dom.mainPic+'" style="width: 50px; height: 50px;"></a></td>'
						+'<td class="center commodityName"><a href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html">'+dom.name+'</a></td>'
						+'<td class="center commodityDescription">'+dom.description+'</td>'
						+'<td class="unitPrice center"><span id="unitPrice'+dom.code+'" class="rmb_icon">'+dom.unitPrice+'</span></td>'
						+'<td class="count center"><input id="quantity'+dom.code+'" type="text" value="'+dom.quantity+'" class="number" readonly=""> </td>'
						+'<td class="center"><strong id="price'+dom.code+'" class="rmb_icon">'+dom.unitPrice*dom.quantity+'</strong></td>'
						+'</tr>';
					}
				}
			})
			$(".commodity").html(html);
		});
	}
	
	function openOrderResult(){
		openConfirm(function(index) {
			ajax('/userOrderForm/add.do', {
				commodityCode : str,
				address:$("select[name='address']").val()
			}, 'text', function(data) {
				console.log(data);
				if (data == 1) {
					layer.msg('下单成功');
					window.location.href="${pageContext.request.contextPath}/jsp/user/orderFormManage/list.jsp?"
				} else if (data == 0) {
					layer.msg('订单提交失败');
				}
				init();
			})
		})
	}
	</script>


<%@include file="/jsp/web/footer.jsp"%>
</body>
</html>