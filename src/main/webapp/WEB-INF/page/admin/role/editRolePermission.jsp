<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
<title>权限</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<body>
	<div class="wap-container">
		<article class="Hui-admin-content clearfix">
			<div class="panel-body">
				<form
					action="${pageContext.request.contextPath}/admin/role/editRolePermission"
					method="post" class="form form-horizontal" id="form">
					<!-- 隐藏表单 -->
					<c:if test="${requestScope.role != null }">
						<input type="hidden" name="id" value="${requestScope.role.id }">
					</c:if>

					<table class="table">
						<tr>
							<td><ul id="permissionTree" class="ztree"></ul></td>
						</tr>
					</table>

					<div class="row clearfix">
						<div class="col-9 col-offset-2">
							<input class="btn btn-primary radius" type="submit"
								value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
					</div>
				</form>
				<br>

			</div>
		</article>
	</div>

	<!--请在下方写此页面业务相关的脚本-->

	<script type="text/javascript"
		src="${applicationScope.basepath }/static/admin/lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript"
		src="${applicationScope.basepath }/static/admin/lib/zTree/v3/js/jquery.ztree.excheck-3.5.min.js"></script>
	<script type="text/javascript">
	var setting = {
		check : {
			enable : true,
			chkboxType : {
				"Y" : "ps",
				"N" : "s"
			}
		},
		data : {
			simpleData : {
				enable : true
			}
		}
	};

	var zNodes = ${requestScope.rolePermissions};

	//ztree初始化  ztree 设置参数   ztree 内容
	$.fn.zTree.init($("#permissionTree"), setting, zNodes);

	$("#form").submit(function()
	{
		//获取选中的节点
		var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
		var nodes = treeObj.getCheckedNodes(true);
		
		for(node of nodes)
		{
			$("#form").append("<input type='hidden' name='pids' value='"+node.id+"'/>");
		}
		
		
		var url = $(this).attr("action");
  		var method = $(this).attr("method");
  		$.ajax(
  		{
  			url:url,
  			type:method,
  			dataType:"json",
  			data:$("#form").serialize(),
  			success:function(date)
  			{
  				if(date.statusCode == 200)
  				{
  					layer.msg(date.message, 
					{
						icon : 1,
						time : 1000
					},
					function()
					{
						
					});
  				}
  				else
  				{
  					layer.msg(date.message, 
					{
						icon : 2,
						time : 1000
					});
  				}
  			}
  		});
  		return false;
	});
	
</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
