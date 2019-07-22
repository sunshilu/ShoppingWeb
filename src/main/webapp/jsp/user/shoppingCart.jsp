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
</head>
<body>
	<%@include file="/jsp/web/header2.jsp"%>
	<section class="wrap" style="margin-top:20px;overflow:hidden;">
	<table class="order_table">
		<tbody class="commodity">
		</tbody>
	</table>
	<div class="order_btm_btn" style="text-align: left;">
	 <a href="javascript:delAll()">删除选中项</a>
	</div>
	<div class="order_btm_btn">
		<a
			href=""
			class="link_btn_01 buy_btn">继续购买</a> <a
			href="javascript:openOrderForm()"
			class="link_btn_02 add_btn">共计金额<strong class="sumPrice rmb_icon"></strong>立即结算
		</a>
	</div>
	</section>

	<%@include file="/jsp/web/footer.jsp"%>
	<script type="text/javascript">
	var userCode = '<%=request.getSession().getAttribute("userCode")%>';
	console.log(userCode);
	init();
	function init(){
		ajax("/shoppingCart/init.do", {userCode:userCode}, "json", function(data){
			console.log(data);
		    var html='<tr><th><input class="all" type="checkbox">&nbsp全选</th><th>产品</th><th>名称</th>'
		    +'<th>描述</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr>';
			$.each(data.list,function(i,dom){
				html+='<tr><td class="checkbox center"><input id="'+dom.code+'" class="one '+dom.code+'" type="checkbox" value="'+dom.unitPrice*dom.quantity+'"></td>'
				+'<td class="commodityPic center"><a href="${pageContext.request.contextPath}/jsp/web/productDetail.jsp?code="><img'
				+' src="/image/'+dom.mainPic+'" style="width: 50px; height: 50px;"></a></td>'
				+'<td class="commodityName"><a href="http://www.17sucai.com/preview/183822/2019-05-11/shopping/product.html">'+dom.name+'</a></td>'
				+'<td class="commodityDescription">'+dom.description+'</td>'
				+'<td class="unitPrice center"><span id="unitPrice'+dom.code+'" class="rmb_icon">'+dom.unitPrice+'</span></td>'
				+'<td class="count center"><input type="button" onclick="sub(\''+dom.code+'\')" value="-"class="sub_quantity jj_btn"> <input id="quantity'+dom.code+'" type="text" value="'+dom.quantity+'" class="number" readonly=""> <input type="button" onclick="add(\''+dom.code+'\')" value="+" class="add_quantity jj_btn"></td>'
				+'<td class="center"><strong id="price'+dom.code+'" class="rmb_icon">'+dom.unitPrice*dom.quantity+'</strong></td>'
				+'<td class="center"><a href="javascript:del(\''+dom.code+'\')">删除</a></td></tr>';
				
			})
			$(".commodity").html(html);
			$(".one").click(function(){
				changePrice();			});
			$(".all").click(function(){
				$("input[type='checkbox']").prop('checked',$(this).prop('checked'));
				changePrice();
			})
		});
	}
	function changePrice(){
		var e=$("input[class^='one']:checked");
		var price=[];
		var sum=0;
		console.log(e.length);
		e.each(function(index,dom){
			price.push($(this).val());
		});
		console.log(price);
		for(var i=0;i<price.length;i++){
			sum+=parseInt(price[i]);
		}
		console.log(sum);
		$(".sumPrice").html(sum);
	}
	function add(code){
		var number=parseInt($("#quantity"+code).val());
		var unitPrice=parseInt($("#unitPrice"+code).html());
		number+=1;
		$("#quantity"+code).val(number);
		changeQuantity(code);
		$("#price"+code).html(number*unitPrice);
		$("."+code).val(number*unitPrice);
		changePrice();
	}
	function sub(code){
		var number=$("#quantity"+code).val();
		var unitPrice=parseInt($("#unitPrice"+code).html());
		if(number<2){
			return;
		}
		number-=1;
		$("#quantity"+code).val(number);
		changeQuantity(code);
		$("#price"+code).html(number*unitPrice);
		$("."+code).val(number*unitPrice);
		changePrice();
	}
	function del(code) {
		openConfirm(function(index) {
			ajax('/shoppingCart/del.do', {
				userCode:userCode,
				commodityCode : code
			}, 'text', function(data) {
				console.log(data);
				if (data == 1) {
					layer.msg('删除成功');
					$("input[name='pageIndex']").val(1);
				} else if (data == 3) {
					layer.msg('删除失败--删除的记录不存在');
				}
				init();
			})
		})
	}
	function openOrderForm(){
		var e=$("input[class^='one']:checked");
		var ids=[];
		var o="";
		console.log(e.length);
		e.each(function(index,dom){
			ids.push($(this).attr("id"));
		});
		console.log(ids);
		for(var i=0;i<ids.length;i++){
			o+=ids[i]+",";
		}
		window.location.href = '${pageContext.request.contextPath}/jsp/user/orderForm.jsp?sumPrice='
				+$(".sumPrice").html()+"&str="+ o;
	}
	function changeQuantity(code){
		console.log(code+" "+userCode+" "+$("#quantity"+code).val());
		ajax("/shoppingCart/updQuantity.do", {commodityCode:code,userCode:userCode,quantity:$("#quantity"+code).val()}, "text", function(data){
			if(data=="1"){
				console.log("修改数量成功");
			}else{
				console.log("修改失败");
			}
		})
	}
	function delAll(){
		openConfirm(function(index) {
			var e=$("input[class^='one']:checked");
			var ids="";
			e.each(function(index,dom){
				ids+=$(this).attr("id")+",";
			});
			console.log(ids);
			ajax('/shoppingCart/delAll.do', {
				userCode:userCode,
				commodityCode : ids
			}, 'text', function(data) {
				console.log(data);
				if (data == 1) {
					layer.msg('删除成功');
					$("input[name='pageIndex']").val(1);
				} else if (data == 3) {
					layer.msg('删除失败--删除的记录不存在');
				}
				init();
			})
		})
	}
	
	</script>
</body>
</html>