<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>找回密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/static/user/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath }/static/login/css/login2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/images/login.js"></script>
<script src="${pageContext.request.contextPath }/static/user/js/bootstrap.js"></script>
</head>

<script type="text/javascript">
	$(function(){
		
		//找回密码的表单验证
		$("#findPasswordForm").validate({
			rules:{
				login_id: {
					required:true,
					rangelength:[2,10] 
				},
				person_tel:{
					required:true,
					digits:true,
					rangelength:[11,11] 
				},
				sixNum:{
					required:true,
					rangelength:[6,6],
					digits:true,
				},
				login_password: {
					required:true,
					rangelength:[5,18]
				}
			},
			messages:{
				login_id: "请输入 2-10 位的用户名",
				person_tel: "请输入正确的手机号",
				sixNum: "请输入6 位数字验证码",
				login_password: "请输入5-18 位新的密码"
			}
		});
		
		
		//将在确认顾客电话号码输入正确之前隐藏输入新密码的div
		$("#newPwd").hide();
		
		$("#pTel").hide();
		
		//利用ajax确定 电话号是否正确
		$("#person_tel").change(function(){
			var $login_id = $("#login_id").val();
			var $person_tel = $("#person_tel").val();
   			$.post("${pageContext.request.contextPath}/ajaxTextIdAndTel", 
				{ person_tel : $person_tel, login_id : $login_id },
				/**
					响应成功之后的操作
				*/
				function(data){
					if(data == false){
						$("#pTel").show();
						$("#submitButton").attr("disabled",true); 
					}else{
						$("#pTel").hide();
						$("#newPwd").show();
						$("#submitButton").attr("disabled",false); 
					}
				},"json"
			);
		});
		
		$("#login_id").change(function(){
			var $login_id = $("#login_id").val();
			var $person_tel = $("#person_tel").val();
   			$.post("${pageContext.request.contextPath}/ajaxTextIdAndTel", 
				{ person_tel : $person_tel, login_id : $login_id },
				/**
					响应成功之后的操作
				*/
				function(data){
					if(data == false){
						$("#pTel").show();
						$("#submitButton").attr("disabled",true); 
					}else{
						$("#pTel").hide();
						$("#newPwd").show();
						$("#submitButton").attr("disabled",false); 
					}
				},"json"
			);
		});
		
	})
</script>
<style>
	input.error { border: 1px solid red; }
	label.error {
	    font-weight: bold;
	    font-size:1.2em;
	    color: #EA5200;		
    }	
    
</style>
<body>
	<h1>二手车公平交易平台</h1>

	<div class="login"  style="height:auto;margin-top: 50px;">

		<div>
			<br>
			<center><a><font size="3px" style="text-align:center">找回密码</font></a></center>
			<br>
		</div>
		
		<hr style="border:  double 1px #ADADAD;" />
		
		<form class="form-horizontal" role="form" id="findPasswordForm" action="${pageContext.request.contextPath }/findSaveNewPwd">
			<div class="form-group">
				<label for="inputPassword" class="col-sm-3 control-label">账号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="login_id" name="login_id" placeholder="请输入您的账号" >
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-3 control-label">手机号</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="person_tel" name="person_tel" placeholder="请输入手机号码" >
					<p id="pTel"><font color='red' id='telExist'>对不起，您输入的账户或手机号错误</font></p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-3 control-label">验证码</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="sixNum" placeholder="请输入6位数字验证码">
				</div>
			</div>
			<div class="form-group" id="newPwd">
				<label for="inputPassword" class="col-sm-3 control-label">新密码</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="login_password" placeholder="请再次输入新密码">
				</div>
			</div>
			
			<button class="btn btn-info" type="submit" id="submitButton" style="margin-left:90px"> 提  交  </button>	
			<button class="btn btn-primary" type="reset" style="margin-left:50px"> 取  消  </button>
			
			<br>
			<br>
			
		</form>
		
	</div>

</body>
</html>