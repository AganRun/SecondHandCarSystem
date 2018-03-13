<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>品牌信息修改</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/style_index.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/index.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.validate.js"></script>
		
	</head>
	<style>
		body{
	    	background: url("${pageContext.request.contextPath}/static/admin/images/bg05.jpg") fixed center ;
	    } 
	</style>
	<script type="text/javascript">
		$(function(){
			$("#brandUpdateForm").validate({
			    // 添加验证规则
			    rules: {
			    	brand_name: "required",
			    	brand_saleNum_month1: {
			    		digits:true,
			    		required:true,
			    	}
			    },
			    //重设提示信息
			    messages:{
			    	brand_name: "请输入品牌名称",
			    	brand_saleNum_month1:"请输入整数",
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
			<div class="rightcon" style="">
				
				
				<form class="form-horizontal" role="form" id="brandUpdateForm" action="${pageContext.request.contextPath }/admin/saveBrand">
				
					<div style="height:100px"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><font size="4px">品牌详情</font></label>
						<div class="col-sm-12"></div>
					</div>
					<br>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">品牌编号</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_id" value="${requestScope.brandUpdate.getBrand_id() }"  type="text" readonly="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">品牌名称</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_name" value="${requestScope.brandUpdate.getBrand_name() }"  type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否允许用户搜索</label>
						<div class="col-sm-8">
							<select name="brand_be_query" class="form-control"> 
								<c:if test="${requestScope.brandUpdate.getBrand_be_query() == 'true' }">
									<option value="true">可搜索</option>
									<option value="false">不可搜索</option>
								</c:if>
								<c:if test="${requestScope.brandUpdate.getBrand_be_query() == 'false' }">
									<option value="false">不可搜索</option>
									<option value="true">可搜索</option>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">一月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month1" value="${requestScope.brandUpdate.getBrand_saleNum_month1() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">一月销售价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month1" value="${requestScope.brandUpdate.getBrand_salePrice_month1() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">二月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month2" value="${requestScope.brandUpdate.getBrand_saleNum_month2() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">二月销售价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month2" value="${requestScope.brandUpdate.getBrand_salePrice_month2() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">三月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month3" value="${requestScope.brandUpdate.getBrand_saleNum_month3() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">三月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month3" value="${requestScope.brandUpdate.getBrand_salePrice_month3() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">四月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month4" value="${requestScope.brandUpdate.getBrand_saleNum_month4() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">四月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month4" value="${requestScope.brandUpdate.getBrand_salePrice_month4() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">五月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month5" value="${requestScope.brandUpdate.getBrand_saleNum_month5() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">五月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month5" value="${requestScope.brandUpdate.getBrand_salePrice_month5() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">六月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month6" value="${requestScope.brandUpdate.getBrand_saleNum_month6() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">六月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month6" value="${requestScope.brandUpdate.getBrand_salePrice_month6() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">七月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month7" value="${requestScope.brandUpdate.getBrand_saleNum_month7() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">七月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month7" value="${requestScope.brandUpdate.getBrand_salePrice_month7() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">八月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month8" value="${requestScope.brandUpdate.getBrand_saleNum_month8() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">八月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month8" value="${requestScope.brandUpdate.getBrand_salePrice_month8() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">九月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month9" value="${requestScope.brandUpdate.getBrand_saleNum_month9() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">九月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month9" value="${requestScope.brandUpdate.getBrand_salePrice_month9() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">十月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month10" value="${requestScope.brandUpdate.getBrand_saleNum_month10() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">十月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month10" value="${requestScope.brandUpdate.getBrand_salePrice_month10() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">十一月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month11" value="${requestScope.brandUpdate.getBrand_saleNum_month11() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">十一月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month11" value="${requestScope.brandUpdate.getBrand_salePrice_month11() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">十二月销量数量</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_saleNum_month12" value="${requestScope.brandUpdate.getBrand_saleNum_month12() }" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">十二月销量价钱</label>
						<div class="col-sm-8">
							<input class="form-control" name="brand_salePrice_month12" value="${requestScope.brandUpdate.getBrand_salePrice_month12() }" type="text">
						</div>
					</div>
					
					<br>
					<button type="submit" style="margin-left: 250px;" class="btn btn-default"> 提 交 </button>
					<button type="reset" style="margin-left: 50px;" class="btn btn-default"> 取 消 </button>
					<br>
					<div style="height:100px"></div>
					
					
				</form>
			</div>
		</div>

	</body>

</html>
