// 提取URL中参数为对象
function parseQueryString(url) {
	var str = url.split('?')[1];
	var result = {};
	var temp = (str || '').split('&');
	for (var i = 0; i < temp.length; i++) {
		var temp2 = (temp[i] || '').split('=');
		result[temp2[0]] = temp2[1];
	}
	return result;
}

function getFormUrl(formObj) {
	var action = formObj.attr("action");
	var array = formObj.serializeArray();
	if (action.lastIndexOf("?") == -1 || action.lastIndexOf("?") != action.length - 1) {
		action += "?";
	}
	$(array).each(function(i, v) {
		action += v.name + "=" + v.value + "&";
	});
	if (action.lastIndexOf("&") >= 0) {
		return action.substr(0, action.length - 1);
	} else {
		return action;
	}
}
function commonreuslt(data) {
	if (data.statusCode == "200") {
		layer.msg(data.message, {
			icon : 1,
			time : 1000
		}, function() {
			var index = parent.layer.getFrameIndex(window.name);
			if (index > 0) {
				// parent.location.reload();
				parent.location.replace(parent.location.href)
				parent.layer.close(index);
			} else {
				location.replace(location.href)
				// location.reload();
			}
		});
	} else if (data.statusCode == "300") {
		layer.msg(data.message, {
			icon : 2,
			time : 1000
		});
	} else{
		location.href = "../../admin/system/index.do?method=toError";
	}

}

$(function() {
	// 单选框
	$('.skin-minimal input').iCheck({
		checkboxClass : 'icheckbox-blue',
		radioClass : 'iradio-blue',
		increaseArea : '20%'
	});
	$('.switch')['bootstrapSwitch']();
	/* 全选 */
	$("table thead th input:checkbox").on("click", function() {
		$(this).closest("table").find("tr > td:first-child input:checkbox").prop("checked", $("table thead th input:checkbox").prop("checked"));
	});

	/* 上传 */
	$(document).on("change", ".input-file", function() {
		var uploadVal = $(this).val();
		$(this).parent().find(".upload-url").val(uploadVal).focus().blur();
	});

});