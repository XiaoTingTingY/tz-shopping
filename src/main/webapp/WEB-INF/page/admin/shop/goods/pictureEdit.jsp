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
				<form enctype="multipart/form-data"
					action="${pageContext.request.contextPath}${requestScope.record != null ?  '/admin/shop/picture.do?method=update' :'/admin/shop/picture.do?method=insert'  }"
					method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.record != null }">
						<input type="hidden" name="id" value="${requestScope.record.id }">
					</c:if>
						<input type="hidden" name="gid" value="${  requestScope.record != null ? requestScope.record.gid : requestScope.gid }">

					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>缩略图:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="btn-upload"> <a href="javascript:void();" class="btn btn-primary radius btn-upload"><i class="Hui-iconfont">&#xe642;</i> 缩略图</a> 
							<input accept=".jpg,.png" name="url" type="file" multiple  id="btn-upload-file-thumb" class="input-file">
								</span>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>下标:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${requestScope.record.indx }" placeholder="" id="indx"
								name="indx">
						</div>
					</div>
					

					
					<div class="row clearfix">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit"
								value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">

	
	
		$("#form").validate(
		{
			rules :
			{
				indx :
				{
					required : true
				}
			},
			onkeyup : false,
			focusCleanup : true,
			submitHandler : function(form)
			{
				$(form).ajaxSubmit(
				{
					type : form.method,
					url : form.action,
					success : function(data)
					{
						commonreuslt(data);
					}
				});
			}
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
