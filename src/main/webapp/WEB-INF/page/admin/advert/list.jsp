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
			<%-- <div class="panel">
				<form class="search-form" action="${pageContext.request.contextPath}/admin/system/advert.do">
					<div class="panel-body">
						<div class="row clearfix">
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix mb-10">
									<span class="col-xs-4 form-item-label">广告名：</span> 
									<span class="col-xs-8 form-item-control"> 
										<input type="text" name="name" value="${requestScope.adverts.name }" placeholder="" class="input-text" />
									</span>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="row clearfix mb-10">
									<span class="col-xs-4 form-item-label">：</span> 
									<span class="col-xs-8 form-item-control"> 
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
			</div> --%>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix">
						<span class="f-l"> <a href="javascript:;" onclick="batchdel('${pageContext.request.contextPath}/admin/system/advert.do?method=batchDelete')" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="insert('添加','${pageContext.request.contextPath}/admin/system/advert.do?method=toInsert','800','500')" class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i> 添加
						</a>
						</span> <span class="r"> <a class="btn btn-success radius f-r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont"></i></a>
						</span>
					</div>
					<div class="mt-20 clearfix">
						<table id="data-table-list" class="table table-border table-bordered table-bg table-hover table-sort">
							<thead>
								<tr class="text-c">
									<th>广告名</th>
									<th>下标</th>
									<th>类型</th>
									<th>资源路径</th>
									<th>备注</th>
									<th>图片</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody class="getData-list" data-currPage='1'>
								<c:forEach items="${requestScope.adverts }" var="record">
									<tr class="text-c">
										<td>${record.name }</td>
										<td>${ record.indx }</td>
										<!-- 1，代表轮播图  2，代表广告 -->
										<td>${record.type == 1 ? '轮播图' : record.type == 2 ? '广告' : '其他' }</td>
										<td>${record.url }</td>
										<td>${record.remk }</td>
										<td><img alt="" class="picture-thumb" width="100" src="${record.img }"></td>
										
										<td class="f-14 td-manage"><a title="编辑" href="javascript:;" onclick="update('编辑','${pageContext.request.contextPath}/admin/system/advert.do?method=toUpdate&id=${record.id }','1','800','500')" class="ml-5" style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="del(this,'${pageContext.request.contextPath}/admin/system/advert.do?method=delete&id=${record.id}')" class="ml-5" style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
	<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
	
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