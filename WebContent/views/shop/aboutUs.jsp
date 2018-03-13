<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>关于我们</title>
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
		<script src="${pageContext.request.contextPath }/static/user/js/jquery.validate.js"></script>
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
	    		background: url("${pageContext.request.contextPath}/static/user/images/aboutUsBg.jpg") fixed center ;
	   	 	}
		</style>
		
	<body>
		<!--header-->
		<div class="header">
			<div class="container">
				<div class="header-info navbar-left wow fadeInLeft animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<p>您好：<c:out value="${sessionScope.shoploginSession_name }" default=""></c:out></p>
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
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shopSaleCountManage/saleOrderByTime">销量统计</a>
							</li>
							<li class="hvr-bounce-to-bottom active">
								<a href="${pageContext.request.contextPath }/views/shop/aboutUs.jsp">关于我们</a>
							</li>
						</ul>
						<div class="clearfix"> </div>
					</div>
				</div>
			</nav>
		</div>
		<!--navigation-->
		
		<div style="height:1000px;">
			
			<div style="height:100px;"></div>
			
			<div style="color:white;margin-left:100px;">
				<font size="4px" face="宋体">公司概况</font>
				<div style="width:700px;">
					<font size="4px" face="楷体">&nbsp;&nbsp;&nbsp;&nbsp;公司是专业的二手车在线交易服务提供商。我们的核心业务涵盖了二手车网络交易、二手车电商零售平台，以及二手车金融衍生服务。我们致力于为中国二手车行业的发展做出贡献，利用互联网及移动互联网技术，推动和建立中国未来二手车市场的诚信与高效。</font>
				</div>
			</div>
			
			<div style="height:50px;"></div>
			<div style="color:white;margin-left:100px;">
				<font size="4px" face="宋体">技术新颖</font>
				<div style="width:700px;">
					<font size="4px" face="楷体">&nbsp;&nbsp;&nbsp;&nbsp; 我们专业提供二手车零售的电商平台。利用互联网与移动互联网技术，以及我们在二手车行业多年来的专业经验积累，增加二手车交易在消费者心中的透明度，为消费者提供在二手车购买的整个环节中相关的咨询、购买及售后等服务。</font>
				</div>
			</div>
			
			<div style="height:50px;"></div>
			<div style="color:white;margin-left:100px;">
				<font size="4px" face="宋体">公平快捷</font>
				<div style="width:700px;">
					<font size="4px" face="楷体">&nbsp;&nbsp;&nbsp;&nbsp; 我们利用互联网和移动互联网技术，建立的一个透明、高效的二手车交易平台。提供检测、收付款、过户、物流等全交易链服务，帮助有批发需求的经销商用更合适的市场价格，快速完成交易；给需要建立库存的经销商提供丰富的市场选择。</font>
				</div>
			</div>
			
			<div style="height:50px;"></div>
			<div style="color:white;margin-left:100px;">
				<font size="4px" face="宋体">金融把控</font>
				<div style="width:700px;">
					<font size="4px" face="楷体">&nbsp;&nbsp;&nbsp;&nbsp;   基于二手车市场金融衍生类服务机构，利用集团在二手车行业的专业技术以及大数据分析的能力，为二手车的零售金融和供应链金融提供更加精准高效的金融服务。业务涵盖对公融资、消费信贷、二手车延保服务等专业汽车金融产品，帮助消费者降低购车门槛，让经销商的业务更快拓展。</font>
				</div>
			</div>
			
		
		</div>
		
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		
		
	</body>

</html>