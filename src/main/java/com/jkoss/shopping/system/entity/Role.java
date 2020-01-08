package com.jkoss.shopping.system.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableField;
import com.jkoss.base.entity.BaseEntity;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public class Role extends BaseEntity<Role> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名
     */
    @TableField("rolename")
    private String rolename;
    /**
     * 备注
     */
    @TableField("remarks")
    private String remarks;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Role{" +
        ", id=" + id +
        ", rolename=" + rolename +
        ", remarks=" + remarks +
        "}";
    }
}
