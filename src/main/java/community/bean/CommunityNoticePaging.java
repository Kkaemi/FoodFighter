package community.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CommunityNoticePaging {
	private int currentPage; //현재페이지
	private int pageBlock; //[이전][1][2][3][다음]
	private int pageSize; //1페이지당 10개씩
	private int totalA; //총 글 수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize; //총 페이지 수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage > pageBlock){ // == currentPage > pageBlock
			pagingHTML.append("<a id='paging' href = 'communityNotice?pg="+(startPage-1)+"' title = 'prev'><span><</span></a>");
		}
		for(int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("<a id = 'currentPaging' class = 'now' href = 'communityNotice?pg="+i+"' title = '"+i+"페이지'><span>"+i+"</span></a>");
			}else {
				pagingHTML.append("<a id = 'paging' href = 'communityNotice?pg="+i+"' title = '"+i+"페이지'>"+i+"</span></a>");
			}
		}//for
		
		if(endPage < totalP){
			pagingHTML.append("<a id = 'paging' href = 'communityNotice?pg="+(endPage+1)+"' title = 'next'><span>></span></a>");
		}
	}//makePagingHTML
	
	public void makeSearchPagingHTML(String nKeyword, String nSrchOption){
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage > pageBlock) {
			pagingHTML.append("<a id = 'paging' href = 'communityNoticeSearch?pg="+(startPage-1)+"&nKeyword="+nKeyword+"&nSrchOption="+nSrchOption+"' title = 'prev'><span><</span></a>");
		}
		for(int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("<a id = 'currentPaging' class = 'now' href = 'communityNoticeSearch?pg="+i+"&nKeyword="+nKeyword+"&nSrchOption="+nSrchOption+"' title = '"+i+"페이지'><span>"+i+"</span></a>");
			}else {
				pagingHTML.append("<a id = 'paging' href = 'communityNoticeSearch?pg="+i+"&nKeyword="+nKeyword+"&nSrchOption="+nSrchOption+"' title = '"+i+"페이지'>"+i+"</span></a>");
			}
		}//for
		
		if(endPage < totalP) {
			pagingHTML.append("[<a id = 'paging' href = 'communityNoticeSearch?pg="+(endPage+1)+"&nKeyword="+nKeyword+"&nSrchOption="+nSrchOption+"' title = 'next'><span>></span></a>");
		}
	}//makeSearchPagingHTML
}
/*
 * 1페이지당 2개씩
 * int totalP = (totalA+1)/2;
 * 
 * 1페이지당 5개씩
 * int totalP = (totalA+4)/5;
 * 
 * 1페이지 당 10개씩
 * int totalP = (totalA+9)/10;
 * */

