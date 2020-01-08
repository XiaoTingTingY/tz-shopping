package com.jkoss.shopping.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.constant.Constant;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.shopping.system.entity.Menus;
import com.jkoss.shopping.system.entity.User;
import com.jkoss.shopping.system.service.IMenusService;
import com.jkoss.shopping.system.service.IUserService;

/**
 * 主页 前端控制器
 * 
 * @Author Tz
 * @Version 1.0,2018 年9月23日
 * @See
 * @Since com.jkoss.mengal.system.controller
 * @Description :TODO
 */
@Controller()
@RequestMapping("/web")
public class WebIndexController extends BaseController
{
	
	@Autowired
	private IMenusService iMenusService;
	
	@Autowired
	private IUserService iUserService;

	/**
	 * 去首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toIndex(HttpServletRequest request, HttpServletResponse response, ModelMap map)
	{
		QueryWrapper<Menus> queryWrapper = new QueryWrapper<>();
		queryWrapper.orderByAsc("level", "sort");
		map.put("menus", iMenusService.list(queryWrapper));
		return "web/index";
	}
	
	
	/**
	 * 登录
	 * 
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Object login(String name, String pass, HttpServletRequest request, HttpServletResponse response)
	{
		QueryWrapper<User> query = new QueryWrapper<>();
		query.eq("name", name).or().eq("phone", name);
		User user = iUserService.getOne(query);
		//如果用户存在
		if(!CommonUtil.isBlank(user))
		{
			if(CommonUtil.isEquals(user.getPass(), pass))
			{
				request.getSession().setAttribute(Constant.SESSION_USER_KEY, user);
				return ajaxSuccess("登录成功");
			}
			else
			{
				return ajaxError("密码错误");
			}
		}
		else
		{
			return ajaxError("未知用户");
		}
	}

	/**
	 * 注册
	 * 
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/register")
	@ResponseBody
	public Object register(User user, String confirmPassword, HttpServletRequest request, HttpServletResponse response)
	{
	
		if(!CommonUtil.isEquals(user.getPass(), confirmPassword))
		{
			return ajaxError("密码不一致");
		}
		//如果用户存在
		if(iUserService.save(user))
		{
			return ajaxSuccess("注册成功");
		}
		else
		{
			return ajaxError("注册未成功");
		}
	}
	
	@RequestMapping("/toSingle")
	public String toSingle(HttpServletRequest request, HttpServletResponse response, ModelMap map)
	{
		return "web/single";
	}
	
}
