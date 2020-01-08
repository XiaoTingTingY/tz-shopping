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
	<!--Header-->
	
	
		<!-- 通用头部内容  -->
	<jsp:include page="/WEB-INF/page/web/body/head.jsp"></jsp:include>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Category Page//////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}">Home</a></li>
						<li><a href="#" onclick="toCategory_navbar('${ requestScope.navbar.id }')">${ requestScope.navbar.name }</a></li>
						<c:if test="${ requestScope.banner != null }">
							<li><a href="#" onclick="toCategory_banner('${ requestScope.banner.id }', '${ requestScope.navbar.id }')">${ requestScope.banner.name }</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			
			<div class="row">
				<div id="main-content" class="col-md-8">
						<!-- 第一行的内容  -->
						<div class="row">
							<div class="col-md-12">
								<div class="products">
								<c:forEach items="${ requestScope.page.records }" var="record" varStatus="vs">
									<div class="col-lg-4 col-md-4 col-xs-12">
										<div class="product">
											<div class="image"><a href="${pageContext.request.contextPath}/web/system/index.do?method=toProduct&id=${ record.id }"><img src="${ record.img }" /></a></div>
											<div class="buttons">
												<a class="btn cart" href="javascript:;"
													onclick="addCart('${pageContext.request.contextPath}/web/cart/cart.do?method=addCart','${ record.id }')">
												<span class="glyphicon glyphicon-shopping-cart"></span>
												</a>
												<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
												<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
											</div>
											<div class="caption">
												<div class="name"><h3><a href="${pageContext.request.contextPath}/web/system/index.do?method=toProduct&id=${ record.id }">${ record.name }</a></h3></div>
												<div class="price">$${ record.cost }<span>$${ record.price }</span></div>
												<div class="rating">
													<c:forEach begin="1" end="${ record.recommend }">
														<span class="glyphicon glyphicon-star"></span>
													</c:forEach>
													<c:forEach begin="1" end="${ 5 - record.recommend }">
														<span class="glyphicon glyphicon-star-empty"></span>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
			
			
			
			
					
					<!-- 页码 -->
					<div class="row text-center">
						<ul class="pagination">
						<c:if test="${ requestScope.banner != null && requestScope.navbar != null }">
							<c:forEach begin="1" end="${ requestScope.page.pages }" varStatus="vs">
								  <li ${ vs.index == requestScope.page.pageNum ? 'class="active"' : ''}>
								  		<a href="#" onclick="toCategory_banner('${ requestScope.banner.id }', '${ requestScope.navbar.id }', '${ vs.index }')">${ vs.index }</a>
								  </li>
						  </c:forEach>
						</c:if>
						
						
						<c:if test="${ requestScope.banner == null }">
							<c:forEach begin="1" end="${ requestScope.page.pages }" varStatus="vs">
							  <li ${ vs.index == requestScope.page.pageNum ? 'class="active"' : ''}>
							 		<a href="#" onclick="toCategory_navbar('${ requestScope.navbar.id }', '${ vs.index }')">${ vs.index }</a>
							  </li>
						  </c:forEach>
						</c:if>
						
						  
						</ul>
					</div>
				</div>
				
				<!-- 页面右边的选择菜单  -->
				<div id="sidebar" class="col-md-4">
					<div class="widget wid-categories">
						<div class="heading"><h4>CATEGORIES</h4></div>
						<div class="content">
							<ul>
								<li><a href="#">PC Computers</a></li>
								<li><a href="#">Laptops & Notebooks</a></li>
								<li><a href="#">Mobiles & Tablet</a></li>
								<li><a href="#">Software</a></li>
							</ul>
						</div>
					</div>
					<div class="widget wid-type">
						<div class="heading"><h4>TYPE</h4></div>
						<div class="content">
							<select>
								<option value="EL" selected>Electronics</option>
								<option value="MT">Mice and Trackballs</option>
								<option value="WC">Web Cameras</option>
								<option value="TA">Tablates</option>
								<option value="AP">Audio Parts</option>
							</select>
						</div>
					</div>
					<div class="widget wid-discouts">
						<div class="heading"><h4>DISCOUNTS</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="discount" checked="">Upto - 10% (20)</label>
							<label class="checkbox"><input type="checkbox" name="discount">40% - 50% (5)</label>
							<label class="checkbox"><input type="checkbox" name="discount">30% - 20% (7)</label>
							<label class="checkbox"><input type="checkbox" name="discount">10% - 5% (2)</label>
							<label class="checkbox"><input type="checkbox" name="discount">Other(50)</label>
						</div>
					</div>
					<div class="widget wid-brand">
						<div class="heading"><h4>BRAND</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="brand">Nokia</label>
							<label class="checkbox"><input type="checkbox" name="brand">Samsung</label>
							<label class="checkbox"><input type="checkbox" name="brand">Iphone</label>
							<label class="checkbox"><input type="checkbox" name="brand">HTC</label>
							<label class="checkbox"><input type="checkbox" name="brand">Oppo</label>
							<label class="checkbox"><input type="checkbox" name="brand">Kings</label>
							<label class="checkbox"><input type="checkbox" name="brand">Zumba</label>	
						</div>
					</div>
					<div class="widget wid-product">
						<div class="heading"><h4>LATEST</h4></div>
						<div class="content">
							<div class="product">
								<a href="#"><img src="images/galaxy-note.jpg" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="images/galaxy-s4.jpg" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="images/Z1.png" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
<jsp:include page="/WEB-INF/page/web/body/footer.jsp"></jsp:include>

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
			debugger;
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
