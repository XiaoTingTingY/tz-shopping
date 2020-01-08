package com.jkoss.shopping.system.mapper;

import com.jkoss.shopping.system.entity.Permission;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 权限表 Mapper 接口
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
public interface PermissionMapper extends BaseMapper<Permission> {

	List<Permission> selectPermissionByUid(@Param("id")String id);

}
