package com.jkoss.shopping.system.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.common.vo.ZtreeBean;
import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.service.IPermissionService;

/**
 * <p>
 * 权限表 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
@Controller
@RequestMapping("/admin/permission")
public class PermissionController extends BaseController
{

	@Autowired
	private IPermissionService iPermissionService;

	@RequestMapping("/list")
	public String list(ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		// 查询导航栏内容,以树形的形式在前端展示
		QueryWrapper<Permission> query = new QueryWrapper<>();
		query.orderByAsc("level", "sort");
		List<Permission> Permissions = iPermissionService.list(query);

		List<ZtreeBean> zTreePermissions = new ArrayList<>();

		// 将navbar对象转换成zTree对象
		if (!CommonUtil.isBlank(Permissions))
		{
			for (Permission permission : Permissions)
			{
				ZtreeBean ztree = new ZtreeBean();
				ztree.setId(permission.getId());
				ztree.setPId(permission.getPid());
				//如果没有pid那么它就是父级节点
				ztree.setIsParent(CommonUtil.isBlank(permission.getPid()));
				//默认都打开
				ztree.setOpen(true);
				ztree.setName(permission.getName());
				zTreePermissions.add(ztree);
			}
			map.put("zTree", JSON.toJSONString(zTreePermissions));
		}
		else
		{
			map.put("zTree", "[]");
		}
		return "admin/permission/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(String pid, HttpServletRequest request, HttpServletResponse response, ModelMap map)
	{
		//如果添加的是子节点
		if(!CommonUtil.isBlank(pid))
		{
			map.put("ppermission", iPermissionService.getById(pid));
		}
		return "admin/permission/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Permission permission, HttpServletRequest request, HttpServletResponse response)
	{
		//如果是添加父节点 level默认为1
		if (CommonUtil.isBlank(permission.getLevel()))
		{
			permission.setLevel(new BigDecimal(1));
		}
		if (iPermissionService.save(permission))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}

	}

	@RequestMapping("/toUpdate")
	public String toUpdate(String id, ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		Permission permission = iPermissionService.getById(id);
		//如果他有父节点
		if(!CommonUtil.isBlank(iPermissionService.getById(permission.getPid())))
		{
			map.put("ppermission", iPermissionService.getById(permission.getPid()));
		}
		map.put("record", permission);
		return "admin/permission/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(Permission permission, HttpServletRequest request, HttpServletResponse response)
	{
		if (iPermissionService.updateById(permission))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String id, HttpServletRequest request, HttpServletResponse response)
	{
		if (iPermissionService.removeAllById(id))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

}
