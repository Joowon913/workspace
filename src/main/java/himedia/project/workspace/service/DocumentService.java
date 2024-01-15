package himedia.project.workspace.service;

import java.util.List;

import org.springframework.stereotype.Service;

import himedia.project.workspace.dto.Document;
import himedia.project.workspace.dto.Documents;
import himedia.project.workspace.dto.Paging;
import himedia.project.workspace.mapper.ProcessMapper;

@Service
public class DocumentService {
	
	private final ProcessMapper mapper;
	
	public DocumentService(ProcessMapper mapper) {
		this.mapper = mapper;
	}
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231223
	 */
	public List<Documents> findByProgress(Long empNo, Paging page) {
		return mapper.findByProgress(empNo, page);
	};
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231230
	 */
	public List<Documents> findByComplete(Long empNo, Paging page) {
		return mapper.findByComplete(empNo, page);
	};
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231229
	 */
	public List<Documents> findByReturn(Long empNo, Paging page) {
		return mapper.findByReturn(empNo, page);
	};
	
	/**
	 * @author 김주원
	 * @see 작성완료 231224
	 */
	public List<Documents> findByDelete(Long empNo, Paging page) {
		return mapper.findByDelete(empNo, page);
	};
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231223
	 */
	public List<Documents> search(String search, Paging page) {
		return mapper.search(search, page);
	}
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231223
	 */
	public List<Documents> findMyDoc(Long empNum, Paging page) {
		return mapper.findMyDoc(empNum, page);
	}
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231223
	 */
	public int getTotal(Long empNo) {
		return mapper.getTotal(empNo);
	}
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231230
	 */
	public int getCompleteTotal(Long empNo) {
		return mapper.getCompleteTotal(empNo);
	}

	/**
	 * @author 한혜림
	 * @see 작성완료 231230
	 */
	public int getProgressTotal(Long empNo) {
		return mapper.getProgressTotal(empNo);
	}

	/**
	 * @author 한혜림
	 * @see 작성완료 231230
	 */
	public int getReturnTotal(Long empNo) {
		return mapper.getReturnTotal(empNo);
	}
	/**
	 * @author 김주원
	 * @see 작성완료 231224
	 */
	public int getDeleteTotal(Long empNo) {
		return mapper.getDeleteTotal(empNo);
	}
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231223
	 */
	// 231221 8:04PM 추가
	public int getSearchTotal(String search) {
		return mapper.getSearchTotal(search);
	}
	
	/**
	 * @author 한혜림
	 * @see 작성완료 231221
	 */
	public void save(Documents doc) {
		mapper.save(doc);
	}
	
	/**
	 * @author 김주원
	 * @see 작성완료 231221
	 */
	public int editForm(Long docId, Documents doc) {
		return mapper.editForm(docId, doc);
	}
	
	/**
	 * @author 김주원
	 * @see 작성완료 231222
	 */
	public Document getDocumentDetail(Long docNo) {
		return mapper.getDocumentDetail(docNo);
	}
	
	/**
	 * @author 노윤건
	 * @see 작성완료 231225
	 */
	public int returnDocument(Long docNo, Long returnEmpNo, String returnComment) {
		return mapper.returnDocument(docNo, returnEmpNo, returnComment);
	}
	
	/**
	 * @author 김주원
	 * @see 작성완료 231224
	 */
	// TODO:: 231224 추가
	public int updateLine(Long docNo, int line) {
		return mapper.updateLine(docNo, line);
	}
	
	/**
	 * @author 김주원
	 * @see 작성완료 231225
	 */
	// TODO:: 231225 추가
	public int updateStatus(Long docNo, String status) {
		return mapper.updateStatus(docNo, status);
	}
	
	/**
	 * @author 김주원
	 * @see 작성완료 231226
	 */
	// TODO:: 231226 추가
	public int updateUseYn(Long docNo, String useYn) {
		return mapper.updateUseYn(docNo, useYn);
	}
	
	/**
	 * @author 김주원
	 * @see 작성완료 231225
	 */
	// TODO:: 231225 추가
	public int deleteDocument(Long docNo) {
		return mapper.deleteDocument(docNo);
	}
	
}
