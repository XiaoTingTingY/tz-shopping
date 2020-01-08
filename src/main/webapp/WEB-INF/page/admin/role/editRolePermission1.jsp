<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/inc/taglib.jsp"%>
<!-- 引用ztree 的css -->
<link rel="stylesheet" href="${applicationScope.basepath }/statics/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="pageContent">
	<form method="post" id="form" action="${applicationScope.basepath }/system/role/updateRolePermission" class="pageForm required-validate">
		<div class="pageFormContent" layoutH="56">
			<!-- 关闭窗口 -->
			<input type="hidden" name="callbackType" value="closeCurrent" />
			<!-- 隐藏表单 -->
			<!-- 授权到那个角色的id -->
			<input type="hidden" name="rid" value="${requestScope.record.id}" />
			<ul id="permissionTree" class="ztree"></ul>

		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript" src="${applicationScope.basepath }/statics/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${applicationScope.basepath }/statics/ztree/js/jquery.ztree.excheck.js"></script>
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
	$.fn.zTree.init($("#permissionTree", $.pdialog.getCurrent()), setting, zNodes);

	$("#form", $.pdialog.getCurrent()).submit(function()
	{
		//获取选中的节点
		var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
		var nodes = treeObj.getCheckedNodes(true);
		
		for(node of nodes)
		{
			$("#form", $.pdialog.getCurrent()).append("<input type='hidden' name='pids' value='"+node.id+"'/>");
		}
		return validateCallback(this, dialogAjaxDone);
	})
	
</script>
