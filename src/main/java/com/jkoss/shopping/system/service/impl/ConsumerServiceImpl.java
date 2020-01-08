package com.jkoss.shopping.system.service.impl;

import com.jkoss.shopping.system.entity.Consumer;
import com.jkoss.shopping.system.mapper.ConsumerMapper;
import com.jkoss.shopping.system.service.IConsumerService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Service
public class ConsumerServiceImpl extends ServiceImpl<ConsumerMapper, Consumer> implements IConsumerService {

	public IPage pageVo(IPage page, QueryWrapper queryWrapper)
	{
		return baseMapper.selectVoByPage(page, queryWrapper);
	}

}
