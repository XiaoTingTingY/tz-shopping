package com.jkoss.common.vo;

/**
 * 前端返回组件
 * 
 * @author chair
 *
 */
public class DwzResultBean {

	/**
	 * Ajax请求的执行状态码.<br/>
	 * statusCode:{ok:200, error:300, timeout:301}.<br/>
	 * 200：成功，300：错误，301:请求超时.
	 */
	private String statusCode = "";

	/**
	 * Ajax提示消息 message
	 */
	private String message = "";

	/**
	 * navTabId. 服务器传回navTabId可以把那个navTab标记为reloadFlag=1,下次切换到那个navTab时会重新载入内容 .
	 */
	private String navTabId = "";

	/**
	 * dialogId. 服务器传回dialogId可以把那个dialogId标记为reloadFlag=1,下次切换到那个dialog时会重新载入内容 .
	 */
	private String dialogId = "";

	/**
	 * Ajax请求回调类型. <br/>
	 * callbackType如果是closeCurrent就会关闭当前tab选项,
	 * 只有callbackType="forward"时需要forwardUrl值,以重定向到另一个URL.
	 */
	private String callbackType = "";

	/**
	 * 重定向URL .
	 */
	private String forwardUrl = "";

	/**
	 * 关联Action .
	 */
	private String rel = "";

	/**
	 * 提示确认信息.
	 */
	private String confirmMsg = "";

	private Object content;

	/**
	 * 全参构造函数.
	 * 
	 * @param statusCode
	 *            .
	 * @param message
	 *            .
	 * @param navTabId
	 *            .
	 * @param dialogId
	 *            .
	 * @param callbackType
	 *            .
	 * @param forwardUrl
	 *            .
	 * @param rel
	 *            .
	 * @param content
	 *            .
	 */
	public DwzResultBean(String statusCode, String message, String navTabId, String dialogId, String callbackType, String forwardUrl, String rel, String confirmMsg, Object content) {
		this.statusCode = statusCode;
		this.message = message;
		this.navTabId = navTabId;
		this.dialogId = dialogId;
		this.callbackType = callbackType;
		this.forwardUrl = forwardUrl;
		this.rel = rel;
		this.confirmMsg = confirmMsg;
		this.content = content;
	}

	/**
	 * DwzAjaxDone所需参数的构造函数.
	 * 
	 * @param navTabId
	 *            .
	 * @param callbackType
	 *            .
	 * @param forwardUrl
	 *            .
	 * @param rel
	 *            .
	 */
	public DwzResultBean(String navTabId, String callbackType, String forwardUrl, String rel) {
		this.navTabId = navTabId;
		this.callbackType = callbackType;
		this.forwardUrl = forwardUrl;
		this.rel = rel;
	}

	/**
	 * DwzAjaxDone所需参数的构造函数.
	 * 
	 * @param navTabId
	 *            .
	 * @param callbackType
	 *            .
	 * @param forwardUrl
	 *            .
	 * @param rel
	 *            .
	 * @param content
	 *            .
	 */
	public DwzResultBean(String navTabId, String callbackType, String forwardUrl, String rel, Object content) {
		this.navTabId = navTabId;
		this.callbackType = callbackType;
		this.forwardUrl = forwardUrl;
		this.rel = rel;
		this.content = content;
	}

	public DwzResultBean() {
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getNavTabId() {
		return navTabId;
	}

	public void setNavTabId(String navTabId) {
		this.navTabId = navTabId;
	}

	public String getDialogId() {
		return dialogId;
	}

	public void setDialogId(String dialogId) {
		this.dialogId = dialogId;
	}

	public String getCallbackType() {
		return callbackType;
	}

	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}

	public String getForwardUrl() {
		return forwardUrl;
	}

	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}

	public String getRel() {
		return rel;
	}

	public void setRel(String rel) {
		this.rel = rel;
	}

	public String getConfirmMsg() {
		return confirmMsg;
	}

	public void setConfirmMsg(String confirmMsg) {
		this.confirmMsg = confirmMsg;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}

}
