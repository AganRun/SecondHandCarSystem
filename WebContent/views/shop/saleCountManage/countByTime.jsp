<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>品牌销量统计</title>
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
		
		
		<!-- 时间销量统计 -->
		<div style="min-height:600px;">
			
			

			<div style="height:40px"></div>
			<label style="margin-left:80px"><font size="4px">月份销售统计列表</font></label>
			<div class="container">
				<a href="${pageContext.request.contextPath }/shopSaleCountManage/brandSaleList"><button type="button" style="float:right" class="btn btn-info">品牌销量统计</button></a>
			</div>
			<hr style="border:  double 1px #ADADAD;" />
			<div style="height:30px"></div>
			
			<form action="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByTime">
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<label class="col-sm-1 control-label"> 年 份 </label>
					<div class="col-sm-5">
						<input class="form-control" value="${requestScope.year }" name="year" type="text">
					</div>
					<div class="col-sm-2">
						<input class="btn btn-info" value=" 确 定  "  type="submit">
					</div>
				</div>
			</form>
			
			<br><br><br><br>
			
			<table class="table table-condensed table-hover" style="width:70%;" align="center">
				<thead>
					<tr class="active">
						<th>月份</th>
						<th>销售数量</th>
						<th>销售价钱</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${month[1] }</td>
						<td><c:out value="${requestScope.numSum[1] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[1] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=01&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[2] }</td>
						<td><c:out value="${requestScope.numSum[2] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[2] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=02&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[3] }</td>
						<td><c:out value="${requestScope.numSum[3] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[3] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=03&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[4] }</td>
						<td><c:out value="${requestScope.numSum[4] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[4] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=04&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[5] }</td>
						<td><c:out value="${requestScope.numSum[5] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[5] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=05&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[6] }</td>
						<td><c:out value="${requestScope.numSum[6] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[6] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=06&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[7] }</td>
						<td><c:out value="${requestScope.numSum[7] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[7] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=07&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[8] }</td>
						<td><c:out value="${requestScope.numSum[8] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[8] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=08&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[9] }</td>
						<td><c:out value="${requestScope.numSum[9] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[9] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=09&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[10] }</td>
						<td><c:out value="${requestScope.numSum[10] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[10] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=10&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[11] }</td>
						<td><c:out value="${requestScope.numSum[11] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[11] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=11&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					<tr>
						<td>${month[12] }</td>
						<td><c:out value="${requestScope.numSum[12] }" default="0"></c:out></td>
						<td><c:out value="${requestScope.priceSum[12] }" default="0"></c:out></td>
						<td><button class="btn btn-info"><a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByMonth?month=12&shop_id=${sessionScope.shoploginSession.getLogin_id()}&year=${requestScope.year}"> 详 情  </a></button></td>
					</tr>
					
					
				</tbody>
			</table>
	
		</div>
		<!-- 时间统计列表end -->
		
		<div style="height:200px"></div>
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		
		
	</body>

</html>

