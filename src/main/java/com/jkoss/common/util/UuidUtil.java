package com.jkoss.common.util;

import java.util.UUID;

/**
 * uuid 工具类
 * 
 * @Author chair
 * @Version 1.0, 2017年8月20日
 * @See
 * @Since com.jk.bestbaby.util
 * @Description: TODO
 */
public class UuidUtil {

	public UuidUtil() {

	}

	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		str = str.replace("-", "");
		// 去掉"-"符号
		// String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14,
		// 18) + str.substring(19, 23) + str.substring(24);
		return str;
	}

	// 获得指定数量的UUID
	public static String[] getUUID(int number) {
		if (number < 1) {
			return null;
		}
		String[] ss = new String[number];
		for (int i = 0; i < number; i++) {
			ss[i] = getUUID();
		}
		return ss;
	}

	public static void main(String[] args) {
		 System.out.println(getUUID());
	}
}