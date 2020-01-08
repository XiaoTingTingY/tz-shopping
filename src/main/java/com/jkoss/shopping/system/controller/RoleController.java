package com.jkoss.shopping.system.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.common.vo.DwzPageBean;
import com.jkoss.common.vo.ZtreeBean;
import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.entity.Role;
import com.jkoss.shopping.system.service.IPermissionService;
import com.jkoss.shopping.system.service.IRolePermissionService;
import com.jkoss.shopping.system.service.IRoleService;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController extends BaseController
{

	@Autowired
	private IRoleService iRoleService;

	@Autowired
	private IRolePermissionService iRolePermissionService;

	@Autowired
	private IPermissionService iPermissionService;

	@RequestMapping("/list")
	public String list(DwzPageBean dwzPageBean, ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		IPage resultPage = iRoleService.page(dwzPageBean.toPage());
		map.put("dwzPageBean", dwzPageBean.toDwzPageBean(resultPage));
		return "admin/role/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(HttpServletRequest request, HttpServletResponse response)
	{
		return "admin/role/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Role role, HttpServletRequest request, HttpServletResponse response)
	{
		if (iRoleService.save(role))
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
		map.put("record", iRoleService.getById(id));
		return "admin/role/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(Role role, HttpServletRequest request, HttpServletResponse response)
	{
		if (iRoleService.updateById(role))
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
	public Object delete(String[] id, HttpServletRequest request, HttpServletResponse response)
	{
		if (iRoleService.removeByIds(Arrays.asList(id)))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

	/**
	 * 去更新角色的权限
	 * 
	 * @param dwzPageBean
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toEditRolePermission")
	public String toEditRolePermission(String id, ModelMap map, HttpServletRequest request,
			HttpServletResponse response)
	{

		// 查询所有权限
		QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
		queryWrapper.orderByAsc("level", "sort");
		List<Permission> permissions = iPermissionService.list(queryWrapper);

		// 查询是哪个角色进行操作
		Role role = iRoleService.getById(id);
		map.put("role", role);

		// 查询该角色已经选中了哪些权限
		List<String> pids = iRolePermissionService.listPidByRolePermission(role.getId());

		if (!CommonUtil.isBlank(permissions))
		{
			List<ZtreeBean> ztreeBeans = new ArrayList<>();
			for (Permission permission : permissions)
			{
				ZtreeBean ztreeBean = new ZtreeBean();
				ztreeBean.setId(permission.getId());
				ztreeBean.setPId(permission.getPid());
				ztreeBean.setName(permission.getName());
				ztreeBean.setIsParent(CommonUtil.isBlank(permission.getPid()));
				ztreeBean.setOpen(true);
				// 如果权限id在角色权限关联表中 则为选中状态
				ztreeBean.setChecked(pids.contains(permission.getId()));
				ztreeBeans.add(ztreeBean);
			}
			map.put("rolePermissions", JSONObject.toJSON(ztreeBeans));
		}
		return "admin/role/editRolePermission";
	}

	/**
	 * 更新角色的权限
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/editRolePermission")
	@ResponseBody
	public Object editRolePermission(String id, String[] pids, HttpServletRequest request, HttpServletResponse response)
	{
		
		if(iRolePermissionService.updatePidsById(id, pids))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

}
