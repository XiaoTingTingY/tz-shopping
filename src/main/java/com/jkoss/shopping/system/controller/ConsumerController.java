package com.jkoss.shopping.system.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jkoss.base.controller.BaseController;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.common.vo.DwzPageBean;
import com.jkoss.shopping.system.entity.Consumer;
import com.jkoss.shopping.system.service.IConsumerService;
import com.jkoss.shopping.system.service.IRoleService;
import com.jkoss.shopping.system.vo.ConsumerVo;

/**
 * <p>
 * 管理员表 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Controller
@RequestMapping("/admin/consumer")
public class ConsumerController extends BaseController
{

	@Autowired
	private IConsumerService iConsumerService;

	@Autowired
	private IRoleService IRoleService;

	@RequestMapping("/list")
	public String list(DwzPageBean dwzPageBean, ModelMap map, HttpServletRequest request, HttpServletResponse response)
	{
		// 查询管理员的时候需要知道该管理员是什么角色
		QueryWrapper<ConsumerVo> queryWrapper = new QueryWrapper<>();
		IPage resultPage = iConsumerService.pageVo(dwzPageBean.toPage(), queryWrapper);
		map.put("dwzPageBean", dwzPageBean.toDwzPageBean(resultPage));
		return "admin/consumer/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(HttpServletRequest request, HttpServletResponse response)
	{
		return "admin/consumer/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Consumer consumer, HttpServletRequest request, HttpServletResponse response)
	{
		if (iConsumerService.save(consumer))
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
		map.put("record", iConsumerService.getById(id));
		return "admin/consumer/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(Consumer consumer, HttpServletRequest request, HttpServletResponse response)
	{
		if (iConsumerService.updateById(consumer))
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
		if (iConsumerService.removeByIds(Arrays.asList(id)))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}

	@RequestMapping("/toEditRole")
	public String toEditRole(String id, HttpServletRequest request, HttpServletResponse response, ModelMap map)
	{

		Consumer consumer = iConsumerService.getById(id);
		if (!CommonUtil.isBlank(consumer))
		{
			map.put("consumer", consumer);
		}

		map.put("roles", IRoleService.list());

		return "admin/consumer/editRole";
	}

	/**
	 * 编辑角色
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @param map
	 * @return
	 */
	@RequestMapping("/editRole")
	@ResponseBody
	public Object editRole(Consumer consumer, HttpServletRequest request, HttpServletResponse response, ModelMap map)
	{

		if (iConsumerService.updateById(consumer))
		{
			return ajaxSuccess();
		}
		else
		{
			return ajaxError();
		}
	}
}
