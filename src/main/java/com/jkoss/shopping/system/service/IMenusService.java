package com.jkoss.shopping.system.service;

import com.jkoss.shopping.system.entity.Menus;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 前端动态菜单 服务类
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public interface IMenusService extends IService<Menus> {

	boolean removeAllById(String id);

}
