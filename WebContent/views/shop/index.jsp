<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>二手车主页</title>
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
		<!-- //js -->
		<!--animate-->
		<link href="${pageContext.request.contextPath }/static/user/css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="${pageContext.request.contextPath }/static/user/js/wow.min.js"></script>
		<script>
			new WOW().init();
		</script>
		<!--//end-animate-->
	</head>

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
							<li class="hvr-bounce-to-bottom active">
								<a href="${pageContext.request.contextPath }/views/shop/index.jsp">主页</a>
							</li>
							<li class="hvr-bounce-to-bottom">
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
		<!--banner-->
		<div class="banner">
			<div class="banner-title">
				<div class="container">
					<div id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li>
								<div class="banner-text">
									<h2>更加实惠</h2>
									<p>以海量、真实的二手车信息为基础，为用户提供更贴心的服务，更透明的交易，更低价格，更多优惠。</p>
									<a class="more" href="http://www.che168.com/nindex.html#pvareaid=100950" target="_blank"> Read More</a>
								</div>
							</li>
							<li>
								<div class="banner-text">
									<h2>更加安全 </h2>
									<p>力求资讯真实、车源可靠。在审核全国二手车车辆信息过程中严格、公正、周密，为您在网上买卖二手车时提供贴心服务。</p>
									<a class="more" href="http://www.che168.com/nindex.html#pvareaid=100950" target="_blank"> Read More</a>
								</div>
							</li>
							<li>
								<div class="banner-text">
									<h2>更加专业</h2>
									<p>专业的车辆信息审核团队，精准的车源搜索及推荐功能,严格审核每条车源信息，最大程度上确保车辆信息的真实合法性。</p>
									<a class="more" href="http://www.che168.com/nindex.html#pvareaid=100950" target="_blank"> Read More</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--//banner-->
		<!--about-->
		<div class="about" id="about">
			<div class="container">
				<h3 class="title">欢迎来到二手车交易平台</h3>
				<div class="col-md-4 about-left wow fadeInLeft animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<img src="${pageContext.request.contextPath }/static/user/images/img2.jpg" alt="">
				</div>
				<div class="col-md-8 about-right wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<h4>为了你们的满意，我们一直在路上！！！</h4>
					<p>我们帮助买家直接和卖家面对面交易。通过直卖模式，去除了中间商环节，将原本由中间商层层加码产生的差价让渡给买卖双方，实现了“卖家多卖，买家多省”的双赢局面。
						为了保证买卖双方的流畅体验，我们对车源进行了限制，规定平台上卖方的车只能是8年15万公里以内的个人二手车。同时，我们确保平台上的每一辆车都经过五维立体检测体系的严格检测，从源头上保障车况。
						凭借高质量的服务和先进的交易模式，我们发展势头迅猛，员工人数已超过5000人。2015年，我们累计销售额超过了37亿元人民币；在后服务领域，为用户提供了超过2亿元的贷款服务。
						目前，我们已经覆盖全国200多个城市。</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		
		<!--special-->
		<div class="special">
			<div class="container">
				<div class="col-md-12 special-grids wow fadeInLeft animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<h3 class="title"><font face="宋体">我们的成绩</font></h3>
					<font face="楷体" size="3px">一直以来，我们从没有忘了我们的初心。 把最好的服务带给您，您的满意是对我们最大的肯定，您的微笑就是我们前进的动力。</font><br />
					<h6>市场份额</h6>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
							40%
						</div>
					</div>
					<h6>有经验员工</h6>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
							80%
						</div>
					</div>
					<h6>免费服务项目</h6>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:90%;">
							90%
						</div>
					</div>
					<h6>研究室</h6>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
							75%
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<!--//special-->
		<!--services-->
		<div class="services" id="services">
			<div class="container">
				<div class="row work-row">
					<div class="col-sm-6 col-md-4 work-row-grids wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
						<div class="work-grids-img">
							<span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>
						</div>
						<div class="caption work-captn">
						</div>
					</div>
					<div class="col-sm-6 col-md-4 work-row-grids wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
						<div class="work-grids-img">
							<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
						</div>
						<div class="caption work-captn">
						</div>
					</div>
					<div class="col-sm-6 col-md-4 work-row-grids wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
						<div class="work-grids-img">
							<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</div>
						<div class="caption work-captn">
						</div>
					</div>
					<div class="col-sm-6 col-md-4 work-row-grids wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
						<div class="work-grids-img">
							<span class="glyphicon glyphicon-sound-5-1" aria-hidden="true"></span>
						</div>
						<div class="caption work-captn">
						</div>
					</div>
					<div class="col-sm-6 col-md-4 work-row-grids wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
						<div class="work-grids-img">
							<span class="glyphicon glyphicon-oil" aria-hidden="true"></span>
						</div>
						<div class="caption work-captn">
						</div>
					</div>
					<div class="col-sm-6 col-md-4 work-row-grids wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
						<div class="work-grids-img">
							<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
						</div>
						<div class="caption work-captn">
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!--//services-->
		<!--portfolio-->
		<div class="portfolio" id="gallery">
			<div class="container">
				<h3 class="title">我们的商品</h3>
				<div class="portfolio-grids">
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img2.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img2.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img3.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img3.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img4.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img4.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img5.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img5.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img6.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img6.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img7.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img7.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img4.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img4.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img1.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img1.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="col-md-4 port-grids view view-fourth">
						<a class="example-image-link" href="${pageContext.request.contextPath }/static/user/images/img5.jpg" data-lightbox="example-set" data-title="">
							<img src="${pageContext.request.contextPath }/static/user/images/img5.jpg" class="img-responsive" alt="" />
							<div class="mask">
								<p>A wonderful serenity has taken possession of my which I enjoy with my whole heart.</p>
							</div>
						</a>
					</div>
					<div class="clearfix"> </div>
					<script src="${pageContext.request.contextPath }/static/user/js/lightbox-plus-jquery.min.js">
					</script>
				</div>
			</div>
		</div>
		<!--//portfolio-->
		<!--footer-->
		<div class="footer wow fadeInRight animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
			<div class="container">
				<p> &copy; 我们是您的不二选择。</p>
			</div>
		</div>
		<!--//footer-->
		<!-- banner-text Slider starts Here -->
		<script src="${pageContext.request.contextPath }/static/user/js/responsiveslides.min.js"></script>
		<script>
			// You can also use "$(window).load(function() {"
			$(function() {
				// Slideshow 3
				$("#slider3").responsiveSlides({
					auto: true,
					pager: true,
					nav: true,
					speed: 500,
					namespace: "callbacks",
					before: function() {
						$('.events').append("<li>before event fired.</li>");
					},
					after: function() {
						$('.events').append("<li>after event fired.</li>");
					}
				});
			});
		</script>
		<!--//End-slider-script -->
		<!-- start-smoth-scrolling-->
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/user/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/user/js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event) {
					event.preventDefault();
					$('html,body').animate({
						scrollTop: $(this.hash).offset().top
					}, 1000);
				});
			});
		</script>
		<!--//end-smoth-scrolling-->
		<!--smooth-scrolling-of-move-up-->
		<script type="text/javascript">
			$(document).ready(function() {
				/*
				var defaults = {
					containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
				};
				*/

				$().UItoTop({
					easingType: 'easeOutQuart'
				});

			});
		</script>
		<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
		<!--//smooth-scrolling-of-move-up-->
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="${pageContext.request.contextPath }/static/user/js/bootstrap.js"></script>
	</body>

</html>