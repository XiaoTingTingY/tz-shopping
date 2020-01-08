package com.jkoss.common.vo;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * 前端分页组件
 * 
 * @author chair
 *
 */
public class DwzPageBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8470697978259453214L;

	// 指定的或是页面参数
	private Long pageNum = 1l; // 当前页
	private Long numPerPage = 5l; // 每页显示多少条

	// 查询数据库
	private Long totalCount; // 总记录数
	private List<Object> recordList; // 本页的数据列表

	// 计算
	private Long pageCount; // 总页数
	private Long beginPageIndex; // 页码列表的开始索引（包含）
	private Long endPageIndex; // 页码列表的结束索引（包含）

	private Map<String, Object> countResultMap = new HashMap(); // 当前分页条件下的统计结果

	private String orderField;// 排序字段
	private String orderDirection;// 正序倒序

	public DwzPageBean() {

	}

	public IPage toPage() {
		Page page = new Page();
		page.setCurrent(pageNum);
		page.setSize(numPerPage == null ? 15 : numPerPage);
		return page;
	}

	public DwzPageBean toDwzPageBean(IPage page) {
		this.setRecordList(page.getRecords());
		this.setPageNum(page.getCurrent());
		this.setNumPerPage(page.getSize());
		this.setTotalCount(page.getTotal());
		this.setPageCount(page.getPages());
		return this;
	}

	public DwzPageBean toDwzPageBean(List recordList) {
		this.totalCount = (long) recordList.size();
		this.recordList = this.getPagedList(this.pageNum, this.numPerPage, recordList);

		// 计算总页码
		pageCount = (totalCount + numPerPage - 1) / numPerPage;

		// 计算 beginPageIndex 和 endPageIndex
		// >> 总页数不多于10页，则全部显示
		if (pageCount <= 10) {
			beginPageIndex = 1l;
			endPageIndex = pageCount;
		}
		// >> 总页数多于10页，则显示当前页附近的共10个页码
		else {
			// 当前页附近的共10个页码（前4个 + 当前页 + 后5个）
			beginPageIndex = pageNum - 4;
			endPageIndex = pageNum + 5;
			// 当前面的页码不足4个时，则显示前10个页码
			if (beginPageIndex < 1) {
				beginPageIndex = 1l;
				endPageIndex = 10l;
			}
			// 当后面的页码不足5个时，则显示后10个页码
			if (endPageIndex > pageCount) {
				endPageIndex = pageCount;
				beginPageIndex = pageCount - 10 + 1;
			}
		}

		return this;
	}

	/**
	 * 得到分页后的数据
	 * 
	 * @param <T>
	 *
	 * @param pageNum
	 *            页码
	 * @return 分页后结果
	 */
	public List getPagedList(long nowPage, long pageSize, List data) {
		long fromIndex = (nowPage - 1) * pageSize;
		if (fromIndex >= data.size()) {
			return Collections.emptyList();// 空数组
		}
		if (fromIndex < 0) {
			return Collections.emptyList();// 空数组
		}
		long toIndex = nowPage * pageSize;
		if (toIndex >= data.size()) {
			toIndex = data.size();
		}
		return data.subList((int) fromIndex, (int) toIndex);
	}

	/**
	 * 只接受前4个必要的属性，会自动的计算出其他3个属生的值
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param totalCount
	 * @param recordList
	 */
	public DwzPageBean(long pageNum, long numPerPage, long totalCount, List<Object> recordList) {
		this.pageNum = pageNum;
		this.numPerPage = numPerPage;
		this.totalCount = totalCount;
		this.recordList = recordList;

		// 计算总页码
		pageCount = (totalCount + numPerPage - 1) / numPerPage;

		// 计算 beginPageIndex 和 endPageIndex
		// >> 总页数不多于10页，则全部显示
		if (pageCount <= 10) {
			beginPageIndex = 1l;
			endPageIndex = pageCount;
		}
		// >> 总页数多于10页，则显示当前页附近的共10个页码
		else {
			// 当前页附近的共10个页码（前4个 + 当前页 + 后5个）
			beginPageIndex = (long) (pageNum - 4);
			endPageIndex = pageNum + 5;
			// 当前面的页码不足4个时，则显示前10个页码
			if (beginPageIndex < 1) {
				beginPageIndex = 1l;
				endPageIndex = 10l;
			}
			// 当后面的页码不足5个时，则显示后10个页码
			if (endPageIndex > pageCount) {
				endPageIndex = pageCount;
				beginPageIndex = pageCount - 10 + 1;
			}
		}
	}

	/**
	 * 只接受前5个必要的属性，会自动的计算出其他3个属生的值
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param totalCount
	 * @param recordList
	 */
	public DwzPageBean(long pageNum, long numPerPage, long totalCount, List<Object> recordList, Map<String, Object> countResultMap) {
		this.pageNum = pageNum;
		this.numPerPage = numPerPage;
		this.totalCount = totalCount;
		this.recordList = recordList;
		this.countResultMap = countResultMap;

		// 计算总页码
		pageCount = (totalCount + numPerPage - 1) / numPerPage;

		// 计算 beginPageIndex 和 endPageIndex
		// >> 总页数不多于10页，则全部显示
		if (pageCount <= 10) {
			beginPageIndex = 1l;
			endPageIndex = pageCount;
		}
		// >> 总页数多于10页，则显示当前页附近的共10个页码
		else {
			// 当前页附近的共10个页码（前4个 + 当前页 + 后5个）
			beginPageIndex = pageNum - 4;
			endPageIndex = pageNum + 5;
			// 当前面的页码不足4个时，则显示前10个页码
			if (beginPageIndex < 1) {
				beginPageIndex = 1l;
				endPageIndex = 10l;
			}
			// 当后面的页码不足5个时，则显示后10个页码
			if (endPageIndex > pageCount) {
				endPageIndex = pageCount;
				beginPageIndex = pageCount - 10 + 1;
			}
		}
	}

	public Long getPageNum() {
		return pageNum;
	}

	public void setPageNum(Long pageNum) {
		this.pageNum = pageNum;
	}

	public Long getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(Long numPerPage) {
		this.numPerPage = numPerPage;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public List<Object> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<Object> recordList) {
		this.recordList = recordList;
	}

	public Long getPageCount() {
		return pageCount;
	}

	public void setPageCount(Long pageCount) {
		this.pageCount = pageCount;
	}

	public Long getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(Long beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public Long getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(Long endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	public Map<String, Object> getCountResultMap() {
		return countResultMap;
	}

	public void setCountResultMap(Map<String, Object> countResultMap) {
		this.countResultMap = countResultMap;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

}
