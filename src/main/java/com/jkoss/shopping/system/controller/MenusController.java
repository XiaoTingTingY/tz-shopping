package com.jkoss.shopping.system.controller;

import java.math.BigDecimal;
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
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.common.vo.DwzPageBean;
import com.jkoss.common.vo.ZtreeBean;
import com.jkoss.shopping.system.entity.Menus;
import com.jkoss.shopping.system.service.IMenusService;

/**
 * <p>
 * 前端动态菜单 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Controller
@RequestMapping("/admin/menus")
public class MenusController extends BaseController
{

	@Autowired
	private IMenusService iMenusService;

	@RequestMapping("/list")
	public String list(DwzPageBean dwzPageBean, ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		// 查询导航栏内容,以树形的形式在前端展示
		QueryWrapper<Menus> query = new QueryWrapper<>();
		query.orderByAsc("level", "sort");
		List<Menus> menuss = iMenusService.list(query);

		List<ZtreeBean> zTreeMenus = new ArrayList<>();

		// 将navbar对象转换成zTree对象
		if (!CommonUtil.isBlank(menuss))
		{
			for (Menus menus : menuss)
			{
				ZtreeBean ztree = new ZtreeBean();
				ztree.setId(menus.getId());
				ztree.setPId(menus.getPid());
				ztree.setIsParent(CommonUtil.isBlank(menus.getPid()));
				ztree.setOpen(true);
				ztree.setName(menus.getName());
				zTreeMenus.add(ztree);
			}
			map.put("zTree", JSON.toJSONString(zTreeMenus));
		}
		else
		{
			map.put("zTree", "[]");
		}
		return "admin/menus/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(String pid, HttpServletRequest request, HttpServletResponse response, ModelMap map)
	{

		// 查询添加节点的父亲的信息
		if (!CommonUtil.isBlank(pid))
		{
			map.put("pMenus", iMenusService.getById(pid));
		}

		return "admin/menus/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Menus menus, HttpServletRequest request, HttpServletResponse response)
	{

		if (CommonUtil.isBlank(menus.getLevel()))
		{
			menus.setLevel(new BigDecimal(1));
		}

		if (iMenusService.save(menus))
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

		Menus menus = iMenusService.getById(id);
		if (!CommonUtil.isBlank(menus.getPid()))
		{
			map.put("pMenus", iMenusService.getById(menus.getPid()));
		}
		map.put("record", menus);

		return "admin/menus/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(Menus menus, HttpServletRequest request, HttpServletResponse response)
	{
		if (iMenusService.updateById(menus))
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
		if (iMenusService.removeAllById(id))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

}
