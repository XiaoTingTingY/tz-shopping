<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!DOCTYPE HTML>
<html>

<head>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
<title>用户管理</title>
</head>
<body>
	<div class="wap-container">
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<form class="search-form" action="${pageContext.request.contextPath}/admin/shop/banner.do">
					<div class="panel-body">
						<div class="row clearfix">
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix mb-10">
									<span class="col-xs-4 form-item-label">导航名</span> 
									<span class="col-xs-8 form-item-control"> 
										<select name="pid" class="select">
											<option value="">请选择</option>
											<c:forEach items="${ requestScope.page }" var="nav">
												<option value="${ nav.id }">${ nav.name }</option>
											</c:forEach>
										</select>
									</span>
								</div>
							</div>
							<input type="hidden" name="method" value="list">
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix">
									<span class="col-xs-4 form-item-control">
										<button name="" id="search-submit" class="btn btn-success radius" type="submit">
											<i class="Hui-iconfont">&#xe665;</i> 搜索
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix">
						<span class="f-l"> <a href="javascript:;" onclick="batchdel('${pageContext.request.contextPath}/admin/shop/banner.do?method=batchDelete')" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="insert('添加','${pageContext.request.contextPath}/admin/shop/banner.do?method=toInsert','800','500')" class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i> 添加
						</a>
						</span> <span class="r"> <a class="btn btn-success radius f-r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont"></i></a>
						</span>
					</div>
					<div class="mt-20 clearfix">
						<table id="data-table-list" class="table table-border table-bordered table-bg table-hover table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="" value=""></th>
									<th>导航名</th>
									<th>分类名</th>
									<th>下标</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody class="getData-list" data-currPage='1'>
								<c:forEach items="${requestScope.navbars.records }" var="record">
									<tr class="text-c">
										<td><input type="checkbox" value="${record.id }" class="checkbox-box"></td>
										<td>${ record.nname }</td>
										<td>${ record.name }</td>
										<td>${ record.indx }</td>
										<td class="f-14 td-manage"><a title="编辑" href="javascript:;" onclick="update('编辑','${pageContext.request.contextPath}/admin/shop/banner.do?method=toUpdate&id=${record.id }','1','800','500')" class="ml-5" style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="del(this,'${pageContext.request.contextPath}/admin/shop/banner.do?method=delete&id=${record.id}')" class="ml-5" style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div id="jkpage" class="dataTables_wrapper"></div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/common/js/jkpage.js"></script>
	<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
	
		//渲染分页
		jkpage({
			element:"#jkpage",
			pages : ${requestScope.navbars.pages },  
			curr :  ${requestScope.navbars.pageNum },  
			total : ${requestScope.navbars.total } ,
			jump : function(curr) { //触发分页后的回调
				location.href = getFormUrl($(".search-form"))+"&pageNum="+curr;
			}
		}); 
		function insert(title, url, w, h) {
			//hui自己封装的方法
			//里面底层实现就是layer.open()
			layer_show(title, url, w, h);
		}
		function update(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		function del(obj, url) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : url,
					dataType : 'json',
					success : function(data) {
						commonreuslt(data);
					}
				});
			});
		}

		function batchdel(url) {
			if ($(".checkbox-box:checked")) {
				if ($(".checkbox-box:checked").length > 0) {
					var pars = '';
					$(".checkbox-box:checked").each(function(i, v) {
						pars += '&ids=' + $(v).val();
					});
					layer.confirm('确认要删除吗？', function(index) {
						$.ajax({
							type : 'POST',
							url : url,
							data : pars,
							success : function(data) {
								commonreuslt(data);
							}
						});
					});
				} else {
					layer.msg("请选择你要删除的内容", {
						icon : 5,
						time : 1000
					});
				}
			}
		}
	</script>
</body>
</html>