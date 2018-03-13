<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>销量统计--时间</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/style_index.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/index.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.validate.js"></script>
		
	</head>
	<style>
		body{
	    	background: url("${pageContext.request.contextPath}/static/admin/images/bg05.jpg") fixed center ;
	    } 
	</style>
	<body onload="startTime()">
		<div class="nav-top">
			<span><a href="${pageContext.request.contextPath }/views/admin/index.jsp"><font color="white">二手车交易平台</font></a></span>
			<div class="nav-topright">
				<span id="nowDateTimeSpan"></span></font>    
				<!-- 判断是否处于登录状态 -->
				<span>您好<c:if test="${sessionScope.adminloginSession.getLogin_permission() == 'admin' }">：管理员</c:if></span>
				<span><a href="${pageContext.request.contextPath }/loginInitAction"><font color="aqua">注 销</font></a></span>
			</div>
		</div>
		<div class="nav-down">
			<div class="leftmenu1">
				<div class="menu-oc"><img src="${pageContext.request.contextPath }/static/admin/images/menu-all.png" /></div>
				<ul>
					<li>
						<a class="a_list a_list1">二手车管理</a>
						<div class="menu_list menu_list_first">
							<a href="${pageContext.request.contextPath }/admin/queryAllOnlineCar">在售车辆</a>
							<a href="${pageContext.request.contextPath }/admin/queryAllDownShelfCar">下架车辆</a>
						</div>
					</li>
					<li>
						<a class="a_list a_list1">品牌管理</a>
						<div class="menu_list menu_list_first">
							<a href="${pageContext.request.contextPath }/views/admin/brandManage/brand_add.jsp">添加品牌</a>
							<a href="${pageContext.request.contextPath }/admin/brandListInit">品牌管理</a>
						</div>
					</li>
					<li>
						<a class="a_list a_list1">分类管理</a>
						<div class="menu_list menu_list_first">
							<a href="${pageContext.request.contextPath }/adminClassifyManage/queryAllBrand">品牌分类管理</a>
							<a href="${pageContext.request.contextPath }/adminClassifyManage/getAllPrice">价格分类管理</a>
						</div>
					</li>
					<li>
						<a class="a_list a_list2">推荐管理</a>
						<div class="menu_list menu_list_first">
							<a href="${pageContext.request.contextPath }/adminRecommandManage/recommandList">推荐车辆</a>
						</div>
					</li>
					<li>
						<a class="a_list a_list2">订单管理</a>
						<div class="menu_list">
							<a href="${pageContext.request.contextPath }/adminOrderManage/orderNotSendList">未发货订单</a>
							<a href="${pageContext.request.contextPath }/adminOrderManage/orderNotReceiveList">未收货订单</a>
							<a href="${pageContext.request.contextPath }/adminOrderManage/orderHistoryList">历史订单</a>
							<a href="${pageContext.request.contextPath }/adminOrderManage/orderDeleteList">回收站</a>
						</div>
					</li>
					<li>
						<a class="a_list a_list3">销量统计</a>
						<div class="menu_list">
							<a href="${pageContext.request.contextPath }/saleCountManage/brandSaleList">品牌统计</a>
							<a href="${pageContext.request.contextPath }/saleCountManage/timeSaleList">时间统计</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="leftmenu2">
				<div class="menu-oc1"><img src="${pageContext.request.contextPath }/static/admin/images/menu-all.png" /></div>
				<ul>
					<li>
						<a class="j_a_list j_a_list1"></a>
					</li>
					<li>
						<a class="j_a_list j_a_list2"></a>
					</li>
					<li>
						<a class="j_a_list j_a_list3"></a>
					</li>
				</ul>

			</div>
			<div class="rightcon">
				
				
				
				<div style="height:40px"></div>
				<label style="margin-left:80px"><font size="4px">月份销售统计列表</font></label>
				<hr style="border:  double 1px #ADADAD;" />
				<div style="height:30px"></div>
				
				<form action="${pageContext.request.contextPath }/saleCountManage/timeSaleList">
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<label class="col-sm-1 control-label"> 年 份 </label>
						<div class="col-sm-5">
							<input class="form-control" value="${requestScope.year }" name="year" type="text">
						</div>
						<div class="col-sm-2">
							<input class="btn btn-default" value=" 确 定  "  type="submit">
						</div>
					</div>
				</form>
				
				<br><br>
				
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
							<td>1</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month1() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month1() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=01&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
							
						</tr>
						<tr>
							<td>2</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month2() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month2() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=02&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>3</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month3() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month3() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=03&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>4</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month4() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month4() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=04&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>5</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month5() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month5() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=05&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>6</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month6() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month6() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=06&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>7</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month7() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month7() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=07&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>8</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month8() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month8() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=08&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>9</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month9() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month9() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=09&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>10</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month10() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month10() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=10&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>11</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month11() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month11() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=11&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						<tr>
							<td>12</td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_saleNum_month12() }" default="0"></c:out></td>
							<td><c:out value="${requestScope.saleTimeBrand.getBrand_salePrice_month12() }" default="0"></c:out></td>
							<td><a href="${pageContext.request.contextPath }/saleCountManage/saleOrderByMonth?month=12&year=${requestScope.year}"><button class="btn btn-default"> 详 情 </button></a></td>
						</tr>
						
					</tbody>
				</table>
				
	
				
			</div>
		</div>

	</body>

</html>
