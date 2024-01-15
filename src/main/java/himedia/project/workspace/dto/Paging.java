package himedia.project.workspace.dto;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * @author 김주원
 * @see 231223
 */
@Setter @Getter
public class Paging {
	private int pageNum;
	private int pagePer;
	private int skip;
	
	public Paging() {
		this(1, 10);
		this.skip =0;
	}

	public Paging(int pageNum, int pagePer) {
		this.pageNum = pageNum;
		this.pagePer = pagePer;
		this.skip = (pageNum-1)*pagePer;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip = (pageNum-1)*this.pagePer;
	}

	public int getPagePer() {
		return pagePer;
	}

	public void setPagePer(int pagePer) {
		this.pagePer = pagePer;
		this.skip = (this.pageNum-1)*pagePer;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
}
