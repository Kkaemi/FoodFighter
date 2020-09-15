package community.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CommunityBoardPaging {
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
			pagingHTML.append("<a id='paging' href = 'communityBoard?pg="+(startPage-1)+"' title = 'prev'><span><</span></a>");
		}
		for(int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("<a id = 'currentPaging' class = 'now' href = 'communityBoard?pg="+i+"' title = '"+i+"페이지'><span>"+i+"</span></a>");
			}else {
				pagingHTML.append("<a id = 'paging' href = 'communityBoard?pg="+i+"' title = '"+i+"페이지'>"+i+"</span></a>");
			}
		}//for
		
		if(endPage < totalP){
			pagingHTML.append("<a id = 'paging' href = 'communityBoard?pg="+(endPage+1)+"' title = 'next'><span>></span></a>");
		}
	}//makePagingHTML
	
	public void makeSearchPagingHTML(String bKeyword, String bSrchOption){
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage > pageBlock) {
			pagingHTML.append("<a id = 'paging' href = 'communityBoardSearch?pg="+(startPage-1)+"&bKeyword="+bKeyword+"&bSrchOption="+bSrchOption+"' title = 'prev'><span><</span></a>");
		}
		for(int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("<a id = 'currentPaging' class = 'now' href = 'communityBoardSearch?pg="+i+"&bKeyword="+bKeyword+"&bSrchOption="+bSrchOption+"' title = '"+i+"페이지'><span>"+i+"</span></a>");
			}else {
				pagingHTML.append("<a id = 'paging' href = 'communityBoardSearch?pg="+i+"&bKeyword="+bKeyword+"&bSrchOption="+bSrchOption+"' title = '"+i+"페이지'>"+i+"</span></a>");
			}
		}//for
		
		if(endPage < totalP) {
			pagingHTML.append("[<a id = 'paging' href = 'communityBoardSearch?pg="+(endPage+1)+"&bKeyword="+bKeyword+"&bSrchOption="+bSrchOption+"' title = 'next'><span>></span></a>");
		}
	}//makeSearchPagingHTML
	
	public void makeCmntPagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize; //총 페이지 수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		if(startPage > pageBlock){ // == currentPage > pageBlock
			pagingHTML.append("<a id='paging' onclick = 'cmntList("+(startPage-1)+")' title = 'prev'><span><</span></a>");
		}
		for(int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
				pagingHTML.append("<a id = 'currentPaging' class = 'now' onclick = 'cmntList("+i+")' title = '"+i+"페이지'><span>"+i+"</span></a>");
			}else {
				pagingHTML.append("<a id = 'paging' onclick = 'cmntList("+i+")' title = '"+i+"페이지'>"+i+"</span></a>");
			}
		}//for
		
		if(endPage < totalP){
			pagingHTML.append("<a id = 'paging' onclick = 'cmntList("+(endPage+1)+")' title = 'next'><span>></span></a>");
		}
	}//makeCmntPagingHTML
}
