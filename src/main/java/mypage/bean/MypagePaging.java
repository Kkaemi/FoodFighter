package mypage.bean;

import org.springframework.stereotype.Component;


import lombok.Data;

@Data
@Component
public class MypagePaging {
	private int currentPage; 
	private int pageBlock; 
	private int pageSize;
	private int totalA; 
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();

		int totalP = (totalA + pageSize - 1) / pageSize;// 총페이지수
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalP)  endPage = totalP;
		
		
		pagingHTML.append(" <ul class='pagination'>");
		if (startPage > pageBlock) {
			pagingHTML.append("<li class='page-item'><a href='javascript:void(0);' onclick='mypagePaging(" + (startPage - 1) + ") '><i class='fa fa-angle-double-left'></i></a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage) {
				pagingHTML.append("<li class='page-item  active'><a href='javascript:void(0);' onclick='mypagePaging(" + i + ") ' class='page-link'>" + i + "</a></li>");
			} else {
				pagingHTML.append("<li class='page-item'><a  href='javascript:void(0);' onclick='mypagePaging(" + i + ") ' class='page-link'>" + i + "</a></li>");
			}
		}

		if (endPage < totalP) {
			pagingHTML.append("<li class='page-item'><a href='javascript:void(0);' onclick='mypagePaging(" + (endPage + 1) + ")'><i  class='fa fa-angle-double-left'></i></a></li>");
		}
		pagingHTML.append("</ul>");

	}

}
