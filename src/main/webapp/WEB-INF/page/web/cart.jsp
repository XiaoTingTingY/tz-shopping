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
	<!--Navigation-->
	<!-- 通用头部内容页面  -->
	<jsp:include page="/WEB-INF/page/web/body/head.jsp"></jsp:include>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Cart Page//////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}">Home</a></li>
						<li><a href="cart.html">Cart</a></li>
					</ul>
				</div>
			</div>
			
			<c:forEach items="${ sessionScope.shops }" var="shop">
				<div class="row">
				<div class="product well">
					<div class="col-md-3">
						<div class="image">
							<img src="${ shop.img }" />
						</div>
					</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name"><h3><a href="product.html">
							${ shop.name }
							</a></h3></div>
							<div class="info">
								<ul>
									<c:forEach items="${ requestScope.banners }" var="banner">
										<c:if test="${ banner.id == shop.tid }">
											<li>Brand: ${ banner.name }</li>
										</c:if>
									</c:forEach>
									<li>ID: ${ shop.id }</li>
								</ul>
							</div>
							<div class="price"><font class="price2">$${ shop.price }</font><span class="cost">$${ shop.cost }</span></div>
							<label>Qty: </label> 
							<input class="form-inline quantity" type="text" value="${ shop.size }" >
							
							<!-- 把原来的数量存起来 oldValue 如果该数量的时候出现错误，则复原为原来的值 -->
							<a href="${pageContext.request.contextPath}/web/cart/cart.do?method=update&cid=${ shop.cid }&id=${ shop.id }" class="btn btn-2 update" oldValue="${ shop.size }">Update</a>
							<hr>
							<a href="${pageContext.request.contextPath}/web/cart/cart.do?method=delete&cid=${ shop.cid }" class="btn btn-default pull-right delete">REMOVE</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
			</c:forEach>
			
			
			
			
			<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<center><a href="${ pageContext.request.contextPath }" class="btn btn-1">继续购物</a></center>
				</div>
			</div>
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>价格明细</h6>
							<tr>
								<td>原总价</td>
								<td>${ requestScope.costTotal == null ? '0.00' : requestScope.costTotal }</td>
							</tr>
							<tr>
								<td>折扣价</td>
								<td>${ requestScope.pirceTotal == null ? '0.00' : requestScope.pirceTotal }</td>
							</tr>
							<tr>
								<td>运费:</td>
								<td>免运费</td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>现总价</h5></td>
								<td>${ requestScope.nowTotal == null ? '0.00' : requestScope.nowTotal }</td>
							</tr>
						</table>
						<center><a href="#" class="btn btn-1">结算</a></center>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<jsp:include page="/WEB-INF/page/web/body/footer.jsp"></jsp:include>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/static/admin/lib/layer/3.1.1/layer.js"></script>
	<script type="text/javascript">
		//删除购物车中的商品
		$(".delete").on('click', function()
		{
			var href = $(this).attr("href");
			layer.confirm('确认要删除吗?', function() 
			{
				$.ajax(
				{
					url : href,
					dataType : 'json',
					success : function(data)
					{
						//如果成功，给出提示，刷新当前页面
						if (data.code == 1000)
						{
							layer.msg(data.msg,
							{
								icon : 1,
								time : 1000
							},
							function()
							{
								location.reload();
							});
						}
						//如果失败
						else if(data.code == 1001)
						{
							layer.msg(data.msg,
							{
								icon : 2,
								time : 1000
							});
						}
					}
				});
			});
			return false;
		});
		
		
		
		
		
		//更新购物车商品的数量
		$(".update").on('click', function()
		{
			//获取当前的元素
			var nowTag = $(this);
			
			//把旧的数量存起来
			var oldValue = $(this).attr("oldValue");
			
			var href = $(this).attr("href");
			
			//获取该商品的数量
			var val = $(this).prev().val();
			console.log(val);
			$.ajax(
			{
				url : href,
				dataType : 'json',
				data:
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
						},
						function()
						{
							location.reload();
						});
					}
					//如果失败
					else if(data.code == 1001 || data.code == 1002)
					{
						layer.msg(data.msg,
						{
							icon : 2,
							time : 1000
						},
						function()
						{
							//把当前元素的上一个元素的value值该为旧值
							$(nowTag).prev().val(oldValue);
						});
					}
				}
			});
			return false;
		});
		
		
		//去购物车
		$("#isToCart").on('click', function()
		{
			return false;
		});
		
		
		
		//当商品数量发生了改变
		/* $(".checkbox-1").change(function()
		{
			//总价
			var count = 0;
			
			//折扣的总价
			var zkCount = 0;
			$.each($(this), function(ind,val)
			{
				console.log($(val).next().val());
			});
		}) */
		
		
		/*$.ajax(
		{
			url : href,
			dataType : 'json',
			success : function(data)
			{
				//如果成功，给出提示，刷新当前页面
				if (data.code == 1000)
				{
					layer.msg(data.msg,
					{
						icon : 1,
						time : 1000
					},
					function()
					{
						location.reload();
					});
				}
				//如果失败
				else if(data.code == 1001)
				{
					layer.msg(data.msg,
					{
						icon : 2,
						time : 1000
					});
				}
			}
		}); */
	</script>
</body>
</html>
