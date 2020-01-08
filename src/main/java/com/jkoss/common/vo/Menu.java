package com.jkoss.common.vo;

import java.util.List;

public class Menu {

	private String name;
	private String icon;
	private String href;
	private List<Menu> child;

	public Menu() {
	}

	public String getName() {
		return name;
	}

	public String getIcon() {
		return icon;
	}

	public String getHref() {
		return href;
	}

	public List<Menu> getChild() {
		return child;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public void setChild(List<Menu> child) {
		this.child = child;
	}

	@Override
	public String toString() {
		return "Menu [name=" + name + ", icon=" + icon + ", href=" + href + ", child=" + child + "]";
	}

}
