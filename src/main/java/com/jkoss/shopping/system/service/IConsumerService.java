package com.jkoss.shopping.system.service;

import com.jkoss.shopping.system.entity.Consumer;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 管理员表 服务类
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public interface IConsumerService extends IService<Consumer> {

	IPage pageVo(IPage page, QueryWrapper queryWrapper);

}
