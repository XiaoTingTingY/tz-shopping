package com.jkoss.shopping.system.service.impl;

import com.jkoss.shopping.system.entity.User;
import com.jkoss.shopping.system.mapper.UserMapper;
import com.jkoss.shopping.system.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商城用户表 服务实现类
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
