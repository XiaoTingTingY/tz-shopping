<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="header" id="home">
		<div class="container">
			<ul>
				<li><a href="#" data-toggle="modal" data-target="#myModal"><i
						class=" ${ sessionScope.user == null ? 'fa fa-unlock-alt' : 'fa fa-user fa-fw' }" aria-hidden="true">
						</i> ${ sessionScope.user == null ? 'Sign In' : sessionScope.user.name }</a></li>
						
				<li><a href="#" data-toggle="modal" data-target="#myModal2"><i
						class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up </a></li>
						
				<li><i class="fa fa-phone" aria-hidden="true"></i> Call :
					${ applicationScope.dictionarys.call }</li>
					
					
				<li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a
					href="mailto:${ applicationScope.dictionarys.email }">${ applicationScope.dictionarys.email }</a></li>
			</ul>
		</div>
	</div>
	<!-- //header -->
	<!-- header-bot -->
	<div class="header-bot">
		<div class="header-bot_inner_wthreeinfo_header_mid">
			<div class="col-md-4 header-middle">
				<form action="#" method="post">
					<input type="search" name="search" placeholder="Search here..."
						required=""> <input type="submit" value=" ">
					<div class="clearfix"></div>
				</form>
			</div>
			<!-- header-bot -->
			<div class="col-md-4 logo_agile">
				<h1>
					<a href="index.html"><span>E</span>lite Shoppy <i
						class="fa fa-shopping-bag top_logo_agile_bag" aria-hidden="true"></i></a>
				</h1>
			</div>
			<!-- header-bot -->
			<div class="col-md-4 agileits-social top_content">
				<ul class="social-nav model-3d-0 footer-social w3_agile_social">
					<li class="share">Share On :</li>
					<li><a href="#" class="facebook">
							<div class="front">
								<i class="fa fa-facebook" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-facebook" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" class="twitter">
							<div class="front">
								<i class="fa fa-twitter" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-twitter" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" class="instagram">
							<div class="front">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" class="pinterest">
							<div class="front">
								<i class="fa fa-linkedin" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-linkedin" aria-hidden="true"></i>
							</div>
					</a></li>
				</ul>



			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse menu--shylock"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav menu__list">
								<li class="active menu__item menu__item--current"><a
									class="menu__link" href="index.html">主页<span
										class="sr-only">(current)</span></a></li>
										
										<c:forEach items="${ requestScope.menus }" var="menu">
											<c:if test="${ menu.pid == null }">
												<li class="dropdown menu__item"><a href="#"
													class="dropdown-toggle menu__link" data-toggle="dropdown"
													role="button" aria-haspopup="true" aria-expanded="false"> ${ menu.name } <span class="caret"></span>
												</a>
													<ul class="dropdown-menu multi-column columns-3">
														<div class="agile_inner_drop_nav_info">
															<!-- <div class="col-sm-6 multi-gd-img1 multi-gd-text ">
																<a href="mens.html"><img src="images/top2.jpg" alt=" " /></a>
															</div> -->
															<div class="col-sm-3 multi-gd-img">
																<ul class="multi-column-dropdown">
																	<c:forEach items="${ requestScope.menus }" var="menu2">
																		<c:if test="${ menu.id == menu2.pid && menu2.level == 2 }">
																			<li><a href="mens.html">${ menu2.name }</a></li>
																		</c:if>
																	</c:forEach>
																	
																	<c:forEach begin="0" end="${ (requestScope.menus.size() - 1) / 7 }" varStatus="i">
																		${ i.index }
																	</c:forEach>
																</ul>
															</div>
															<!-- <div class="col-sm-3 multi-gd-img">
																<ul class="multi-column-dropdown">
																	<li><a href="mens.html">Jewellery</a></li>
																	<li><a href="mens.html">Sunglasses</a></li>
																	<li><a href="mens.html">Perfumes</a></li>
																	<li><a href="mens.html">Beauty</a></li>
																	<li><a href="mens.html">Shirts</a></li>
																	<li><a href="mens.html">Sunglasses</a></li>
																	<li><a href="mens.html">Swimwear</a></li>
																</ul>
															</div> -->
															<div class="clearfix"></div>
														</div>
													</ul></li>
												</c:if>
										</c:forEach>
										
								<li class="dropdown menu__item"><a href="#"
									class="dropdown-toggle menu__link" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"> 男装 <span class="caret"></span>
								</a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="agile_inner_drop_nav_info">
											<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
												<a href="mens.html"><img src="images/top2.jpg" alt=" " /></a>
											</div>
											<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="mens.html">Clothing</a></li>
													<li><a href="mens.html">Wallets</a></li>
													<li><a href="mens.html">Footwear</a></li>
													<li><a href="mens.html">Watches</a></li>
													<li><a href="mens.html">Accessories</a></li>
													<li><a href="mens.html">Bags</a></li>
													<li><a href="mens.html">Caps & Hats</a></li>
												</ul>
											</div>
											<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="mens.html">Jewellery</a></li>
													<li><a href="mens.html">Sunglasses</a></li>
													<li><a href="mens.html">Perfumes</a></li>
													<li><a href="mens.html">Beauty</a></li>
													<li><a href="mens.html">Shirts</a></li>
													<li><a href="mens.html">Sunglasses</a></li>
													<li><a href="mens.html">Swimwear</a></li>
												</ul>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul></li>
									
									
								<li class="dropdown menu__item"><a href="#"
									class="dropdown-toggle menu__link" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"> 女装 <span class="caret"></span>
								</a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="agile_inner_drop_nav_info">
											<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="womens.html">Clothing</a></li>
													<li><a href="womens.html">Wallets</a></li>
													<li><a href="womens.html">Footwear</a></li>
													<li><a href="womens.html">Watches</a></li>
													<li><a href="womens.html">Accessories</a></li>
													<li><a href="womens.html">Bags</a></li>
													<li><a href="womens.html">Caps & Hats</a></li>
												</ul>
											</div>
											<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="womens.html">Jewellery</a></li>
													<li><a href="womens.html">Sunglasses</a></li>
													<li><a href="womens.html">Perfumes</a></li>
													<li><a href="womens.html">Beauty</a></li>
													<li><a href="womens.html">Shirts</a></li>
													<li><a href="womens.html">Sunglasses</a></li>
													<li><a href="womens.html">Swimwear</a></li>
												</ul>
											</div>
											<div class="col-sm-6 multi-gd-img multi-gd-text ">
												<a href="womens.html"><img src="images/top1.jpg" alt=" " /></a>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul></li>
									
									<li class=" menu__item"><a class="menu__link"
									href="about.html">关于我们</a></li>
								<li class=" menu__item"><a class="menu__link"
									href="contact.html">Contact</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<div class="wthreecartaits wthreecartaits2 cart cart box_1">
					<form action="#" method="post" class="last">
						<input type="hidden" name="cmd" value="_cart"> <input
							type="hidden" name="display" value="1">
						<button class="w3view-cart" type="submit" name="submit" value="">
							<i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
						</button>
					</form>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //banner-top -->


	
	<script type="text/javascript">
	
		function toCategory_navbar(navbar_id, pageNum)
		{
			if(pageNum)
			{
				location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toCategory_navbar&id=" + navbar_id + "&pageNum=" + pageNum;
				
			}
			else
			{
				location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toCategory_navbar&id=" + navbar_id;
			}
		}
		
		//根据品牌来搜索商品， 第一个参数是品牌的id， 第二个参数是该品牌的pid
		function toCategory_banner(banner_id, navbar_id, pageNum)
		{
			if(pageNum)
			{
				location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toCategory_banner&id=" + banner_id + "&pid=" + navbar_id + "&pageNum=" + pageNum;	
			}
			else
			{
				location.href = "${pageContext.request.contextPath}/web/system/index.do?method=toCategory_banner&id=" + banner_id + "&pid=" + navbar_id;

			}
		}
		
		
		$("#loginOut").on('click',function()
		{
			var url = $(this).attr("href");
			$.ajax(
			{
				url:url,
				type:"post",
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
							location.href = "${pageContext.request.contextPath}";
						});
					}
					else
					{
						layer.msg(result.msg,
						{
							icon : 2,
							time : 1000
						}, function()
						{
							location.reload();
						});
					}
				}
			});
			return false;
		}) 
</script>