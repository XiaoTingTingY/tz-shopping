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
	<script src="${pageContext.request.contextPath}/static/web/js/jquery-2.1.1.js"></script>
	
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
	<!--Top-->
		<!-- 通用头部内容  -->
	<jsp:include page="/WEB-INF/page/web/body/head.jsp"></jsp:include>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Account Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a href="account.html">Account</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 登录模块  -->
			<div class="row">
				<div class="col-md-6">
					<div class="heading"><h2>Login</h2></div>
					<form name="form1" id="ff1" method="post" action="${pageContext.request.contextPath}/web/system/index.do">
						<input type="hidden" name="method" value="login">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Username :" name="name" id="name" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Password :" name="password" id="password" required>
						</div>
						<button type="submit" class="btn btn-1" name="login" id="login">Login</button>
						<!-- 忘记密码 -->
						<a href="javascript:;" onclick="update('找回密码','${pageContext.request.contextPath}/web/system/customer.do?method=toPassword','1','800','500')">忘记密码</a>
					</form>
				</div>
				
				
				<div class="col-md-6">
					<div class="heading"><h2>New User ? Create An Account.</h2></div>
					<form name="form2" id="ff2" method="post" action="register.php">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="First Name :" name="firstname" id="firstname" required>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Last Name :" name="lastname" id="lastname" required>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="Email Address :" name="email" id="email" required>
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" placeholder="Mobile :" name="phone" id="phone" required>
						</div>
						<div class="form-group">
							<input name="gender" id="gender" type="radio"> Male <input name="gender" id="gender" type="radio"> Female 
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Password :" name="password" id="password" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Retype Password :" name="repassword" id="repassword" required>
						</div>
						<div class="form-group">
							<input name="agree" id="agree" type="checkbox" > I agree to your website.
						</div>
						<button type="submit" class="btn btn-1">Create</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 通用尾部内容 -->
	<jsp:include page="/WEB-INF/page/web/body/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/common/js/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/h-ui.admin.pro.iframe/js/h-ui.admin.pro.iframe.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/admin/lib/layer/3.1.1/layer.js"></script>
	<script type="text/javascript">
	
	
	
	$("#ff1").submit(function()
	{
		var url = $(this).attr("action");
		$.ajax(
		{
			url:url,
			type:"post",
			data:
			{
				method:"login",
				username:$("#name").val(),
				password:$("#password").val()
			},
			success:function(result)
			{
				if(result.code == 1000)
				{
					layer.msg(result.msg,
					{
						icon : 1,
						time : 1000
					}, function()
					{
						location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toIndex";
					});
				}
				else if(result.code == 1001)
				{
					layer.msg(result.msg,
					{
						icon : 2,
						time : 1000
					});
				}
			}
		});
		return false;
	}) 
	
	
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
	
	function update(title, url, id, w, h) {
		layer_show(title, url, w, h);
	}
	</script>
</body>
</html>