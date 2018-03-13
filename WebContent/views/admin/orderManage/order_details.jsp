<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>订单信息详情列表</title>
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
				
				<div style="height:50px"></div>
				<label style="margin-left:100px"><font size="4px">订单详情页面</font></label>
				<hr style="border:  solid 1px #ADADAD;" /><br>
				
				<div style="height:30px"></div>
				
					<form class="form-horizontal" role="form" >
						
						
						<div class="form-group">
							<div class="col-sm-3"></div>
							<div class="col-sm-2">
								<img class="imgSrc" src="/images/secondHandCarSystem/${requestScope.detailsOrder.getCar_img() }" width="300px">
							</div>
							<div class="col-sm-1"></div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-2 control-label">订单号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="order_id" value="${ requestScope.detailsOrder.getOrder_id() }" >
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">车辆名称</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="car_name" value="${ requestScope.detailsOrder.getCar_name() }" >
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">价格</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="car_price_new" value="${ requestScope.detailsOrder.getCar_price_new() }" readonly="true">
									</div>
								</div>
							</div>
						</div>	
						<!-- 第一级，付款时间 -->
						<c:choose>
							<c:when test="${ requestScope.detailsOrder.getOrder_time_receive() !=null }">
	  							<div class="form-group">
									<label for="inputPassword" class="col-sm-3 control-label">收货时间</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" name="order_time_receive" value="${ requestScope.detailsOrder.getOrder_time_receive() }" >
									</div>
								</div>
	  					 	</c:when>
							<c:otherwise> 
								
								<!-- 第二级，发货时间 -->
	  							<c:choose>
	  								<c:when test="${ requestScope.detailsOrder.getOrder_time_send() != null }">
	  									<div class="form-group">
		  									<label for="inputPassword" class="col-sm-3 control-label">发货时间</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="order_time_send" value="${ requestScope.detailsOrder.getOrder_time_send() }" >
											</div>
										</div>
	  								</c:when>
	  								<c:otherwise>
	  									
  										<!-- 第三级，付款时间 -->
				  							<c:choose>
				  								<c:when test="${ requestScope.detailsOrder.getOrder_time_pay() != null }">
				  									<div class="form-group">
					  									<label for="inputPassword" class="col-sm-3 control-label">付款时间</label>
														<div class="col-sm-8">
															<input type="text" class="form-control" name="order_time_pay" value="${ requestScope.detailsOrder.getOrder_time_pay() }" >
														</div>
													</div>
				  								</c:when>
				  								<c:otherwise></c:otherwise>
				  							</c:choose>
	  								</c:otherwise>
	  							</c:choose>
	  						
	  						
	  						</c:otherwise>
						</c:choose>
	
						
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">联系人</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="order_person_name" value="${ requestScope.detailsOrder.getOrder_person_name() }" >
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">备注</label>
							<div class="col-sm-8">
								<textarea rows="2" class="form-control" name="order_message"><c:out value="${requestScope.detailsOrder.getOrder_message() }" default=""></c:out></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">交易地址</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="order_address" value="${ requestScope.detailsOrder.getOrder_address() }" >
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">联系方式</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="order_tel" value="${ requestScope.detailsOrder.getOrder_tel() }" >
							</div>
						</div>
						
						
						<br>
						<br>
						
					</form>
				
				<br>
				
				
				

			</div>
		</div>

	</body>

</html>
