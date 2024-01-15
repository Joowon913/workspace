package himedia.project.workspace.dto;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 김주원
 * @see 231223
 */
@Setter @Getter
public class PageMarker {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private Paging page;
	
	public PageMarker(Paging page, int total) {
		this.page = page;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(page.getPageNum()/3.0))*3;
		this.startPage = this.endPage - 2;
		
		int realEnd = (int)(Math.ceil(total * 1.0/page.getPagePer()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 0;
		this.next = this.endPage < realEnd;
	}
}
