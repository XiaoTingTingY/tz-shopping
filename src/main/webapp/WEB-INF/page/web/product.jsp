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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/web/css/bootstrap.min.css"
	type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/web/css/style.css">


<!-- Custom Fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/web/font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/web/fonts/font-slider.css"
	type="text/css">

<!-- jQuery and Modernizr-->
<script
	src="${pageContext.request.contextPath}/static/web/js/jquery-2.1.1.js"></script>

<!-- Core JavaScript Files -->
<script
	src="${pageContext.request.contextPath}/static/web/js/bootstrap.min.js"></script>

<script
	src="${pageContext.request.contextPath}/static/web/js/photo-gallery.js"></script>

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
	<!--///////////////////Product Page///////////////////-->
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
							<li><a href="#" >${ requestScope.good.name }</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="product">
						<div class="col-md-6">
							<div class="image">
								<img src="${ requestScope.good.img }" />
								<div class="image-more">
									<!-- 商品的缩略图  -->
									<ul class="row">
										<c:forEach items="${ requestScope.pictures }" var="picture">
											<li class="col-lg-3 col-sm-3 col-xs-4"><a href="#"><img
													class="img-responsive" src="${ picture.url }"></a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="caption">
								<div class="name">
									<h3>${ requestScope.good.name }</h3>
								</div>
								<div class="info">
									<ul>
										<li>Brand: ${ requestScope.banner.name }</li>
										<li>ID: ${ requestScope.good.id }</li>
									</ul>
								</div>
								<div class="price">
									$${ requestScope.good.cost }<span>$${
										requestScope.good.price }</span>
								</div>
								<div class="options">
									AVAILABLE OPTIONS <select>
										<option value="" selected>----Please Select----</option>
										<option value="red">RED</option>
										<option value="black">BLACK</option>
									</select>
								</div>
								<div class="rating">
									<c:forEach begin="1" end="${ requestScope.good.recommend }">
										<span class="glyphicon glyphicon-star"></span>
									</c:forEach>
									<c:forEach begin="1" end="${ 5 - requestScope.good.recommend }">
										<span class="glyphicon glyphicon-star-empty"></span>
									</c:forEach>
								</div>
								<div class="well">
									<label>Qty: </label> <input class="form-inline quantity"
										type="text" id="number" value="1"> 
										<a href="${pageContext.request.contextPath}/web/cart/cart.do?method=addCart&id=${ requestScope.good.id }" class="btn btn-2 " stock="${ requestScope.good.stock }" id="add">ADD</a>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="product-desc">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#description">Description</a></li>
							<li><a href="#review">Review</a></li>
						</ul>
						<div class="tab-content">
							<!-- 商品详情内容 -->
							<div id="description" class="tab-pane fade in active">${ requestScope.good.details }
							</div>
							<div id="review" class="tab-pane fade">
								<div class="review-text">
									<p>Ut enim ad minim veniam, quis nostrud exercitation
										ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								</div>
								<div class="review-form">
									<h4>Write a review</h4>
									<form name="form1" id="ff" method="post" action="review.php">
										<label> <span>Enter your name:</span> <input
											type="text" name="name" id="name" required>
										</label> <label> <span>Your message here:</span> <textarea
												name="message" id="message"></textarea>
										</label>
										<div class="text-right">
											<input class="btn btn-default" type="reset" name="reset"
												value="Reset"> <input class="btn btn-default"
												type="submit" name="Submit" value="Submit">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="product-related">
						<div class="heading">
							<h2>RELATED PRODUCTS</h2>
						</div>
						<div class="products">
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="product">
									<div class="image">
										<a href="product.html"><img
											src="../../static/web/images/iphone.png" /></a>
									</div>
									<div class="buttons">
										<a class="btn cart" href="#"><span
											class="glyphicon glyphicon-shopping-cart"></span></a> <a
											class="btn wishlist" href="#"><span
											class="glyphicon glyphicon-heart"></span></a> <a
											class="btn compare" href="#"><span
											class="glyphicon glyphicon-transfer"></span></a>
									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="product.html">Aliquam erat volutpat</a>
											</h3>
										</div>
										<div class="price">
											$122<span>$98</span>
										</div>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star-empty"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="product">
									<div class="image">
										<a href="product.html"><img
											src="../../static/web/images/galaxy-s4.jpg" /></a>
									</div>
									<div class="buttons">
										<a class="btn cart" href="#"><span
											class="glyphicon glyphicon-shopping-cart"></span></a> <a
											class="btn wishlist" href="#"><span
											class="glyphicon glyphicon-heart"></span></a> <a
											class="btn compare" href="#"><span
											class="glyphicon glyphicon-transfer"></span></a>
									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="product.html">Aliquam erat volutpat</a>
											</h3>
										</div>
										<div class="price">
											$122<span>$98</span>
										</div>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star-empty"></span><span
												class="glyphicon glyphicon-star-empty"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="product">
									<div class="image">
										<a href="product.html"><img
											src="../../static/web/images/galaxy-note.jpg" /></a>
									</div>
									<div class="buttons">
										<a class="btn cart" href="#"><span
											class="glyphicon glyphicon-shopping-cart"></span></a> <a
											class="btn wishlist" href="#"><span
											class="glyphicon glyphicon-heart"></span></a> <a
											class="btn compare" href="#"><span
											class="glyphicon glyphicon-transfer"></span></a>
									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="product.html">Aliquam erat volutpat</a>
										</div>
										<div class="price">
											$122<span>$98</span>
										</div>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star-empty"></span><span
												class="glyphicon glyphicon-star-empty"></span><span
												class="glyphicon glyphicon-star-empty"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div id="sidebar" class="col-md-4">
					<div class="widget wid-categories">
						<div class="heading">
							<h4>CATEGORIES</h4>
						</div>
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
						<div class="heading">
							<h4>TYPE</h4>
						</div>
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
						<div class="heading">
							<h4>DISCOUNTS</h4>
						</div>
						<div class="content">
							<label class="checkbox"><input type="checkbox"
								name="discount" checked="">Upto - 10% (20)</label> <label
								class="checkbox"><input type="checkbox" name="discount">40%
								- 50% (5)</label> <label class="checkbox"><input type="checkbox"
								name="discount">30% - 20% (7)</label> <label class="checkbox"><input
								type="checkbox" name="discount">10% - 5% (2)</label> <label
								class="checkbox"><input type="checkbox" name="discount">Other(50)</label>
						</div>
					</div>
					<div class="widget wid-brand">
						<div class="heading">
							<h4>BRAND</h4>
						</div>
						<div class="content">
							<label class="checkbox"><input type="checkbox"
								name="brand">Nokia</label> <label class="checkbox"><input
								type="checkbox" name="brand">Samsung</label> <label
								class="checkbox"><input type="checkbox" name="brand">Iphone</label>
							<label class="checkbox"><input type="checkbox"
								name="brand">HTC</label> <label class="checkbox"><input
								type="checkbox" name="brand">Oppo</label> <label
								class="checkbox"><input type="checkbox" name="brand">Kings</label>
							<label class="checkbox"><input type="checkbox"
								name="brand">Zumba</label>
						</div>
					</div>
					<div class="widget wid-product">
						<div class="heading">
							<h4>LATEST</h4>
						</div>
						<div class="content">
							<div class="product">
								<a href="#"><img
									src="../../static/web/images/galaxy-note.jpg" /></a>
								<div class="wrapper">
									<h5>
										<a href="#">Samsung Galaxy Tab</a>
									</h5>
									<div class="price">$122</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star-empty"></span>
									</div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="../../static/web/images/galaxy-s4.jpg" /></a>
								<div class="wrapper">
									<h5>
										<a href="#">Samsung Galaxy Tab</a>
									</h5>
									<div class="price">$122</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star-empty"></span>
									</div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="../../static/web/images/Z1.png" /></a>
								<div class="wrapper">
									<h5>
										<a href="#">Samsung Galaxy Tab</a>
									</h5>
									<div class="price">$122</div>
									<div class="rating">
										<span class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star"></span><span
											class="glyphicon glyphicon-star-empty"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/page/web/body/footer.jsp"></jsp:include>
	<!-- IMG-thumb -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/admin/lib/layer/3.1.1/layer.js"></script>
	<script>
	
		$(document).ready(function()
		{
			//添加商品
			$("#add").click(function()
			{
				//把当前的元素存起来
				var nowTag = $(this);
				//获取当前元素的连接
				var href = nowTag.attr("href");
				console.log(nowTag);
				//拿到输入的数量
				var val = $(this).prev().val();
				//拿到该商品的库存
				var stock = $(this).attr("stock")
				if(val > stock)
				{
					layer.msg("数量超过了库存",
					{
						icon : 2,
						time : 1000
					},
					function()
					{
						//若输入的值无效则该为1
						$(nowTag).prev().val(1);
					});
				}
				else if(val <= 0)
				{
					layer.msg("数量不能为负数",
					{
						icon : 2,
						time : 1000
					},
					function()
					{
						$(nowTag).prev().val(1);
					});
				}
				else
				{
					$.ajax(
					{
						url : href,
						dataType : 'json',
						data :
						{
							size : val
						},
						success : function(data)
						{
							//如果成功，给出提示，刷新当前页面
							if (data.code == 1000)
							{
								layer.msg(data.msg,
								{
									icon : 1,
									time : 1000
								});
							}
							//如果失败
							else if (data.code == 1001)
							{
								layer.msg(data.msg,
								{
									icon : 2,
									time : 1000
								},
								function()
								{
									$(nowTag).prev().val(1);
								});
							}
						}
					});
				}
				return false;
			}); 
			
			
			//去购物车
			$("#isToCart").on('click',
			function()
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
										location.reload();
									});
								}
								//如果成功,就真的去购物车页面
								else if (data.code == 1000)
								{
									location.href = "${pageContext.request.contextPath}/web/cart/cart.do?method=toCart";
								}
							}
						});
				return false;
			});

			
			$(".nav-tabs a").click(function()
			{
				$(this).tab('show');
			});
			$('.nav-tabs a').on('shown.bs.tab', function(event)
			{
				var x = $(event.target).text(); // active tab
				var y = $(event.relatedTarget).text(); // previous tab
				$(".act span").text(x);
				$(".prev span").text(y);
			});
		});

		/* function add(){
			var num = $("#number").val();
			$("#number").val(parseInt(num)+1);
		} */

		
	</script>
</body>
</html>
