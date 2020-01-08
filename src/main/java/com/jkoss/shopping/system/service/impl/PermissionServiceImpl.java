package com.jkoss.shopping.system.service.impl;

import com.jkoss.common.util.CommonUtil;
import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.mapper.PermissionMapper;
import com.jkoss.shopping.system.service.IPermissionService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限表 服务实现类
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

	public boolean removeAllById(String id)
	{
		//要删除的集合
		List<Permission> permissions = new ArrayList<>();
		permissions.add(this.getById(id));
		permissions = getChiles(permissions, id);
		
		if(!CommonUtil.isBlank(permissions))
		{
			for(Permission permission : permissions)
			{
				baseMapper.deleteById(permission.getId());
			}
		}
		return true;
	}
	
	public List<Permission> getChiles(List<Permission> permissions, String id)
	{
		QueryWrapper<Permission> query = new QueryWrapper<>();
		query.eq("pid", id);
		List<Permission> tmpes = this.list(query);
		if(!CommonUtil.isBlank(tmpes))
		{
			//如果它有儿子 则添加删除队列中，在遍历儿子还有没有儿子
			permissions.addAll(tmpes);
			for(Permission permission : tmpes)
			{
				getChiles(permissions, permission.getId());
			}
		}
		//没有在查到数据直接返回
		return permissions;
	}

	@Override
	public List<Permission> selectPermissionByUid(String id)
	{
		return baseMapper.selectPermissionByUid(id);
	}

}
