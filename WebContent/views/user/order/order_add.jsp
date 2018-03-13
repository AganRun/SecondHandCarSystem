<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>提交订单页面</title>
		<link href="${pageContext.request.contextPath }/static/user/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
		<link href="${pageContext.request.contextPath }/static/user/css/style.css" type="text/css" rel="stylesheet" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/user/css/lightbox.css">
		<!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Ramble Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		<!-- //Custom Theme files -->
		<!-- js -->
		<script src="${pageContext.request.contextPath }/static/user/js/jquery-1.11.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/user/js/bootstrap.js"></script>
		<!-- //js -->
		<!--animate-->
		<link href="${pageContext.request.contextPath }/static/user/css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="${pageContext.request.contextPath }/static/user/js/wow.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/user/js/jquery.validate.js"></script>
		<script>
			new WOW().init();
		</script>
		<!--//end-animate-->
	</head>
	<script type="text/javascript">
		$(function(){
			$("#addOrderForm").validate({
				rules:{
					order_person_name:{
						required:true,
					},
					order_message:{
						maxlength:30,
					},
					order_address:{
						required:true,
						maxlength:40,
					},
					order_tel:{
						required:true,
						rangelength:[11,11],
						number:true,
					}
				},
				messages:{
					order_person_name:"请输入联系人姓名",
					order_message:"备注字数不超过30字",
					order_address:"请输入详细地址地址（小于50字）",
					order_tel:"请输入手机号码",
				},
			})
		})
	</script>
	<style>
		input.error {
			border: 1px solid red;
		}
		label.error {
			font-weight: bold;
			color: #EA5200;
		}
		body{
	    	background: url("${pageContext.request.contextPath}/static/user/images/orderBg.jpg") fixed center ;
	    } 
		</style>
	<body>
		<!--header-->
		<div class="header">
			<div class="container">
				<div class="header-info navbar-left wow fadeInLeft animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<p>您好：<c:out value="${sessionScope.loginSession_name }" default="未登录"></c:out></p>
				</div>
				<form action="${pageContext.request.contextPath }/userShop/navQueryIdOrName" class="navbar-form navbar-right wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<div class="form-group">
						<input type="text" name="car_name" class="form-control" placeholder="搜索车辆">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</div>
					<div class="form-group">
						<button style="margin-left:30px" class="form-control">
							<a href="${pageContext.request.contextPath }/loginInitAction">注销</a>
						</button>
					</div>
				</form>
				
			</div>
		</div>
		<!--//header-->
		<!--navigation-->
		<div class="top-nav">
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="navbar-header navbar-left">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a class="navbar-brand wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;" href="${pageContext.request.contextPath }/indexInitAction">Second-hand Car</a></h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/indexInitAction">主页</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/userShop/shopInit">商城</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shopCart/shopCartList">购物车</a>
							</li>
							<li class="hvr-bounce-to-bottom active">
								<a href="${pageContext.request.contextPath }/orderManage/notPayOrder">订单管理</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/user/updateInfoInit">个人中心</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/views/user/aboutUs.jsp">关于我们</a>
							</li>
						</ul>
						<div class="clearfix"> </div>
					</div>
				</div>
			</nav>
		</div>
		<!--navigation-->
		
		<div style="height:50px;"></div>
		
		<!-- 提交订单 -->
		<div style="min-height:600px;">
			<label style="margin-left:100px"><font size="4px">提交订单页面</font></label>
			<hr style="border:  solid 1px #ADADAD;" /><br>
			
			<div style="height:30px"></div>
			
				<form class="form-horizontal" role="form" id="addOrderForm" action="${pageContext.request.contextPath }/orderManage/addOrder">
					
					<input type="hidden" name="order_person_id" value="${ requestScope.personInfo.getPerson_id() }">
					<input type="hidden" name="order_car_id" value="${ requestScope.carInfo.getCar_id() }">
					<input type="hidden" name="order_shop_id" value="${ requestScope.carInfo.getCar_shop_id() }">
				
					<div class="form-group">
						<label for="inputPassword" class="col-sm-3 control-label">车辆名称</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="car_name" value="${ requestScope.carInfo.getCar_name() }" readonly="true">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-3 control-label">价格</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="car_price_new" value="${ requestScope.carInfo.getCar_price_new() }" readonly="true">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-3 control-label">联系人</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="order_person_name" value="${ requestScope.personInfo.getPerson_name() }" >
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-3 control-label">备注</label>
						<div class="col-sm-8">
							<textarea rows="2" class="form-control" name="order_message"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-3 control-label">交易地址</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="order_address" value="${ requestScope.personInfo.getPerson_address() }" >
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-3 control-label">联系方式</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="order_tel" value="${ requestScope.personInfo.getPerson_tel() }" >
						</div>
					</div>
					
					<br><br>
					<button class="btn btn-info" type="submit" style="margin-left:400px"> 下  单  </button>	
					<button class="btn btn-primary" type="reset" style="margin-left:150px"> 取  消  </button>
					
					<br>
					<br>
					
				</form>
			
			<br>
		</div>
		<!-- 提交订单 end -->
		
		
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		
		
	</body>

</html>