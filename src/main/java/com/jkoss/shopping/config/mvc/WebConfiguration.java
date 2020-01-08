package com.jkoss.shopping.config.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.jkoss.listener.InitListener;

/**
 * Web配置类
 * 
 * @Author chair
 * @Version 1.0, 2017年8月22日
 * @See
 * @Since com.jk.bestbaby.config
 * @Description: TODO
 */
@Configuration
public class WebConfiguration {
	/**
	 * 添加监听器
	 * 
	 * @param initListener
	 * @return
	 */
	@Bean
	public ServletListenerRegistrationBean listenerRegist(@Autowired InitListener initListener) {
		ServletListenerRegistrationBean srb = new ServletListenerRegistrationBean();
		srb.setListener(initListener);
		return srb;
	}

	/**
	 * 访问druid监控信息servlet
	 * 
	 * @return
	 */
	@Bean
	public ServletRegistrationBean druidServletRegistration() {
		ServletRegistrationBean registration = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
		// 添加初始化参数：initParams

		// 白名单：
		registration.addInitParameter("allow", "127.0.0.1");
		// IP黑名单 (存在共同时，deny优先于allow) : 如果满足deny的话提示:Sorry, you are not
		// permitted to view this page.
		registration.addInitParameter("deny", "");
		// 登录查看信息的账号密码.
		// 是否能够重置数据.
		registration.addInitParameter("resetEnable", "false");
		return registration;
	}

	/**
	 * 过滤druid
	 * 
	 * @return
	 */
	@Bean
	public FilterRegistrationBean druidStatFilter() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());

		// 添加过滤规则.
		filterRegistrationBean.addUrlPatterns("/*");

		// 添加不需要忽略的格式信息.
		filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
		return filterRegistrationBean;
	}

}
