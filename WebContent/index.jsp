<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>首页</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/login/js/jquery-2.2.3.min.js"></script>
	</head>
	
	<script type="text/javascript">
		$(function(){
			$href = $("a").attr("href");
			 window.location.href = $href;
		})
	</script>
	
	<body>
		<a name="login" href="${pageContext.request.contextPath }/loginInitAction"></a>
	</body>
	
</html>