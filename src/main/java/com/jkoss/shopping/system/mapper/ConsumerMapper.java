package com.jkoss.shopping.system.mapper;

import com.jkoss.shopping.system.entity.Consumer;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;

/**
 * <p>
 * 管理员表 Mapper 接口
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public interface ConsumerMapper extends BaseMapper<Consumer> {

	IPage selectVoByPage(IPage page, @Param(Constants.WRAPPER)QueryWrapper queryWrapper);

}
