package com.jkoss.core.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.alibaba.fastjson.JSON;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.common.vo.Menu;

/**
 * 菜单标签
 * 
 * @author chair
 *
 */
public class MenuTag extends BodyTagSupport
{
	@Override
	public int doEndTag() throws JspException
	{
		String menujson = super.getBodyContent().getString();
		List<Menu> menus = JSON.parseArray(menujson, Menu.class);
		StringBuilder sb = new StringBuilder();
		sb.append("<aside class='Hui-admin-aside-wrapper'>");
		sb.append("	<div class='Hui-admin-logo-wrapper'>");
		sb.append(
				"		<a class='logo navbar-logo' href='#'> <i class='va-m iconpic global-logo'></i> <span class='va-m'>后端管理</span>");
		sb.append("		</a>");
		sb.append("	</div>");
		sb.append("	<div class='Hui-admin-menu-dropdown bk_2'>");
		sb.append("		<dl id='menu-system' class='Hui-menu'>");
		// sb.append(" <dt class='Hui-menu-title'>");
		// sb.append(" <i class='Hui-iconfont'>&#xe62e;</i> 系统管理<i class='Hui-iconfont
		// Hui-admin-menu-dropdown-arrow'>&#xe6d5;</i>");
		// sb.append(" </dt>");
		// sb.append(" <dd class='Hui-menu-item'>");
		// sb.append(" <ul>");
		// sb.append(" <li><a
		// data-href='${pageContext.request.contextPath}/system/user.do?method=list'
		// data-title='用户管理' href='javascript:void(0)'>用户管理</a></li>");
		// sb.append(" </ul>");
		// sb.append(" </dd>");
		// 动态菜单
		if (!CommonUtil.isBlank(menus))
		{
			for (Menu menu : menus)
			{
				sb.append("			<dt class='Hui-menu-title'>");
				sb.append("				<i class='Hui-iconfont'>" + menu.getIcon() + "</i> " + menu.getName()
						+ "<i class='Hui-iconfont Hui-admin-menu-dropdown-arrow'>&#xe6d5;</i>");
				sb.append("			</dt>");
				if (!CommonUtil.isBlank(menu.getChild()))
				{
					sb.append("			<dd class='Hui-menu-item'>");
					sb.append("				<ul>");
					for (Menu menu2 : menu.getChild())
					{
						// 二级节点
						if (CommonUtil.isBlank(menu2.getChild()))
						{
							// 没有三级节点的二级节点
							sb.append("					<li><a data-href='" + menu2.getHref() + "' data-title='"
									+ menu2.getName() + "' href='javascript:void(0)'>" + menu2.getName() + "</a></li>");
						}
						else
						{
							// 有三级节点的二级节点
							sb.append("<li>");
							sb.append("	<dl class='Hui-menu'>");
							sb.append("		<dt class='Hui-menu-title'>" + menu2.getName()
									+ "<i class='Hui-iconfont Hui-admin-menu-dropdown-arrow'>&#xe6d5;</i></dt>");
							sb.append("		<dd class='Hui-menu-item'>");
							sb.append("			<ul>");
							for (Menu menu3 : menu2.getChild())
							{
								sb.append("				<li><a data-href='" + menu3.getHref() + "' data-title='"
										+ menu3.getName() + "' href='javascript:void(0)'>" + menu3.getName()
										+ "</a></li>");
							}
							sb.append("			</ul>");
							sb.append("		</dd>");
							sb.append("	</dl>");
							sb.append("</li>");
						}
					}
					sb.append("				</ul>");
					sb.append("			</dd>");
				}
			}
		}

		sb.append("		</dl>");
		sb.append("	</div>");
		sb.append("</aside>");
		try
		{
			JspWriter out = this.pageContext.getOut();
			out.print(sb.toString());
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
}
