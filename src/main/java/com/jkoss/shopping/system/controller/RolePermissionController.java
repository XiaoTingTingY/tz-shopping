package com.jkoss.shopping.system.controller;


import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.vo.DwzPageBean;
import com.jkoss.shopping.system.entity.RolePermission;
import com.jkoss.shopping.system.service.IRolePermissionService;

/**
 * <p>
 * 角色权限关联表 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
@Controller
@RequestMapping("/admin/rolePermission")
public class RolePermissionController extends BaseController {


	@Autowired
	private IRolePermissionService iRolePermissionService;
	
	@RequestMapping("/list")
	public String list(DwzPageBean dwzPageBean, ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		IPage resultPage = iRolePermissionService.page(dwzPageBean.toPage());
		map.put("dwzPageBean", dwzPageBean.toDwzPageBean(resultPage));
		return "system/role_permission/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(HttpServletRequest request, HttpServletResponse response) {
		return "system/role_permission/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(RolePermission role_permission, HttpServletRequest request, HttpServletResponse response) {
		if (iRolePermissionService.save(role_permission)) {
			return ajaxSuccess();
		} else {
			return ajaxError();
		}

	}

	@RequestMapping("/toUpdate")
	public String toUpdate(String id, ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		map.put("record", iRolePermissionService.getById(id));
		return "system/role_permission/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(RolePermission role_permission, HttpServletRequest request, HttpServletResponse response) {
		if (iRolePermissionService.updateById(role_permission)) {
			return ajaxSuccess();
		} else {
			return ajaxError();
		}
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String[] id, HttpServletRequest request, HttpServletResponse response) {
		if (iRolePermissionService.removeByIds(Arrays.asList(id))) {
			return ajaxSuccess();
		} else {
			return ajaxError();
		}
	}
	

}

