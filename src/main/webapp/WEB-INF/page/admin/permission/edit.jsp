<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/inc/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/inc/common.jsp"></jsp:include>
  <title>添加产品分类</title>
</head>
<body style="background-color:#fff">
  <div class="wap-container">
  	<div class="panel">
  		<div class="panel-body">
        <form action="${applicationScope.basepath }${requestScope.record == null ? '/admin/permission/insert' :'/admin/permission/update' }" method="post" class="form form-horizontal" id="form">
         
         <!-- 新增  -->
         <c:if test="${ requestScope.record == null }">
         	<!-- 添加的是子节点 -->
	         <c:if test="${ requestScope.ppermission != null }">
		          <div class="row clearfix">
		            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>父级名称：</label>
		            <div class="form-controls col-5">
		              <input type="text" class="input-text" value="${ requestScope.ppermission.name }" placeholder="" id="user-name" name="product-category-name" readonly>
		            </div>
		             <input type="hidden" name="pid" value="${ requestScope.ppermission.id }">
		             <input type="hidden" name="level" value="${ requestScope.ppermission.level + 1 }">
		            <div class="col-5"> </div>
		          </div>
	          </c:if>
          </c:if>
          
          <!-- 更新  -->
          <c:if test="${ requestScope.record != null }">
          		<input type="hidden" name="id" value="${ requestScope.record.id }">
          		<c:if test="${ requestScope.ppermission != null }">
		          <div class="row clearfix">
		            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>父级权限名</label>
		            <div class="form-controls col-5">
		              <input type="text" class="input-text" value="${ requestScope.ppermission.name }" placeholder="" id="user-name" name="product-category-name" readonly>
		            </div>
		            <div class="col-5"> </div>
		          </div>
	          </c:if>
          </c:if>
          
          
          <div class="row clearfix">
	            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>权限名</label>
	            <div class="form-controls col-5">
	              <input type="text" class="input-text" value="${ requestScope.record.name }" placeholder="" id="user-name" name="name">
	            </div>
	            <div class="col-5"> </div>
	      </div>
          
          <div class="row clearfix">
	            <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>资源路径</label>
	            <div class="form-controls col-5">
	              <input type="text" class="input-text" value="${ requestScope.record.url }" placeholder="" id="user-name" name="url">
	            </div>
	            <div class="col-5"> </div>
	      </div>
	      
	      <div class="row clearfix">
	            <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>备注</label>
	            <div class="form-controls col-5">
	              <input type="text" class="input-text" value="${ requestScope.record.remarks }" placeholder="" id="user-name" name="remarks">
	            </div>
	            <div class="col-5"> </div>
	      </div>
	      
	      
	      <div class="row clearfix">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图标</label>
            <div class="form-controls col-5">
              <input type="text" class="input-text" value="${ requestScope.record.icon }" placeholder="" id="icon" name="icon">
            </div>
            <div class="col-5"> </div>
          </div>
          
          <div class="row clearfix">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序</label>
            <div class="form-controls col-5">
              <input type="text" class="input-text" value="${ requestScope.record.sort }" placeholder="" id="sort" name="sort">
            </div>
            <div class="col-5"> </div>
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
  	$("#form").submit(function()
  	{
  		var url = $(this).attr("action");
  		var method = $(this).attr("method");
  		$.ajax(
  		{
  			url:url,
  			type:method,
  			dataType:"json",
  			data:$("form").serialize(),
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
  		})
  		return false;
  	});
  </script>
</body>
</html>
