<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>个人信息首页--修改信息</title>
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
						person_name : {
							required:true,
							rangelength:[2,10],
						},
						person_tel :{
							required:true,
							digits:true,
							rangelength:[11,11],
						},
						person_address:{
							maxlength: 30,
						},
						person_email:{
							email:true,
						}
				
					},
		
					//重设提示信息
					messages : {
						person_name : "请输入 2-10 位的用户名",
						person_tel : "请输入正确的手机号",
						person_address : "请输入小于30个字符的地址",
						person_email :"请输入正确的email"
					}
				});
				
				
				//将性别（gender）对应的单选框选上
				$gender = "${requestScope.updatePersonInfo.getPerson_gender()}";
				if( $gender == "男"){
					$("#man").attr("checked", true);
				}
				if( $gender == "女"){
					$("#woman").attr("checked", true);
				}
				
				//利用ajax确定修改后的电话号码没有被注册
				$("#person_tel").change(function(){
					var $oldTel = "${requestScope.updatePersonInfo.getPerson_tel()}";
					var $person_tel_value = $('#person_tel').val();
					if( $oldTel == $person_tel_value){
						return false;
					}
	       			$.post("${pageContext.request.contextPath}/user/ajaxTextTelExist", 
	       					{ person_tel : $person_tel_value },
	       					/**
	       						响应成功之后的操作
	       					*/
	       					function(data){
	       						if(data == true){
	       							$("#person_tel").after("<font color='red' id='telExist'>对不起，您输入的手机号已经被注册了</font>");
	       							$("#submitButton").attr("disabled",true); 
	       						}else{
	       							$("#telExist").remove();
	       						}
	       					},"json"
	   				);
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
		body {

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
					<p>您好：<c:out value="${sessionScope.loginSession_name }" default=""></c:out></p>
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
							<li class="hvr-bounce-to-bottom ">
								<a href="${pageContext.request.contextPath }/indexInitAction">主页</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/userShop/shopInit">商城</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/shopCart/shopCartList">购物车</a>
							</li>
							<li class="hvr-bounce-to-bottom">
								<a href="${pageContext.request.contextPath }/orderManage/notPayOrder">订单管理</a>
							</li>
							<li class="hvr-bounce-to-bottom active">
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
		
		<!-- 个人信息功能分类 -->
		<div style="border:solid red 1px">
			
			<div style="height:130px;width:90%">
				<br><br>
				<a href="${pageContext.request.contextPath }/views/user/userInfo/changePassword.jsp"><button type="button" style="float:right" class="btn btn-info">修改个人密码</button></a>
			</div>
	 
			<form class="form-horizontal" role="form" id="updateInfoForm" action="${pageContext.request.contextPath }/user/saveUpdatePersonInfo">
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">账号</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="person_id" value="${requestScope.updatePersonInfo.getPerson_id() }" readonly="true">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">注册时间</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="person_time_register" value="${requestScope.updatePersonInfo.getPerson_time_register() }" readonly="true">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="person_name" value="${requestScope.updatePersonInfo.getPerson_name() }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-8">
						<input type="radio" id="man" name="person_gender" value="男">男
						<input type="radio" id="woman" name="person_gender" value="女">女
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">电话号码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="person_tel" name="person_tel" value="${requestScope.updatePersonInfo.getPerson_tel() }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">家庭住址</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="person_address" value="${requestScope.updatePersonInfo.getPerson_address() }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputText" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="person_email" value="${requestScope.updatePersonInfo.getPerson_email() }">
					</div>
				</div>
				<br><br>
				
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