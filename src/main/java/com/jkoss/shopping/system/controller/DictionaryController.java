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
import com.jkoss.shopping.system.entity.Dictionary;
import com.jkoss.shopping.system.service.IDictionaryService;

/**
 * <p>
 * 数据字典 前端控制器
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Controller
@RequestMapping("/admin/dictionary")
public class DictionaryController extends BaseController {


	@Autowired
	private IDictionaryService iDictionaryService;
	
	@RequestMapping("/list")
	public String list(DwzPageBean dwzPageBean, ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		IPage resultPage = iDictionaryService.page(dwzPageBean.toPage());
		map.put("dwzPageBean", dwzPageBean.toDwzPageBean(resultPage));
		return "admin/dictionary/list";
	}

	@RequestMapping("/toInsert")
	public String toInsert(HttpServletRequest request, HttpServletResponse response) {
		return "admin/dictionary/edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Dictionary dictionary, HttpServletRequest request, HttpServletResponse response) {
		if (iDictionaryService.save(dictionary)) {
			return ajaxSuccess();
		} else {
			return ajaxError();
		}

	}

	@RequestMapping("/toUpdate")
	public String toUpdate(String id, ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		map.put("record", iDictionaryService.getById(id));
		return "admin/dictionary/edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Object update(Dictionary dictionary, HttpServletRequest request, HttpServletResponse response) {
		if (iDictionaryService.updateById(dictionary)) {
			return ajaxSuccess();
		} else {
			return ajaxError();
		}
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String[] id, HttpServletRequest request, HttpServletResponse response) {
		if (iDictionaryService.removeByIds(Arrays.asList(id))) {
			return ajaxSuccess();
		} else {
			return ajaxError();
		}
	}
	

}

