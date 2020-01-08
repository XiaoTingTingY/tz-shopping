package com.jkoss.common.constant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 常量类
 * 
 * @Author Chair
 * @Version 1.0, 2018年9月23日
 * @See
 * @Since com.jkoss.common.util
 * @Description: TODO
 */
@Component
public class Constant {

	//定义用户默认密码
	public static final String USER_DEFAULT_PASS = "123456";
	
	//定义密码加密盐
	public static final String PASS_SALF = "Tz";
	
	//权限路径
	public static final String USER_URLS = "urls";
	
	public static final String APPLICATION_BASEPATH_KEY = "basepath";

	//用户key
	public static final String SESSION_USER_KEY = "user";
	
	
	//管理员key
	public static final String SESSION_CONSUMER_KEY = "consumer";

	public static final String SESSION_USERID_KEY = "userid";

	public static final String DWZRESULT_STATUSCODE_SUCCESS = "200";

	public static final String DWZRESULT_STATUSCODE_ERROR = "300";

	public static final String DWZRESULT_STATUSCODE_TIMEOUT = "301";

	public static final String DWZRESULT_MESSAGE_SUCCESS = "操作成功";

	public static final String DWZRESULT_MESSAGE_ERROR = "操作失败";

	public static final String DWZRESULT_MESSAGE_TIMEOUT = "超时";

	public static final String DWZRESULT_CALLBACKTYPE_CLOSECURRENT = "closeCurrent";

	public static final String DWZRESULT_CALLBACKTYPE_FORWARD = "forward";

	public static String IMAGES_PATH;

	public static String IMAGES_URL;

	public static String getIMAGES_PATH() {
		return IMAGES_PATH;
	}

	@Value("${app.images-path}")
	public void setIMAGES_PATH(String iMAGES_PATH) {
		IMAGES_PATH = iMAGES_PATH;
	}

	public static String getIMAGES_URL() {
		return IMAGES_URL;
	}

	@Value("${app.images-url}")
	public void setIMAGES_URL(String iMAGES_URL) {
		IMAGES_URL = iMAGES_URL;
	}

}
