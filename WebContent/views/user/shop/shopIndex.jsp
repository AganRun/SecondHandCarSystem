<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>二手车商城主页</title>
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
	<script type="text/javascript">
		$(function(){
			$(".imgSrc").mousemove(function(){
				$(this).css("height","200px");
				$(this).css("width","300px");
			})
			$(".imgSrc").mouseout(function(){
				$(this).css("height","140px");
				$(this).css("width","210px");
			})
		})
	</script>
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
							<li class="hvr-bounce-to-bottom active">
								<a href="${pageContext.request.contextPath }/userShop/shopInit">商城</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shopCart/shopCartList">购物车</a>
							</li>
							<li class="hvr-bounce-to-bottom">
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
		
		<!-- 管理员推荐车辆 -->
		<div>
			<hr style="border:  solid 1px #ADADAD;" /><br>
			<label style="margin-left:80px"><font size="4px">管理员推荐车辆</font></label>
			<div style="height:30px"></div>
			<table class="table table-condensed table-hover" style="width:80%;" align="center">
				<thead>
					<tr class="active">
						<th>图片</th>
						<th>名称</th>
						<th>品牌</th>
						<th>原价</th>
						<th>现价</th>
						<th>购买时间</th>
						<th>开售时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.recommandList }" var="car">
					<tr>
						<td><img class="imgSrc"  src="/images/secondHandCarSystem/${car.getCar_img() }" width="210px"></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_name() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getBrand_name() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_price_old() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_price_new() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_time_buy() }"></c:out></td>
						<td style="vertical-align:middle"><c:out value="${car.getCar_time_shelf() }"></c:out></td>
						<td style="vertical-align:middle">
							<a href="${pageContext.request.contextPath }/userShop/addShopCart?shopCart_car_id=${car.getCar_id()}&shopCart_person_id=${ sessionScope.loginSession.getLogin_id()}"><button class="btn btn-warning">加入购物车</button></a>
							<a href="${pageContext.request.contextPath }/orderManage/addOrderInit?shopCart_car_id=${car.getCar_id()}&shopCart_person_id=${ sessionScope.loginSession.getLogin_id()}"><button class="btn btn-info">立即购买</button></a>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<br>
		</div>
		
		<!-- 分类搜索 -->
		<div>
			<hr style="border:  solid 1px #ADADAD;" /><br>
			<label style="margin-left:80px"><font size="4px">在售汽车列表</font></label>
			
			<div style="height:30px"></div>
			
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/userShop/queryCarByClassifys">
			
				<div class="form-group">
					<label class="col-sm-2 control-label">分类查找</label>
					<!-- 品牌分类 -->
					<div class="col-sm-1">
						<select class="form-control"  name="brand_id">
							<!-- 上次查询内容 -->
							<c:if test="${requestScope.queryBrand_name != null}">
								<option value="${requestScope.queryBrand_id }">${requestScope.queryBrand_name }</option>
							</c:if>
							
							<option value="all">所有品牌</option>
							<c:forEach items="${requestScope.brandList }" var="brand">
								<option value="${brand.getBrand_id() }">${brand.getBrand_name() }</option>
							</c:forEach>
						</select>
					</div>
					
					
					<!-- 价格分类 -->
					<div class="col-sm-3">
						<div class="col-sm-5">
							<select class="form-control"  name="price_low">
								
								<c:if test="${requestScope.queryPrice_low != null}">
									<option value="${requestScope.queryPrice_low}">${requestScope.queryPrice_low}</option>
								</c:if>

								<option value="-100000">最低价不限</option>
								<c:forEach items="${requestScope.priceList }" var="price">
									<option value="${price.getPrice_classify_num() }">${price.getPrice_classify_num() }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-2"><font size="4px"><b><--></b></font></div>
						<div class="col-sm-5">
							<select class="form-control"  name="price_high">
								
								<c:if test="${requestScope.queryPrice_high != null}">
									<option value="${requestScope.queryPrice_high}">${requestScope.queryPrice_high}</option>
								</c:if>
								
								<option value="1000000000">最高价不限</option>
								<c:forEach items="${requestScope.priceList }" var="price">
									<option value="${price.getPrice_classify_num() }">${price.getPrice_classify_num() }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<!-- 上架时间筛选 -->
					<div class="col-sm-4">
						
						<div  class="col-sm-2"><label class="control-label">上架<br>时间</label></div>
						<div class="col-sm-4">
							<input class="sang_Calender" name="time_start" value='<c:out value="${requestScope.queryTimeStart }" default="不限制"></c:out>' >
						</div>
						<div class="col-sm-2"><label class="control-label"><font size="4px"><b><--></b></font></label></div>
						<div class="col-sm-4">
							<input class="sang_Calender" name="time_end" value='<c:out value="${requestScope.queryTimeEnd }" default="不限制"></c:out>'>
						</div>
					</div>
					<div class="col-sm-1">
						<button type="submit" class="btn btn-primary"> 搜  索 </button>
					</div>
				</div><br>
				
			</form>
			
			
		</div>
		
		<!-- 车辆显示列表 -->
		<div style="min-height:600px;">
			
			<table class="table table-condensed table-hover" style="width:80%;" align="center">
					<thead>
						<tr class="active">
							<th>图片</th>
							<th>名称</th>
							<th>品牌</th>
							<th>原价</th>
							<th>现价</th>
							<th>购买时间</th>
							<th>开售时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.onlineCarList }" var="car">
						<tr>
							<td><img class="imgSrc"  src="/images/secondHandCarSystem/${car.getCar_img() }" width="210px"></td>
							<td style="vertical-align:middle"><c:out value="${car.getCar_name() }"></c:out></td>
							<td style="vertical-align:middle"><c:out value="${car.getBrand_name() }"></c:out></td>
							<td style="vertical-align:middle"><c:out value="${car.getCar_price_old() }"></c:out></td>
							<td style="vertical-align:middle"><c:out value="${car.getCar_price_new() }"></c:out></td>
							<td style="vertical-align:middle"><c:out value="${car.getCar_time_buy() }"></c:out></td>
							<td style="vertical-align:middle"><c:out value="${car.getCar_time_shelf() }"></c:out></td>
							<td style="vertical-align:middle">
								<a href="${pageContext.request.contextPath }/userShop/addShopCart?shopCart_car_id=${car.getCar_id()}&shopCart_person_id=${ sessionScope.loginSession.getLogin_id()}"><button class="btn btn-warning">加入购物车</button></a>
								<a href="${pageContext.request.contextPath }/orderManage/addOrderInit?shopCart_car_id=${car.getCar_id()}&shopCart_person_id=${ sessionScope.loginSession.getLogin_id()}"><button class="btn btn-info">立即购买</button></a>
							</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
	
		</div>
		<!-- 车辆显示列表end -->
		<div style="height:50px"></div>
		<center>
			<ul class="pagination pagination-lg">
				<li><a href="${pageContext.request.contextPath }/userShop/shopInit?currentpage=1">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/userShop/shopInit?currentpage=${requestScope.page.getFront()}">&laquo;上一页</a></li>
			    <li><a>${requestScope.page.getCurrentpage() }</a></li>
			    <li><a href="${pageContext.request.contextPath }/userShop/shopInit?currentpage=${requestScope.page.getNext()}">下一页 &raquo;</a></li>
			    <li><a href="${pageContext.request.contextPath }/userShop/shopInit?currentpage=${requestScope.page.getLast()}">尾页</a></li>
			</ul><br>
		</center>
			
		
		
		
		<div style="height:200px"></div>
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		
		
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/datetime.js"></script>

</html>