package com.jkoss.shopping.system.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.vo.DwzPageBean;
import com.jkoss.shopping.system.entity.User;
import com.jkoss.shopping.system.service.IUserService;

/**
 * <p>
 * 商城用户表 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController
{

	@Autowired
	private IUserService iUserService;

	
	@RequiresPermissions("/admin/user/list")
	@RequestMapping("/list")
	public String list(DwzPageBean dwzPageBean, ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		IPage resultPage = iUserService.page(dwzPageBean.toPage());
		map.put("dwzPageBean", dwzPageBean.toDwzPageBean(resultPage));
		return "admin/user/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(HttpServletRequest request, HttpServletResponse response)
	{
		return "admin/user/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(User user, HttpServletRequest request, HttpServletResponse response)
	{
		if (iUserService.save(user))
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
		map.put("record", iUserService.getById(id));
		return "admin/user/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(User user, HttpServletRequest request, HttpServletResponse response)
	{
		if (iUserService.updateById(user))
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
		if (iUserService.removeByIds(Arrays.asList(id)))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

}
