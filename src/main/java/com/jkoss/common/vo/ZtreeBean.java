package com.jkoss.common.vo;

import java.io.Serializable;

/**
 * ZtreeBean
 * 
 * @author chair
 * 
 */
public class ZtreeBean implements Serializable {

	/**
	 * 节点ID
	 */
	private String id;
	/**
	 * 父节点ID
	 */
	private String pId;
	/**
	 * 资源路径
	 */
	private String path;
	/**
	 * 节点名称
	 */
	private String name;

	/**
	 * 图片
	 */
	private String icon;

	/**
	 * 父节点
	 */
	private Boolean isParent;
	/**
	 * 是否打开
	 */
	private Boolean open;

	private Boolean checked;

	private Boolean nocheck;

	private String other;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPId() {
		return pId;
	}

	public void setPId(String pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean check) {
		this.checked = check;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public Boolean getNocheck() {
		return nocheck;
	}

	public void setNocheck(Boolean nocheck) {
		this.nocheck = nocheck;
	}

	@Override
	public String toString() {
		return "ZtreeBean [id=" + id + ", pId=" + pId + ", path=" + path + ", name=" + name + ", icon=" + icon + ", isParent=" + isParent + ", open=" + open + ", checked=" + checked + ", other=" + other + "]";
	}

}
