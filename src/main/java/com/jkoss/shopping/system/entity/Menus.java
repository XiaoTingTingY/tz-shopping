package com.jkoss.shopping.system.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.jkoss.base.entity.BaseEntity;

/**
 * <p>
 * 前端动态菜单
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public class Menus extends BaseEntity<Menus> {

    private static final long serialVersionUID = 1L;

    /**
     * 父级菜单
     */
    @TableField("pid")
    private String pid;
    /**
     * 菜单名
     */
    @TableField("name")
    private String name;
    /**
     * 排序
     */
    @TableField("sort")
    private BigDecimal sort;
    /**
     * 等级
     */
    @TableField("level")
    private BigDecimal level;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }

    public BigDecimal getLevel() {
        return level;
    }

    public void setLevel(BigDecimal level) {
        this.level = level;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Menus{" +
        ", id=" + id +
        ", pid=" + pid +
        ", name=" + name +
        ", sort=" + sort +
        ", level=" + level +
        "}";
    }
}
