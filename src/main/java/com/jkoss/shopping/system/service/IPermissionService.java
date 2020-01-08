package com.jkoss.shopping.system.service;

import com.jkoss.shopping.system.entity.Permission;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 权限表 服务类
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
public interface IPermissionService extends IService<Permission> {

	boolean removeAllById(String id);

	/**
	 * 根据用户id查询该用户的角色所拥有的权限
	 * @param id
	 * @return
	 */
	List<Permission> selectPermissionByUid(String id);

}
