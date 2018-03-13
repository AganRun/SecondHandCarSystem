<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>某月份订单详情</title>
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
		<script>
			new WOW().init();
		</script>
		<!--//end-animate-->
	</head>
	<style>
		body{
	    	background: url("${pageContext.request.contextPath}/static/user/images/406764.jpg") fixed center ;
	    } 
	</style>
	<body>
		<!--header-->
		<div class="header">
			<div class="container">
				<div class="header-info navbar-left wow fadeInLeft animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<p>您好：<c:out value="${sessionScope.shoploginSession_name }" default="未登录"></c:out></p>
				</div>
				<form action="${pageContext.request.contextPath }/shop/navQueryIdOrName" class="navbar-form navbar-right wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<div class="form-group">
						<input type="text" name="car_name" class="form-control" placeholder="搜索 编号或名称">
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
						<h1><a class="navbar-brand wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;" href="${pageContext.request.contextPath }/views/shop/index.jsp">Second-hand Car</a></h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/views/shop/index.jsp">主页</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shop/queryAllOnlineCar">二手车管理</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shopOrderManage/orderNotSendList">订单管理</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shop/updateInfoInit">个人中心</a>
							</li>
							<li class="hvr-bounce-to-bottom active">
								<a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByTime">销量统计</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/views/shop/aboutUs.jsp">关于我们</a>
							</li>
						</ul>
						<div class="clearfix"> </div>
					</div>
				</div>
			</nav>
		</div>
		<!--navigation-->
		
		<div style="height:50px;"></div>
		
		
		<!-- 月份订单详情统计 -->
		<div style="min-height:600px;">
			
			<div style="height:40px"></div>
			<label style="margin-left:80px"><font size="4px">月份订单列表</font></label>
			<hr style="border:  double 1px #ADADAD;" />
			<div style="height:30px"></div>
			
			<table class="table table-condensed table-hover" style="width:90%;" align="center">
				<thead>
					<tr class="active">
						<th>订单号</th>
						<th>车辆名称</th>
						<th>价格</th>
						<th>联系电话</th>
						<th>地址</th>
						<th>收货时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.monthOrderList }" var="order">
					<tr>
						<td><c:out value="${order.getOrder_id() }"></c:out></td>
						<td><c:out value="${order.getCar_name() }"></c:out></td>
						<td><c:out value="${order.getCar_price_new() }"></c:out></td>
						<td><c:out value="${order.getOrder_tel() }"></c:out></td>
						<td><c:out value="${order.getOrder_address() }"></c:out></td>
						<td><c:out value="${order.getOrder_time_receive() }"></c:out></td>
						<td>
							<a href="${pageContext.request.contextPath }/shopOrderManage/orderDetails?order_id=${order.getOrder_id() }"><button class="btn btn-warning"> 详 情  </button></a>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			
			<div style="margin-left:80px">
				<br>
				<font size="3px"> 共 <c:out value="${requestScope.monthOrderList.size() }"></c:out> 条数据</font>
			</div>
	
		</div>
		<!-- 某月份订单详情end -->
		
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		
		
	</body>

</html>

