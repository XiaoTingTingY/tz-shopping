package com.jkoss.shopping.system.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableField;
import com.jkoss.base.entity.BaseEntity;

/**
 * <p>
 * 商城用户表
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public class User extends BaseEntity<User>
{

	private static final long serialVersionUID = 1L;

	/**
	 * 用户姓名
	 */
	@TableField("name")
	private String name;
	/**
	 * 性別: 1,男 2,女
	 */
	@TableField("sex")
	private Integer sex;
	/**
	 * 用户生日
	 */
	@TableField("birthday")
	private String birthday;
	/**
	 * 邮箱
	 */
	@TableField("email")
	private String email;
	/**
	 * 手机号
	 */
	@TableField("phone")
	private String phone;
	/**
	 * 密码
	 */
	@TableField("pass")
	private String pass;
	
	@TableField("crtm")
	private String crtm;

	@TableField("mdtm")
	private String mdtm;
	
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public Integer getSex()
	{
		return sex;
	}

	public void setSex(Integer sex)
	{
		this.sex = sex;
	}

	public String getBirthday()
	{
		return birthday;
	}

	public void setBirthday(String birthday)
	{
		this.birthday = birthday;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getPass()
	{
		return pass;
	}

	public void setPass(String pass)
	{
		this.pass = pass;
	}

	@Override
	protected Serializable pkVal()
	{
		return this.id;
	}

	
	@Override
	public String toString()
	{
		return "User [name=" + name + ", sex=" + sex + ", birthday=" + birthday + ", email=" + email + ", phone="
				+ phone + ", pass=" + pass + ", crtm=" + crtm + ", mdtm=" + mdtm + "]";
	}
}
