package com.jkoss.shopping.system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jkoss.base.controller.BaseController;

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
@RequestMapping("/")
public class IndexController extends BaseController
{


	/**
	 * 去主页
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public String index(ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		return "admin/login";
	}

	/**
	 * 去桌面
	 * 
	 * @param req
	 * @param resp
	 */
	@RequestMapping("/toDesktop")
	public String toDesktop(ModelMap map)
	{
		map.put("props", System.getProperties());
		return "admin/desktop";
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
	public String login(String name, String pwd, ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		
		UsernamePasswordToken token = new UsernamePasswordToken(name, pwd);
//		SecurityUtils.getSubject().getSession().setAttribute(key, value);
		
		try
		{
			SecurityUtils.getSubject().login(token);
		}
		catch (UnknownAccountException uae)
		{
			map.put("msg", "未知用户");
			return "forward:/";
		}
		catch (IncorrectCredentialsException ice)
		{
			map.put("msg", "密码错误");
			return "forward:/";
		}
		catch (AuthenticationException ae)
		{
			map.put("msg", "服务器繁忙");
			return "forward:/";
		}
		return "redirect:/toIndex";
	}
	
	
	/**
	 * 去首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toIndex(HttpServletRequest request, HttpServletResponse response)
	{
		return "admin/index";
	}

	/**
	 * 退出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		SecurityUtils.getSubject().logout();
		return "redirect:/";
	}
}
