<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>个人信息--修改密码</title>
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
		
		<script type="text/javascript">
			$(function() {
				$("#updateInfoForm").validate({
					// 添加验证规则
					rules : {
						oldPwd : {
							required:true,
							rangelength:[5,18],
						},
						newPwd :{
							required:true,
							rangelength:[5,18],
						},
						pwdRepeat:{
							required:true,
							equalsTo: "#newPwd",
						},
				
					},
		
					//重设提示信息
					messages : {
						oldPwd : "请输入旧密码",
						newPwd : "请输入5-18 位的新密码",
						pwdRepeat : "两次密码输入不一致",
					}
				});
				
				
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
	    	background: url("${pageContext.request.contextPath}/static/user/images/userBg.jpg") fixed center ;
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
							<li class="hvr-bounce-to-bottom active">
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
		
		<!-- 个人信息功能分类 -->
		<div style="border:solid red 1px;height:700px">
			
			<div style="height:130px;width:90%">
				<br><br>
				<a href="${pageContext.request.contextPath }/shop/updateInfoInit"><button type="button" style="float:right" class="btn btn-info">个人信息修改</button></a>
			</div>
	 
			<form class="form-horizontal" role="form" id="updateInfoForm" action="${pageContext.request.contextPath }/shop/changePassword">
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">原密码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="oldPwd" placeholder="请输入原密码" >
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="newPwd" name="newPwd" placeholder="请输入新密码"" >
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">确认新密码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="pwdRepeat" placeholder="请再次输入新密码"">
					</div>
				</div>
				
				<br>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label"></label>
					<div class="col-sm-8">
						<font color="red" size="4"><c:out value="${requestScope.changePwdError }" default=""></c:out></font>
						<font color="bule" size="4"><c:out value="${requestScope.changePwdSuccess }" default=""></c:out></font>
					</div>
				</div>
				<br>
				
				<button class="btn btn-info" type="submit" id="submitButton" style="margin-left:350px"> 提  交  </button>	
				<button class="btn btn-primary" type="reset" style="margin-left:200px"> 取  消  </button>
			</form>


			<div style="height:100px"></div>

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