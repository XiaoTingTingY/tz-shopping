package com.jkoss.shopping.system.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableField;
import com.jkoss.base.entity.BaseEntity;

/**
 * <p>
 * 管理员表
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public class Consumer extends BaseEntity<Consumer> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户姓名
     */
    @TableField("name")
    private String name;
    /**
     * 角色id
     */
    @TableField("rid")
    private String rid;
    /**
     * 性別:
            1,男
            2,女
     */
    @TableField("sex")
    private Integer sex;
    /**
     * 用户生日
     */
    @TableField("birthday")
    private String birthday;
    @TableField("phone")
    private String phone;
    @TableField("email")
    private String email;
    
    @TableField("pass")
    private String pass;


    public String getPass()
	{
		return pass;
	}

	public void setPass(String pass)
	{
		this.pass = pass;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
	public String toString()
	{
		return "Consumer [name=" + name + ", rid=" + rid + ", sex=" + sex + ", birthday=" + birthday + ", phone="
				+ phone + ", email=" + email + ", pass=" + pass + "]";
	}
}
