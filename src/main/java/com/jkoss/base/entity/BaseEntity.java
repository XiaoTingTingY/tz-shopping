package com.jkoss.base.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;

/**
 * 
 * 
 * 
 * @Author chair
 * @Version 1.0, 2019年6月1日
 * @See
 * @Since com.jkoss.base.entity
 * @Description: TODO
 */
public class BaseEntity<T extends Model> extends Model<T> {
	/**
	 * id
	 */
	@TableId("id")
	protected String id;
	/**
	 * 创建时间
	 */
	@TableField(value = "crtm", fill = FieldFill.INSERT)
	protected String crtm;

	/**
	 * 修改时间
	 */
	@TableField(value = "mdtm", fill = FieldFill.INSERT_UPDATE)
	protected String mdtm;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCrtm() {
		return crtm;
	}

	public void setCrtm(String crtm) {
		this.crtm = crtm;
	}

	public String getMdtm() {
		return mdtm;
	}

	public void setMdtm(String mdtm) {
		this.mdtm = mdtm;
	}

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return this.id;
	}

}
