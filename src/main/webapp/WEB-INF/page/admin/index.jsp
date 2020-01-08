<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<%@ taglib uri="http://www.jkoss.com/ossjktaglib/menu" prefix="jk"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<title>管理后台 v1.2</title>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
</head>
<body>


<jk:menu>
[
<c:forEach items="${ sessionScope.menus }" var="menu">
	<c:if test="${ menu.level == 1 }">
	{
		"name": "${ menu.name }",
		"icon": "${ menu.icon }",
		"child": 
		[
			<c:forEach items="${ sessionScope.menus }" var="menu2">
				<c:if test="${ menu.id == menu2.pid && menu2.level == 2 }">
					{
						"name": "${ menu2.name }",
						"href": "${applicationScope.basePath}${ menu2.url }"
					},
				</c:if>
			</c:forEach>
		]
	}
	</c:if>
</c:forEach>
]
</jk:menu>


	<%-- <jk:menu>
		[{
			"name": "系统管理",
			"icon": "&#xe62e;",
			"child": 
			[
				{
					"name": "管理员",
					"href": "${pageContext.request.contextPath}/admin/consumer/list"
				},
				{
					"name": "权限管理",
					"href": "${pageContext.request.contextPath}/admin/permission/list"
				},
				{
					"name": "角色管理",
					"href": "${pageContext.request.contextPath}/admin/role/list"
				},
				{
					"name": "数据字典",
					"href": "${pageContext.request.contextPath}/admin/dictionary/list"
				}
			]
		},
		{
			"name": "商城管理",
			"icon": "&#xe66a;",
			"child": 
			[
				{
					"name": "用户管理",
					"href": "${pageContext.request.contextPath}/admin/user/list"
				},
				{
					"name": "商品管理",
					"href": "${pageContext.request.contextPath}/admin/goods/list"
				},
				{
					"name": "广告管理",
					"href": "${pageContext.request.contextPath}/admin/advert/list"
				},
				{
					"name": "导航管理",
					"href": "${pageContext.request.contextPath}/admin/menus/list"
				}
			]
		}]
		
	</jk:menu> --%>
	<div class="Hui-admin-aside-mask"></div>
	<div class="Hui-admin-dislpayArrow">
		<a href="javascript:void(0);" onClick="displaynavbar(this)"> <i class="Hui-iconfont Hui-iconfont-left">&#xe6d4;</i> <i class="Hui-iconfont Hui-iconfont-right">&#xe6d7;</i>
		</a>
	</div>
	<section class="Hui-admin-article-wrapper">
		<!--_header 作为公共模版分离出去-->
		<header class="Hui-navbar">
			<div class="navbar">
				<div class="container-fluid clearfix">
					<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar">
						<ul class="clearfix">
							<li>${ sessionScope.role.rolename }</li>
							<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${sessionScope.consumer.name } <i class="Hui-iconfont">&#xe6d5;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
									<!-- 	<li><a href="#">切换账户</a></li> -->
									<li><a href="#" onClick="logout()">退出</a></li>
								</ul></li>
							<!-- <li id="Hui-msg"><a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size: 18px">&#xe68a;</i></a></li> -->
							<li id="Hui-skin" class="dropDown dropDown_hover right"><a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li><a href="javascript:;" data-val="default" title="默认（蓝色）">默认（深蓝）</a></li>
									<li><a href="javascript:;" data-val="black" title="黑色">黑色</a></li>
									<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
									<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
									<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
									<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<div id="Hui-admin-tabNav" class="Hui-admin-tabNav">
			<div class="Hui-admin-tabNav-wp">
				<ul id="min_title_list" class="acrossTab clearfix" style="width: 241px; left: 0px;">
					<li class=""><span title="我的桌面" data-href="${ applicationScope.basepath }/toDesktop">我的桌面</span><em></em></li>
				</ul>
			</div>
			<div class="Hui-admin-tabNav-more btn-group" style="display: none;">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a> <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-admin-article">
			<div class="show_iframe">
				<iframe id="iframe-welcome" data-scrolltop="0" scrolling="yes" frameborder="0" src="${applicationScope.basepath }/toDesktop"></iframe>
			</div>
		</div>
	</section>
	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前</li>
			<li id="closeall">关闭全部</li>
		</ul>
	</div>
</body>
<script type="text/javascript" src="${ applicationScope.basepath }/static/admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
	$(function() {
		$("body").Huitab({
			tabBar : ".navbar-wrapper .navbar-levelone",
			tabCon : ".Hui-aside .menu_dropdown",
			className : "current",
			index : 0,
		});
	});
	/*登出*/
	function logout() {
		layer.confirm('确认要退出吗？', function(index) {
			location.href = "${ applicationScope.basepath }/logout";
		});
	}
	/*个人信息*/
	function myselfinfo() {
		layer_show("个人信息", "${ applicationScope.basepath }/admin/user/toUpdate&id=${sessionScope.consumer.id}", 800, 500);
	}
</script>

</html>
