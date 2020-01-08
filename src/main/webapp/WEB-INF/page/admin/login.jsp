<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/h-ui.admin.pro.iframe/css/H-ui.login.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/lib/Hui-iconfont/1.0.9/iconfont.css" />
<title>管理后台 v1.2</title>
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form id="form" class="form form-horizontal" action="${applicationScope.basepath}/login" method="post">
				<div class="row clearfix">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="form-controls col-xs-8">
						<input id="" name="name" type="text" placeholder="账户" class="input-text size-L">
					</div>
				</div>
				<div class="row clearfix">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="form-controls col-xs-8">
						<input id="" name="pwd" type="password" placeholder="密码" class="input-text size-L">
					</div>
				</div>
				<div class="row clearfix">
					<div class="form-controls col-xs-8 col-xs-offset-3">
						<input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
				<div class="row clearfix">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online" style="color: red"> ${requestScope.msg }</label>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright OSSJK by h-ui.admin.pro.iframe v1.0</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/h-ui/js/H-ui.min.js"></script>
	<!-- 验证js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
	if (self != top) {
		window.top.location.replace(self.location); //打开自己网站的页面
	}
		$("#form").validate({
			rules : {
				name : {
					required : true,
				},
				pwd : {
					required : true,
				}
			}
		});
	</script>
<script type="text/javascript">getFollowStatus('df91d846-448f-4c9a-c764-08d6b94b3063')</script>
</body>

</html>
