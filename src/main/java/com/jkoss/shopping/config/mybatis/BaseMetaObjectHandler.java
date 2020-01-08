package com.jkoss.shopping.config.mybatis;

import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.jkoss.common.util.CommonUtil;

/**
 * mybatisplus自定义填充公共字段 ,即没有传的字段自动填充
 * 1.创建MyMetaObjectHandler继承com.baomidou.mybatisplus.mapper.MetaObjectHandler;
 * 2.重写insertFill和updateFill方法
 * 3.在application.yml上添加mybatis-plus.global-config.meta-object-handler=com.jkoss.example.config.mybatis.MyMetaObjectHandler
 * 4.需要自定义填充公共字段 ,即没有传的字段自动填充的,在实体类的字段上添加@TableField(value = "idcard", fill =
 * FieldFill.INSERT_UPDATE)
 */
@Component
public class BaseMetaObjectHandler implements MetaObjectHandler {

	/**
	 * 新增填充
	 */
	@Override
	public void insertFill(MetaObject metaObject) {

		setFieldValByName("crtm", CommonUtil.date6(), metaObject);
		setFieldValByName("mdtm", CommonUtil.date6(), metaObject);
	}

	/**
	 * 更新填充
	 */
	@Override
	public void updateFill(MetaObject metaObject) {
		setFieldValByName("mdtm", CommonUtil.date6(), metaObject);
	}

}