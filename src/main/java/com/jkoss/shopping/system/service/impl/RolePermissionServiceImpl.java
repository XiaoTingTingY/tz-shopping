package com.jkoss.shopping.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.entity.RolePermission;
import com.jkoss.shopping.system.mapper.RolePermissionMapper;
import com.jkoss.shopping.system.service.IPermissionService;
import com.jkoss.shopping.system.service.IRolePermissionService;

/**
 * <p>
 * 角色权限关联表 服务实现类
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements IRolePermissionService {

	@Autowired
	private IRolePermissionService iRolePermissionService;
	
	@Autowired
	private IPermissionService iPermissionService;
	
	@Override
	public List<String> listPidByRolePermission(String id)
	{
		List<String> pids = new ArrayList<>();
		QueryWrapper<RolePermission> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("rid", id);
		
		List<RolePermission> rolePermissions = iRolePermissionService.list(queryWrapper);
		if(!CommonUtil.isBlank(rolePermissions))
		{
			for(RolePermission rolePermission : rolePermissions)
			{
				pids.add(rolePermission.getPid());
			}
		}
		return pids;
	}

	@Override
	public boolean updatePidsById(String id, String[] pids)
	{
		//更具角色id关联权限id
		//先删除该角色关联的所有权限
		QueryWrapper<RolePermission> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("rid", id);
		this.remove(queryWrapper);
		
		if(!CommonUtil.isBlank(pids))
		{
			for(String pid : pids)
			{
				RolePermission rolePermission = new RolePermission();
				rolePermission.setRid(id);
				rolePermission.setPid(pid);
				this.save(rolePermission);
			}
		}
		return true;
	}

}
