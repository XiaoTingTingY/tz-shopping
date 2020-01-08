<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
<title>产品分类</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<body>
	<div class="wap-container">
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<form class="search-form"
					action="${pageContext.request.contextPath}/admin/user/list">
					<div class="panel-body">
						<div class="row clearfix">
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix mb-10">
									<span class="col-xs-4 form-item-label">姓名：</span> <span
										class="col-xs-8 form-item-control"> <input type="text"
										name="name" value="" placeholder="" class="input-text" />
									</span>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix mb-10">
									<span class="col-xs-4 form-item-label">性別：</span> <span
										class="col-xs-8 form-item-control"> <input type="text"
										name="sex"
										value="<c:if test='${requestScope.page.prams.sex ==1}'>男</c:if><c:if test='${requestScope.page.prams.sex ==2}'>女</c:if>"
										placeholder="" class="input-text" />
									</span>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix">
									<span class="col-xs-4 form-item-control">
										<button name="" id="search-submit"
											class="btn btn-success radius" type="submit">
											<i class="Hui-iconfont">&#xe665;</i> 搜索
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-body">
				<div class="clearfix">
					<span class="f-l"> <a href="javascript:;" id="delete"
						class="btn btn-danger radius"> <i class="Hui-iconfont">&#xe6e2;</i>
							删除
					</a>
					 <a href="javascript:;" id="toInsert"
						class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i>
							添加
					</a>
					 <a href="javascript:;" id="toUpdate"
						class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i>
							编辑
					</a>
					</span> <span class="r"> <a class="btn btn-success radius f-r"
						style="line-height: 1.6em; margin-top: 3px"
						href="javascript:location.replace(location.href);" title="刷新">
							<i class="Hui-iconfont"></i>
					</a>
					</span>
				</div>
				<br>
				<table class="table">
					<tr>
						<td width="200" class="va-t"><ul id="permission" class="ztree"></ul></td>
						<td class="va-t"><iframe ID="testIframe" Name="testIframe"
								FRAMEBORDER=0 SCROLLING=AUTO width=100% height=390px SRC=""></iframe></td>
					</tr>
				</table>
			</div>
		</article>
	</div>

	<!--请在下方写此页面业务相关的脚本-->

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript">
	
	
	$("#toInsert").on('click', function()
	{
		//限制最多三级
		if(level >= 2)
		{
			layer.msg("最多三级", 
			{
				icon : 2,
				time : 1000
			});
			$("#testIframe").attr("src", "");
			return false;
		}
		//如果有点击节点来添加是添加子节点
		if(pid)
		{
			$("#testIframe").attr("src","${applicationScope.basepath}/admin/permission/toInsert?pid="+pid);
		}
		//如果没有则是直接添加一个节点
		else
		{
			$("#testIframe").attr("src","${applicationScope.basepath}/admin/permission/toInsert");
		}
		return false;
	});
	
	
	
	
	//去更新
	$("#toUpdate").on('click', function()
	{
		
		if(pid)
		{
			$("#testIframe").attr("src",'${applicationScope.basepath}/admin/permission/toUpdate?id=' + pid);
		}
		else
		{
			layer.msg("选择一条记录修改", 
			{
				icon : 2,
				time : 1000
			});
		}
		return false;
	});
	
	
	//去删除
	$("#delete").on('click', function()
	{
		var url = '${applicationScope.basepath}/admin/permission/delete';
		if(pid)
		{
			layer.confirm('确认要删除吗?', function() 
			{
				$.ajax(
				{
					url:url,
					data:
					{
						id:pid
					},
					dataType:"json",
					type:"post",
					success:function(data)
					{
						commonreuslt(data);
					}
				});
			});
		}
		//如果没有则是直接添加一个节点
		else
		{
			layer.msg("选择一条记录删除", 
			{
				icon : 2,
				time : 1000
			});
		}
		return false;
	});
	
		
		//获取当前节点的等级
		var level = null;
		//获取当前的pid
		var pid = null;
	
		var setting = {
			view: {
				dblClickExpand: false,
				showLine: false,
				selectedMulti: false
			},
			data: {
				simpleData: {
					enable:true
				}
			},
			callback: {
				onClick: function(event, treeId, treeNode, clickFlag) 
				{
					//获取当前节点的id 和 level
					pid = treeNode.id;
					level = treeNode.level
					console.log(pid)
					console.log(level)
				}
			}
		};
		var zNodes = ${ requestScope.zTree };
		
		$(document).ready(function(){
			var t = $("#permission");
			t = $.fn.zTree.init(t, setting, zNodes);
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
