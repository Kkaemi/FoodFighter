package community.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component // 객체 생성 (다른 곳에서도 써야하니까) >> 어노테이션 선언 : root-context 안에도 알려줌
public class QnaBoardPaging {
	private int currentPage; // 현재 페이지 
	private int pageBlock; // [이전][1][2][3][다음]
	private int pageSize; // 1페이지당 5개씩
	private int totalA; // 총 글수 
	private StringBuffer pagingHTML; 
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA + pageSize-1) / pageSize;// 총 페이지 수 (한 페이지당 글 5개)
		
		int startPage = (currentPage -1)/pageBlock*pageBlock +1;
		int endPage = startPage +  pageBlock -1;
		if(endPage > totalA) endPage = totalP;
		/*
		// 1 페이지당 5개씩
		int totalA = (totalA + 4)/5;
		// 한페이지당 10개씩
		int totalA = (totalA + 9)/10;
		*/
		
		if (endPage > totalP)
			endPage = totalP; // endpage=9 이고 totalP=8일때 처리하기위한 공식

		if (startPage > pageBlock) {
			pagingHTML.append("<a href='#'><span id='paging' onclick='boardPaging(" + (startPage - 1) + ")'><</span></a>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage) {
				pagingHTML.append("<a href='javascript:void(0);' onclick='boardPaging(" + i + ")' class='now'><span id='currentPaging'>" + i + "</span></a>");
			} else {
				pagingHTML.append("<a href='javascript:void(0);' onclick='boardPaging(" + i + ")'><span id='paging' onclick='boardPaging(" + i + ")'>" + i + "</span></a>");
			}
		}

		if (endPage < totalP) {
			pagingHTML.append("<a href='#'><span id='paging' onclick='boardPaging(" + (endPage + 1) + ")'>></span></a>");
		}
	}
}