package com.jkoss.shopping.system.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.jkoss.base.entity.BaseEntity;

/**
 * <p>
 * 权限表
 * </p>
 *
 * @author Tz
 * @since 2019-11-24
 */
public class Permission extends BaseEntity<Permission> {

    private static final long serialVersionUID = 1L;

    /**
     * 父级id
     */
    @TableField("pid")
    private String pid;
    /**
     * 名称
     */
    @TableField("name")
    private String name;
    /**
     * 排序
     */
    @TableField("sort")
    private String sort;
    /**
     * 权限路径
     */
    @TableField("url")
    private String url;
    /**
     * 等级
     */
    @TableField("level")
    private BigDecimal level;
    /**
     * 备注
     */
    @TableField("remarks")
    private String remarks;
    /**
     * 类型
1，菜单
2，菜单子项-查找
3，操作 - 增删改
     */
    @TableField("type")
    private BigDecimal type;
    
    
    @TableField("icon")
    private String icon;
    
    


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

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public BigDecimal getLevel() {
        return level;
    }

    public void setLevel(BigDecimal level) {
        this.level = level;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public BigDecimal getType() {
        return type;
    }

    public void setType(BigDecimal type) {
        this.type = type;
    }

    public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
	}

	@Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
	public String toString()
	{
		return "Permission [pid=" + pid + ", name=" + name + ", sort=" + sort + ", url=" + url + ", level=" + level
				+ ", remarks=" + remarks + ", type=" + type + ", icon=" + icon + "]";
	}
}
