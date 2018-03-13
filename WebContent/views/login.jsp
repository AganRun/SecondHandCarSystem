<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>登录注册页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/static/login/css/login2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/images/login.js"></script>
</head>

<script type="text/javascript">
	$(function(){
		$("#login_form").validate({
		    // 添加验证规则
		    rules: {
		    	login_id: "required",
		    	login_password: "required",
		    },
	
		    //重设提示信息
		    messages:{
		    	login_id: "请输入账号",
		    	login_password: "请填写密码",
		    }
		}); 
		
		$("#regUser").validate({
			rules:{
				username: {
					required:true,
					rangelength:[2,10] 
				},
				tel:{
					required:true,
					digits:true,
					rangelength:[11,11] 
				},
				passwd:{
					required:true,
					rangelength:[5,18] 
				},
				passwdRepeat: {
					required:true,
					equalTo: "#passwd"
				}
			},
			messages:{
				username: "请输入 2-10 位的用户名",
				tel:"请输入正确的手机号",
				passwd: "请输入 5-18 位的密码",
				passwdRepeat: "两次密码输入不相同"
			}
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
	

	<div class="login" style="margin-top: 50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a> 
				<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>
				<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>

		<div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">

			<!--登录-->
			<div class="web_login" id="web_login">

				<div class="login-box">

					<div class="login_form">
						<form action="${pageContext.request.contextPath }/loginAction" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
							<input type="hidden" name="did" value="0" /> 
							<input type="hidden" name="to" value="log" />
							
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">帐号：</label>
								<div class="inputOuter" id="uArea">
									<input type="text" id="u" name="login_id" class="inputstyle" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">密码：</label>
								<div class="inputOuter" id="pArea">
									<input type="password" id="p" name="login_password" class="inputstyle" />
								</div>
							</div>
							
							<!-- 显示错误，并决定是否出现找回密码控件 -->
							<font color="red" size="2px"><c:out value="${requestScope.loginError }" default=""></c:out></font>
							<font color="red" size="2px"><c:out value="${requestScope.loginError1 }" default=""></c:out></font>
							<c:if test="${requestScope.loginError1 != null && requestScope.permission != 'admin'}">
								<a href="${pageContext.request.contextPath }/views/findPassword.jsp">找回密码</a>
							</c:if>
							<div style="padding-left: 50px; margin-top: 20px;">
								<input type="submit" value="登 录" style="width: 150px;" class="button_blue" />
							</div>
						</form>
					</div>

				</div>

			</div>
			<!--登录end-->
		</div>

		<!--注册-->
		<div class="qlogin" id="qlogin" style="display: none;">

			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8" action="${pageContext.request.contextPath }/register" method="post">
					<input type="hidden" name="to" value="reg" /> 
					<input type="hidden" name="did" value="0" />
					<ul class="reg_form" id="reg-ul">
						<li><label for="user" class="input-tips2">用户名：</label>
							<div class="inputOuter2">
								<input type="text" id="user" name="username" class="inputstyle2" />
							</div></li>

						<li><label for="user" class="input-tips2">注册类型：</label>
							<div class="inputOuter2">
								<select class="inputstyle2" name="login_permession" >
									<option value="user">用户</option>
									<option value="shop">商家</option>
								</select>
							</div></li>

						<li><label for="passwd" class="input-tips2">手机号：</label>
							<div class="inputOuter2">
								<input type="text" id="tel" name="tel" class="inputstyle2" />
							</div></li>
						
						<li><label for="passwd" class="input-tips2">密码：</label>
							<div class="inputOuter2">
								<input type="password" id="passwd" name="passwd" class="inputstyle2" />
							</div></li>
						
						<li><label for="passwd2" class="input-tips2">确认密码：</label>
							<div class="inputOuter2">
								<input type="password" id="passwd2" name="passwdRepeat" class="inputstyle2" />
							</div></li>
						<li>
						<font color="red">${requestScope.registerTelError }</font>
						
							<div class="inputArea">
								<input type="submit"  style="margin-top: 10px; margin-left: 85px;" class="button_blue" value="同意协议并注册" /> 
								<a href="https://www.renrenche.com/zz/terms?plog_id=c8b2c377f349b5b5600218cd67e93d00" class="zcxy" target="_blank">注册协议</a>
							</div>

						</li>
						<div class="cl"></div>
					</ul>
				</form>
			

			</div>

		</div>
		<!--注册end-->
		
	</div>
	
	<div  style="margin-left:1000px">
		<br>
		<a href="${pageContext.request.contextPath }/indexInitAction"><font color="white" size="3px">暂不登录</font></a>
	</div>

</body>
</html>