<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>二手车管理-添加</title>
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
	</head><script type="text/javascript">
		$(function(){
			$("#addCarForm").validate({
			    // 添加验证规则
			    rules: {
			    	car_name: {
			    		required :true,
			    	},
			    	car_price_old:{
			    		required :true,
			    		number:true,
			    	},
			    	car_price_new:{
			    		required:true,
			    		number:true,
			    	},
			    	car_time_buy:{
			    		required:true,
			    	}
			    },
			    //重设提示信息
			    messages:{
			    	car_name: "请输入车辆名称",
			    	car_price_old: "请输入原价（数字）",
			    	car_price_new: "请输入现价（数字）",
			    	car_time_buy:"请输入购买时间（yyyy-mm-dd）",
			    }
			}); 
			
		})
	</script>
	<style>
		input.error { border: 1px solid red; }
		label.error {
		    font-weight: bold;
		    color: #EA5200;
		}
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
		
		
		
		<!-- 车辆添加表单 -->
		<div style="min-height:600px;">
			
			<div style="height:40px"></div>
			<label style="margin-left:80px"><font size="4px">添加汽车页面</font></label>
				
			<div class="container">
				<a href="${pageContext.request.contextPath}/shop/queryAllDownShelfCar"><button type="button" style="float:right" class="btn btn-info">下架车辆管理</button></a>
				<a href="${pageContext.request.contextPath}/shop/queryAllOnlineCar"><button type="button" style="float:right" class="btn btn-info">在售车辆管理</button></a>
			</div>
				
			<br><br>
			<hr style="border:  double 1px #ADADAD;" />
			<div style="height:30px"></div>
			
			<form class="form-horizontal" method="post" role="form" id="addCarForm" action="${pageContext.request.contextPath }/shop/addCar" enctype="multipart/form-data" >
				<div class="form-group">
					<label class="col-sm-2 control-label">图片</label>
					<div class="col-sm-8">
						<input class="form-control" name="imgSrc" id="imgSrc" type="file">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">车辆名称</label>
					<div class="col-sm-8">
						<input class="form-control" name="car_name"  type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">品牌</label>
					<div class="col-sm-8">
						<select name="car_brand_id" class="form-control">
							<c:forEach items="${requestScope.BrandList }" var="brand">
								<option value="${brand.getBrand_id() }"><c:out value="${brand.getBrand_name() }"></c:out></option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">原价</label>
					<div class="col-sm-8">
						<input class="form-control" name="car_price_old"  type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">现价</label>
					<div class="col-sm-8">
						<input class="form-control" name="car_price_new"  type="text">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">购买时间</label>
					<div class="col-sm-8">
						<input type="text" id="car_time_buy" name="car_time_buy" class="sang_Calender" />
					</div>
				</div>
				
				<input class="form-control" name="car_shop_id" value="${sessionScope.shoploginSession.getLogin_id() }"  type="hidden">
				<br><br>
				<button type="submit" id="sumBtn" style="margin-left: 260px;" class="btn btn-primary"> 提 交 </button>
				<button type="reset" style="margin-left: 100px;" class="btn btn-primary"> 取 消 </button>
				<br>
				
			</form>
	
		</div>
		<!-- 车辆显示列表end -->
		
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