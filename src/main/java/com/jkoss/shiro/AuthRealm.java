package com.jkoss.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jkoss.common.constant.Constant;
import com.jkoss.common.util.CommonUtil;
import com.jkoss.shopping.system.entity.Consumer;
import com.jkoss.shopping.system.entity.Permission;
import com.jkoss.shopping.system.entity.Role;
import com.jkoss.shopping.system.service.IConsumerService;
import com.jkoss.shopping.system.service.IPermissionService;
import com.jkoss.shopping.system.service.IRoleService;

@Component("AuthRealm")
public class AuthRealm extends AuthorizingRealm
{
	
	@Autowired
	private IConsumerService iConsumerService;
	
	@Autowired
	private IPermissionService iPermissionService;
	
	@Autowired
	private IRoleService iRoleService;
	// 认证.登录
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
	{
		UsernamePasswordToken token2 = (UsernamePasswordToken) token;
		
		String userName = token2.getUsername();
		String pwd = new String(token2.getPassword());
		
		QueryWrapper<Consumer> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("name", userName).or().eq("phone", userName);
		Consumer consumer = iConsumerService.getOne(queryWrapper);
		
		
		
		
		if(CommonUtil.isBlank(consumer))
		{
			throw new UnknownAccountException();
		}
		if(!CommonUtil.isEquals(pwd, consumer.getPass()))
		{
			throw new IncorrectCredentialsException();
		}

		Role role = iRoleService.getById(consumer.getRid());
		
		//查询该用户的角色所拥有的权限
		List<Permission> permissions = iPermissionService.selectPermissionByUid(consumer.getId());
		List<Permission> Menus = new ArrayList<>();
		List<String> urls = new ArrayList<>();
		
		if(!CommonUtil.isBlank(permissions))
		{
			for(Permission permission : permissions)
			{
				if(CommonUtil.isEquals(permission.getLevel(), 1) || CommonUtil.isEquals(permission.getLevel(), 2))
				{
					Menus.add(permission);
				}
				
				if(CommonUtil.isEquals(permission.getLevel(), 2) || CommonUtil.isEquals(permission.getLevel(), 3))
				{
					urls.add(permission.getUrl());
				}
			}
		}
		//如果有该用户且密码正确 认证通过
		SecurityUtils.getSubject().getSession().setAttribute(Constant.SESSION_CONSUMER_KEY, consumer);
		SecurityUtils.getSubject().getSession().setAttribute("role", role);
		SecurityUtils.getSubject().getSession().setAttribute("menus", Menus);
		SecurityUtils.getSubject().getSession().setAttribute(Constant.USER_URLS, urls);
		return new SimpleAuthenticationInfo(consumer, pwd, getName());
	}

	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal)
	{
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions((Collection<String>) SecurityUtils.getSubject().getSession().getAttribute(Constant.USER_URLS));
		return simpleAuthorizationInfo;
	}

}