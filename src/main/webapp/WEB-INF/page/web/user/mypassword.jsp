<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<title>找回密码</title>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
</head>
<body style="background-color: #fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form action="${pageContext.request.contextPath}/web/system/customer.do?method=changePassword" method="post" class="form form-horizontal" id="form">
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" placeholder="" id="name" name="name">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="email" class="input-text" autocomplete="off"  placeholder="请输入注册的邮箱号" id="email" name="email">
							<input type="button" class="btn btn-secondary-outline radius" value="发送验证码" onclick="identifying_code()">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>验证码:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" placeholder="" id="code" name="code">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="password" class="input-text" placeholder="" id="newPassword" name="newPassword">
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">

		$("#form").validate({
			rules : {
				name : {
					required : true,
					minlength : 2,
					maxlength : 50
				},
				newPassword : {
					required : true,
					minlength : 6,
				},
				code : {
					required : true
				},
				email : {
					required : true,
					email : true,
				}
			},
			onkeyup : false,
			focusCleanup : true,
			submitHandler : function(form) {
				$(form).ajaxSubmit({
					type : form.method,
					url : form.action,
					success : function(data) {
						commonreuslt(data);
					}
				});
			}
		});
		
		//发送验证请求
		function identifying_code()
		{
			//获取上一个元素的value值
			/* var email = $(this).prev().val(); */
			var email = $("#email").val();
			$.ajax(
			{
				url : "${pageContext.request.contextPath}/web/system/customer.do?method=getCode",
				dataType : 'json',
				type:"post",
				data:
				{
					email:email	
				},
				success : function(data)
				{
					//如果成功
					if(data.code == 1000)
					{
						layer.msg(data.msg,
						{
							icon : 1,
							time : 1000
						});
					}
					//如果失败
					else
					{
						layer.msg(data.msg,
						{
							icon : 2,
							time : 1000
						});
					}
				}
			})
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
