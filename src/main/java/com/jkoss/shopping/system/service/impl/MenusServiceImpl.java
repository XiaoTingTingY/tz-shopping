package com.jkoss.shopping.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.shopping.system.entity.Menus;
import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.mapper.MenusMapper;
import com.jkoss.shopping.system.service.IMenusService;

/**
 * <p>
 * 前端动态菜单 服务实现类
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Service
public class MenusServiceImpl extends ServiceImpl<MenusMapper, Menus> implements IMenusService {

	@Override
	public boolean removeAllById(String id)
	{
		
		List<Menus> menuss = new ArrayList<>();
		menuss.add(this.getById(id));
		menuss = getCileds(menuss, id);
		
		if(!CommonUtil.isBlank(menuss))
		{
			for(Menus menus : menuss)
			{
				this.removeById(menus.getId());
			}
		}
		return true;
	}

	
	
	public List<Menus> getCileds(List<Menus> menuss, String id)
	{
		QueryWrapper<Menus> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("pid", id);
		List<Menus> tmps = this.list(queryWrapper);
		if(!CommonUtil.isBlank(tmps))
		{
			menuss.addAll(tmps);
			for(Menus menus : tmps)
			{
				getCileds(menuss, menus.getId());
			}
		}
		return menuss;
	}
}
