<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>在售汽车管理</title>
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
				<label style="margin-left:80px"><font size="4px">在售汽车列表</font></label>
				<hr style="border:  double 1px #ADADAD;" />
				<div style="height:30px"></div>
				
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/queryOnlineCarById">
				
					<div class="form-group">
						<label  class="col-sm-2 control-label">汽车编号或名称</label>
						<div class="col-sm-6">
							<input class="form-control" name="car_id" value="${requestScope.queryString }"  type="text">
						</div>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default"> 搜  索 </button>
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
								<a href="${pageContext.request.contextPath }/admin/carDetail?car_id=${car.getCar_id()}"><button class="btn btn-primary">详情</button></a>
								<a href="${pageContext.request.contextPath }/admin/carUpdateInit?car_id=${car.getCar_id()}"><button class="btn btn-info">修改</button></a>
								<a href="${pageContext.request.contextPath }/admin/carDownShelf?car_id=${car.getCar_id()}"><button class="btn btn-danger">下架</button></a>
							</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
				<div style="height:50px"></div>
				<center>
					<c:if test="${requestScope.queryKind == 'all' }">
						<ul class="pagination pagination-lg">
							<li><a href="${pageContext.request.contextPath }/admin/queryAllOnlineCar?currentpage=1">首页</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/queryAllOnlineCar?currentpage=${requestScope.page.getFront()}">&laquo;上一页</a></li>
						    <li><a>${requestScope.page.getCurrentpage() }</a></li>
						    <li><a href="${pageContext.request.contextPath }/admin/queryAllOnlineCar?currentpage=${requestScope.page.getNext()}">下一页 &raquo;</a></li>
						    <li><a href="${pageContext.request.contextPath }/admin/queryAllOnlineCar?currentpage=${requestScope.page.getLast()}">尾页</a></li>
						</ul><br>
					</c:if>
					
					<c:if test="${requestScope.queryKind == 'idOrName' }">
						<ul class="pagination pagination-lg">
							<li><a href="${pageContext.request.contextPath }/admin/queryOnlineCarById?currentpage=1&car_id=${ requestScope.queryString }">首页</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/queryOnlineCarById?currentpage=${requestScope.page.getFront()}&car_id=${ requestScope.queryString }">&laquo;上一页</a></li>
						    <li><a>${requestScope.page.getCurrentpage() }</a></li>
						    <li><a href="${pageContext.request.contextPath }/admin/queryOnlineCarById?currentpage=${requestScope.page.getNext() }&car_id=${ requestScope.queryString }">下一页 &raquo;</a></li>
						    <li><a href="${pageContext.request.contextPath }/admin/queryOnlineCarById?currentpage=${requestScope.page.getLast() }&car_id=${ requestScope.queryString }">尾页</a></li>
						</ul><br>
					</c:if>
				</center>	
				<div style="height:50px"></div>
				
			</div>
		</div>

	</body>

</html>
