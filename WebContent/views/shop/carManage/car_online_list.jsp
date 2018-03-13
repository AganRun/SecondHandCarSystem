<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>二手车管理-在售汽车列表</title>
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
		<script src="${pageContext.request.contextPath }/static/admin/js/jquery-2.2.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/user/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/static/admin/js/jquery.validate.js"></script>
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
	    	background: url("${pageContext.request.contextPath}/static/user/images/shopBg.jpg") fixed center ;
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
							<li class="hvr-bounce-to-bottom active">
								<a href="${pageContext.request.contextPath }/shop/queryAllOnlineCar">二手车管理</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shopOrderManage/orderNotSendList">订单管理</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shop/updateInfoInit">个人中心</a>
							</li>
							<li class="hvr-bounce-to-bottom">
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
		
		<!-- 在售车辆列表 -->
		<div style="min-height:800px;">
			
			<div style="height:40px"></div>
			<label style="margin-left:80px"><font size="4px">在售汽车列表</font></label>
				
			<div class="container">
				<a href="${pageContext.request.contextPath}/shop/queryAllDownShelfCar"><button type="button" style="float:right" class="btn btn-info">下架车辆管理</button></a>
				<a href="${pageContext.request.contextPath}/shop/addCarInit"><button type="button" style="float:right" class="btn btn-info">添加车辆</button></a>
			</div>
				
			<br><br>
			<hr style="border:  double 1px #ADADAD;" />
			<div style="height:30px"></div>
			
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/shop/queryOnlineCarById">
			
				<div class="form-group">
					<label  class="col-sm-2 control-label">汽车编号或名称</label>
					<div class="col-sm-6">
						<input class="form-control" name="car_id" value="${requestScope.queryString }"  type="text">
						<input class="form-control" name="shop_id" value="${sessionScope.shoploginSession.getLogin_id() }"  type="hidden">
					</div>
					<div class="col-sm-4">
						<button type="submit" class="btn btn-primary"> 搜  索 </button>
					</div>
				</div><br>
				
			</form>
			

			<table class="table table-condensed table-hover" style="width:90%;" align="center">
				<thead>
					<tr class="active">
						<th>图片</th>
						<th>编号</th>
						<th>名称</th>
						<th>品牌</th>
						<th>原价</th>
						<th>现价</th>
						<th>购买时间</th>
						<th>上架时间</th>
						<th>是否推荐</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.carOnlineList }" var="car">
					<tr>
						<td><img src="/images/secondHandCarSystem/${car.getCar_img() }" width="210px"></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_id() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_name() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getBrand_name() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_price_old() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_price_new() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_time_buy() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_time_shelf() }"></c:out></td>
						<td style="vertical-align:middle">
							<c:if test="${car.getCar_status_recommend()  == '0'}">否</c:if>
							<c:if test="${car.getCar_status_recommend()  == '1'}">是</c:if>
						</td>
						<td style="vertical-align:middle">
							<a href="${pageContext.request.contextPath }/shop/carDetail?car_id=${car.getCar_id()}"><button class="btn btn-primary">详情</button></a>
							<a href="${pageContext.request.contextPath }/shop/carUpdateInit?car_id=${car.getCar_id()}"><button class="btn btn-info">修改</button></a>
							<a href="${pageContext.request.contextPath }/shop/carDownShelf?car_id=${car.getCar_id()}"><button class="btn btn-danger">下架</button></a>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			
			<div style="height:50px"></div>
			<center>
				<c:if test="${requestScope.queryKind == 'all' }">
					<ul class="pagination pagination-lg">
						<li><a href="${pageContext.request.contextPath }/shop/queryAllOnlineCar?currentpage=1">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/shop/queryAllOnlineCar?currentpage=${requestScope.page.getFront()}">&laquo;上一页</a></li>
					    <li><a>${requestScope.page.getCurrentpage() }</a></li>
					    <li><a href="${pageContext.request.contextPath }/shop/queryAllOnlineCar?currentpage=${requestScope.page.getNext()}">下一页 &raquo;</a></li>
					    <li><a href="${pageContext.request.contextPath }/shop/queryAllOnlineCar?currentpage=${requestScope.page.getLast()}">尾页</a></li>
					</ul><br>
				</c:if>
				
				<c:if test="${requestScope.queryKind == 'idOrName' }">
					<ul class="pagination pagination-lg">
						<li><a href="${pageContext.request.contextPath }/shop/queryOnlineCarById?currentpage=1&shop_id=${ sessionScope.shoploginSession.getLogin_id() }&car_id=${ requestScope.queryString }">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/shop/queryOnlineCarById?currentpage=${requestScope.page.getFront()}&shop_id=${ sessionScope.shoploginSession.getLogin_id() }&car_id=${ requestScope.queryString }">&laquo;上一页</a></li>
					    <li><a>${requestScope.page.getCurrentpage() }</a></li>
					    <li><a href="${pageContext.request.contextPath }/shop/queryOnlineCarById?currentpage=${requestScope.page.getNext()}&shop_id=${ sessionScope.shoploginSession.getLogin_id() }&car_id=${ requestScope.queryString }">下一页 &raquo;</a></li>
					    <li><a href="${pageContext.request.contextPath }/shop/queryOnlineCarById?currentpage=${requestScope.page.getLast()}&shop_id=${ sessionScope.shoploginSession.getLogin_id() }&car_id=${ requestScope.queryString }">尾页</a></li>
					</ul><br>
				</c:if>
			</center>	
		
		</div>
		<!-- 车辆显示列表end -->
		<div style="height:100px"></div>
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		
		
	</body>

</html>
				
				
				

