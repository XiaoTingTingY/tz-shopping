package com.jkoss.shopping.system.service;

import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.entity.RolePermission;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 角色权限关联表 服务类
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
public interface IRolePermissionService extends IService<RolePermission>
{

	List<String> listPidByRolePermission(String id);

	/**
	 * 根据角色的id更新该角色的所有权限
	 * 
	 * @param id
	 *            角色id
	 * @param pids
	 *            权限id
	 * @return
	 */
	boolean updatePidsById(String id, String[] pids);

}
