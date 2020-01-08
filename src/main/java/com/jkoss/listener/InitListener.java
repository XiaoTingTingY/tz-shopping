package com.jkoss.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.jkoss.common.constant.Constant;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.shopping.system.entity.Dictionary;
import com.jkoss.shopping.system.service.IDictionaryService;

@Component
public class InitListener implements ServletContextListener
{

	@Value("${app.basePath}")
	private String basePath;
	
	@Autowired
	private IDictionaryService iDictionaryService;

	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		List<Dictionary> tmpe = iDictionaryService.list();
		if(!CommonUtil.isBlank(tmpe))
		{
			Map<String, Object> dictionarys = new HashMap<>();
			for(Dictionary dictionary : tmpe)
			{
				dictionarys.put(dictionary.getDkey(), dictionary.getDvalue());
			}
			sce.getServletContext().setAttribute("dictionarys", dictionarys);
		}
		if (CommonUtil.isBlank(basePath))
		{
			sce.getServletContext().setAttribute(Constant.APPLICATION_BASEPATH_KEY,
					sce.getServletContext().getContextPath());
		}
		else
		{
			sce.getServletContext().setAttribute(Constant.APPLICATION_BASEPATH_KEY, basePath);
		}
	}
}
