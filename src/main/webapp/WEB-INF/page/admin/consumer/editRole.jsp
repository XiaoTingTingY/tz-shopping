<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<title>添加</title>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
</head>
<body style="background-color: #fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form
					action="${pageContext.request.contextPath}/admin/consumer/editRole"
					method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.consumer != null }">
						<input type="hidden" name="id" value="${requestScope.consumer.id }">
					</c:if>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>用户姓名</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${requestScope.consumer.name}" placeholder="" id="name"
								name="name" readonly="readonly">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>角色</label>
						<div class="formControls col-xs-8 col-sm-9">
							<select name="rid">
								<option value="">请选择</option>
								<c:forEach items="${ requestScope.roles }" var="role">
									<option value="${ role.id }" ${ requestScope.consumer.rid == role.id ? 'selected' : '' }>${ role.rolename }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="row clearfix">
						<div class="col-9 col-offset-2">
							<input class="btn btn-primary radius" type="submit"
								value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
	</script>
</body>
</html>

