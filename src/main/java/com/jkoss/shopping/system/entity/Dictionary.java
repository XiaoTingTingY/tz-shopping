package com.jkoss.shopping.system.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableField;
import com.jkoss.base.entity.BaseEntity;

/**
 * <p>
 * 数据字典
 * </p>
 *
 * @author Tz
 * @since 2019-11-23
 */
public class Dictionary extends BaseEntity<Dictionary> {

    private static final long serialVersionUID = 1L;

    /**
     * 键
     */
    @TableField("dkey")
    private String dkey;
    /**
     * 值
     */
    @TableField("dvalue")
    private String dvalue;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDkey() {
        return dkey;
    }

    public void setDkey(String dkey) {
        this.dkey = dkey;
    }

    public String getDvalue() {
        return dvalue;
    }

    public void setDvalue(String dvalue) {
        this.dvalue = dvalue;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Dictionary{" +
        ", id=" + id +
        ", dkey=" + dkey +
        ", dvalue=" + dvalue +
        "}";
    }
}
