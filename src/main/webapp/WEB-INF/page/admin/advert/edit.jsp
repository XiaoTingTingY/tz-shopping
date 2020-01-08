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
				<form enctype="multipart/form-data" action="${pageContext.request.contextPath}${requestScope.adverts != null ? '/admin/system/advert.do?method=update' : '/admin/system/advert.do?method=insert'  }" method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.adverts != null }">
						<input type="hidden" name="id" value="${requestScope.adverts.id }">
					</c:if>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>广告名：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.adverts.name }" placeholder="" id="name" name="name">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>下标：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" autocomplete="off" value="${requestScope.adverts.indx }" placeholder="" id="indx" name="indx">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型：</label>
						<div class="formControls col-xs-8 col-sm-9 skin-minimal">
							<div class="formControls col-xs-8 col-sm-9">
								<select name="type" class="select">
									<option value="">请选择</option>
									<option value="1" ${ requestScope.adverts.type == 1 ? 'selected' : '' }>轮播图</option>
									<option value="2" ${ requestScope.adverts.type == 2 ? 'selected' : '' }>广告图</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>资源路径：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.adverts.url }" placeholder="" id="url" name="url">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3">备注：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${requestScope.adverts.remk }" placeholder="" id="remk" name="remk">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3">图片：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<span class="btn-upload"> <a href="javascript:void();" class="btn btn-primary radius btn-upload"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a> <input accept=".jpg,.png" name="img" type="file" multiple  id="btn-upload-file-thumb" class="input-file">
							</span>
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
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
