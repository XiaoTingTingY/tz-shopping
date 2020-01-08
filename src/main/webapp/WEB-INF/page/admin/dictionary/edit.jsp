<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<form action="${pageContext.request.contextPath}${requestScope.record ==null ?'/admin/dictionary/insert' :'/admin/dictionary/update' }" method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.record != null }">
						<input type="hidden" name="id" value="${requestScope.record.id }">
					</c:if>
																																		<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>键</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input type="text" class="input-text" value="${requestScope.record.dkey}"" placeholder="" id="name" name="dkey">
							</div>
						</div>
												<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>值</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input type="text" class="input-text" value="${requestScope.record.dvalue}"" placeholder="" id="name" name="dvalue">
							</div>
						</div>
										<div class="row clearfix">
						<div class="col-9 col-offset-2">
						  <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
				  </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//日期控件
		laydate.render({
			elem : '#birth' //指定元素
		});

		$("#form").validate({
			rules : {
				name : {
					required : true,
					minlength : 2,
					maxlength : 50
				},
				pwd : {
					required : true,
					minlength : 6,
				},
				sex : {
					required : true,
				},
				birth : {
					required : true,
					dateISO : true
				},
				phone : {
					required : true,
					minlength : 11,
					maxlength : 11,
					digits : true
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
	</script>
</body>
</html>

