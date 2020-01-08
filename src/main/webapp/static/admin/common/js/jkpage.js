function jkpage(opction) {
	if (opction.element) {
		// 总页
		var pages = opction.pages ? parseInt(opction.pages) : 0;
		// 当前页
		var curr = opction.curr ? parseInt(opction.curr) : 0;
		// 总内容
		var total = opction.total ? parseInt(opction.total) : 0;
		var htmlStr = "<div class=\"dataTables_info\" id=\"data-table-list_info\" role=\"status\" aria-live=\"polite\"> 页数  " + curr + " / " + pages + " ，共" + total + " 条 &nbsp;&nbsp;&nbsp;</div>";
		
//		 + 
//			"<select name='numPerPage'>" +
//			"<option value='5'>5</option>" +
//			"<option value='10'>10</option></select>"  + "</div>"
		
		htmlStr += "<div class=\" dataTables_paginate paging_full_numbers\" id=\"data-table-list_paginate\">";
		if (curr != 1) {
			htmlStr += "<a class=\"paginate_button first disabled\" aria-controls=\"data-table-list\" data-dt-idx=\"1\" tabindex=\"0\" id=\"data-table-list_first\">首页</a>";
		}
		if (curr > 1) {
			htmlStr += "<a class=\"paginate_button previous disabled\" aria-controls=\"data-table-list\" data-dt-idx=\"" + (curr - 1) + "\" tabindex=\"0\" id=\"data-table-list_previous\">上一页</a>";
		}
		if (curr < pages) {
			htmlStr += "<a class=\"paginate_button previous disabled\" aria-controls=\"data-table-list\" data-dt-idx=\"" + (curr + 1) + "\" tabindex=\"0\" id=\"data-table-list_next\">下一页</a>";
		}
		if (curr != pages) {
			htmlStr += "<a class=\"paginate_button previous disabled\" aria-controls=\"data-table-list\" data-dt-idx=\"" + (pages) + "\" tabindex=\"0\" id=\"data-table-list_last\">末页</a>";
		}
		htmlStr += "</div>";
		$(opction.element).html(htmlStr);
		$(".paginate_button").click(function() {
			opction.jump($(this).data("dt-idx"));
		})
	}
}