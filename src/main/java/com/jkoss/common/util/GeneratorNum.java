package com.jkoss.common.util;

/**
 * 生成单号
 * 
 * @Author Jason
 * @Version 1.0, 2018年12月2日
 * @See
 * @Since com.jkoss.common.util
 * @Description: TODO
 */
public class GeneratorNum {

	private static String InventoryOrderNum = "ion";

	public static String inventoryOrderNum() {
		return InventoryOrderNum + CommonUtil.date5() + RandomCodeDemo.generate();
	}

}
