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
					action="${pageContext.request.contextPath}${requestScope.record != null ?  '/admin/shop/goods.do?method=update' :'/admin/shop/goods.do?method=insert'  }"
					method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.record != null }">
						<input type="hidden" name="id" value="${requestScope.record.id }">
					</c:if>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>导航:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<select class="select" name="nid" id="nid">
								<option value=''>请选择</option>
								<c:forEach items="${ requestScope.navbars }" var="navbar">
									<option value="${ navbar.id }" ${ navbar.id == requestScope.record.nid ? 'selected' : '' }>${ navbar.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>分类:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<select class="select" name="tid" id="tid">
								<option value=''>请选择</option>
								<c:forEach items="${ requestScope.brands }" var="brand">
									<option value="${ brand.id }" ${ brand.id == requestScope.record.tid ? 'selected' : '' }>${ brand.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>名称:</label>
						<div class="formControls col-xs-8 col-sm-9 skin-minimal">
							<input type="text" class="input-text"
								value="${requestScope.record.name }" placeholder="" id="name"
								name="name">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>原价:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${requestScope.record.cost }" placeholder="" id="cost"
								name="cost">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>折扣价:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${requestScope.record.price }" placeholder="" id="price"
								name="price">
						</div>
					</div>
					
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>库存:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${requestScope.record.stock }" placeholder=""
								name="stock" id="stock">
						</div>
					</div>

					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>推荐数</label>
						<div class="formControls col-xs-8 col-sm-9">
							<div class="clearfix">
								<div id="star-1" class="star-bar size-M f-l mr-10 va-m"></div>
								<strong id="result-1" class="f-l va-m"></strong>
								<!-- 因为在div中不能提交表单内容，所以加一个隐藏表单 -->
								<input type="hidden" name="recommend" value="${requestScope.record.recommend }" id="recommend">
							</div>
						</div>
					</div>
					
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>封面:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<div class="clearfix">
								<span class="btn-upload"> <a href="javascript:void();" class="btn btn-primary radius btn-upload"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a> <input accept=".jpg,.png" name="img" type="file" multiple  id="btn-upload-file-thumb" class="input-file">
								</span>
							</div>
						</div>
					</div>
					
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>详情:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<div id="divDemo">${ requestScope.record.details != null ? requestScope.record.details : '<p></p>' }</div>
							<input type="hidden" name="details" id="details" value="">
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
	<script type="text/javascript" src='${pageContext.request.contextPath}/static/admin/lib/wangEditor/wangEditor.js'></script>
	<script type="text/javascript">

		//富文本框
	   	var E = window.wangEditor;
	    var editor = new E('#divDemo');
	    editor.customConfig.uploadImgShowBase64 = true;
	    editor.create();
	
		//根据导航查询子类型
		$("#nid").change(function()
		{
			if($(this).val())
			{
				$.ajax(
				{
					url:"${pageContext.request.contextPath}/admin/shop/goods.do",
					data:
					{
						method:"getBanners",
						id:$(this).val()
					},
					dataType:"json",
					type:"post",
					success:function(result)
					{
						//如果成功响应
						if(result.code == 1000)
						{
							$("#tid").empty();
							var str = "<option value=''>请选择</option>";
							//for循环
							$(result.content).each(function(ind,v)
							{
								str += "<option value='" + v.id + "'>" + v.name + "</option>";
							});

							$("#tid").append(str);
						}
						else
						{
							layer.msg(result.msg, 
							{
								icon : 2,
								time : 1000
							});
						}
					}
				});
			}
		});
	
	
		$("#star-1").raty({
			hints: ['1','2', '3', '4', '5'],//自定义分数
			starOff: 'iconpic-star-S-default.png',//默认灰色星星
			starOn: 'iconpic-star-S.png',//黄色星星
			path: '${pageContext.request.contextPath}/static/admin/h-ui/images/star',//可以是相对路径
			number: 5,//星星数量，要和hints数组对应
			showHalf: true,
			targetKeep : true,
			score:"${ requestScope.record.recommend }",
			click: function (score, evt) {//点击事件
				console.log(evt);
				//第一种方式：直接取值
				$("#result-1").html(score+'分');
				/* 给评分的隐藏表单赋值 */
				$("#recommend").val(score);
			}
		});
	
		$("#form").validate(
		{
			rules :
			{
				name :
				{
					required : true,
					minlength : 2,
					maxlength : 50
				},
				pwd :
				{
					required : true,
					minlength : 6,
				},
				sex :
				{
					required : true,
				},
				birth :
				{
					required : true,
					dateISO : true
				},
				phone :
				{
					required : true,
					minlength : 11,
					maxlength : 11,
					digits : true
				},
				email :
				{
					required : true,
					email : true,
				}
			},
			onkeyup : false,
			focusCleanup : true,
			submitHandler : function(form)
			{
				//获取富文本框的内容
				$("#details").val(editor.txt.html());
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
