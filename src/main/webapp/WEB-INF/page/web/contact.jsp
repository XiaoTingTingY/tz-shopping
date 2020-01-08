<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Mobile Shop</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/web/css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/web/css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/web/font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/web/fonts/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	
	<!-- Core JavaScript Files -->  	 
    <script src="${pageContext.request.contextPath}/static/web/js/bootstrap.min.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- 通用头部内容页面  -->
	<jsp:include page="/WEB-INF/page/web/body/head.jsp"></jsp:include>
	<!--Top-->
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Contact Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h1>CONTACT US</h1></div>
				</div>
				<div class="col-md-6" style="margin-bottom: 30px;">
					<form name="form1" id="ff" method="post" action="contact.php">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Your Name *" name="name" id="name" required data-validation-required-message="Please enter your name.">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="Your Email *" name="email" id="email" required data-validation-required-message="Please enter your email address.">
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" placeholder="Your Phone *" name="phone" id="phone" required data-validation-required-message="Please enter your phone number.">
						</div>
						<div class="form-group">
							<textarea class="form-control" placeholder="Your Message *" name="message" id="message" required data-validation-required-message="Please enter a message."></textarea>
						</div>
						<button type="submit" class="btn btn-1">Send Message</button>
					</form>
				</div>
				<div class="col-md-6">
					<p><span class="glyphicon glyphicon-home"></span> California, United States 3000009</p>
					<p><span class="glyphicon glyphicon-earphone"></span> +6221 888 888 90 , +6221 888 88891</p>
					<p><span class="glyphicon glyphicon-envelope"></span> info@yourdomain.com</p>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.289259162295!2d-120.7989351!3d37.5246781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8091042b3386acd7%3A0x3b4a4cedc60363dd!2sMain+St%2C+Denair%2C+CA+95316%2C+Hoa+K%E1%BB%B3!5e0!3m2!1svi!2s!4v1434016649434" width="95%" height="230" frameborder="0" style="border:0"></iframe>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/page/web/body/footer.jsp"></jsp:include>
			<script src="${pageContext.request.contextPath}/static/web/js/jquery-2.1.1.js"></script>
		<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/admin/lib/layer/3.1.1/layer.js"></script>
	<script type="text/javascript">
	
		//添加商品
		function addCart(url, id)
		{
			$.ajax(
			{
				type : "POST",
				url : url + "&id=" + id,
				dataType : 'json',
				success : function(data)
				{
					//如果成功
					if (data.code == 1000)
					{
						layer.msg(data.msg,
						{
							icon : 1,
							time : 1000
						}, 
						function()
						{
							location.href = "${pageContext.request.contextPath}/web/cart/cart.do?method=toCart";
						});
					}
					else if(data.code == 1001)
					{
						layer.msg(data.msg,
						{
							icon : 2,
							time : 1000
						}, 
						function()
						{
							location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toLogin";
						});
					}
				}
			});
		}

		
		//去购物车
		$("#isToCart").on('click', function()
		{
			var href = $(this).attr("href");
			$.ajax(
			{
				url : href,
				dataType : 'json',
				success : function(data)
				{
					//如果失败，让用户先去登录
					if (data.code == 1001)
					{
						layer.msg(data.msg,
						{
							icon : 2,
							time : 1000
						}, function()
						{
							location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toLogin";
						});
					}
					//如果成功,就真的去购物车页面
					else if(data.code == 1000)
					{
						location.href = "${pageContext.request.contextPath}/web/cart/cart.do?method=toCart";
					}
				}
			});
			return false;
		});
	</script>
</body>
</html>
