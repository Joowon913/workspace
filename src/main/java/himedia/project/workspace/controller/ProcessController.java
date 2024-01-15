package himedia.project.workspace.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import himedia.project.workspace.dto.Article;
import himedia.project.workspace.dto.Document;
import himedia.project.workspace.dto.Documents;
import himedia.project.workspace.dto.Member;
import himedia.project.workspace.dto.PageMarker;
import himedia.project.workspace.dto.Paging;
import himedia.project.workspace.service.ArticleService;
import himedia.project.workspace.service.DocumentService;
import himedia.project.workspace.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//public class ProcessController implements HandlerExceptionResolver {
public class ProcessController{

	private final DocumentService service;

	private final MemberService memberService;

	private ArticleService articleService;

	public ProcessController(DocumentService service, MemberService memberService, ArticleService articleService) {
		this.service = service;
		this.memberService = memberService;
		this.articleService = articleService;
	}

	/**
	 * @author 김주원
	 * @see 231222
	 */
	// 결재함
	@GetMapping("/process/documents")
	public String documents(Paging page, HttpSession session, Model model) {

		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		// 유저에 따른 내 결재함 조회
		Long empNum = (Long) session.getAttribute("empNo");

		List<Documents> result = service.findMyDoc(empNum, page);
		model.addAttribute("documents", result);

		// 목록 페이징 하는 코드
		int total = service.getTotal((Long) session.getAttribute("empNo"));
		PageMarker pageMaker = new PageMarker(page, total);
		model.addAttribute("pageMaker", pageMaker);

		return "process/documentBox";
	}

	/**
	 * @author 김주원
	 * @see 231221
	 */
	// 결재 완료함
	@GetMapping("/process/documents/complete")
	public String documentsComplete(Paging page, HttpSession session, Model model) {

		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Long empNo = (Long) session.getAttribute("empNo");
		List<Documents> result = service.findByComplete(empNo, page);
		model.addAttribute("documents", result);

		// 목록 페이징 하는 코드
		int total = service.getCompleteTotal(empNo);
		PageMarker pageMaker = new PageMarker(page, total);
		model.addAttribute("pageMaker", pageMaker);

		return "process/documentBox";
	}

	/**
	 * @author 김주원
	 * @see 231221
	 */
	// 결재 반려함
	@GetMapping("/process/documents/return")
	public String documentsReturn(Paging page, HttpSession session, Model model) {

		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Long empNo = (Long) session.getAttribute("empNo");
		List<Documents> result = service.findByReturn(empNo, page);
		model.addAttribute("documents", result);

		// 목록 페이징 하는 코드
		int total = service.getReturnTotal(empNo);
		PageMarker pageMaker = new PageMarker(page, total);
		model.addAttribute("pageMaker", pageMaker);

		return "process/documentBox";
	}

	/**
	 * @author 김주원
	 * @see 231221
	 */
	// 결재 진행함
	@GetMapping("/process/documents/progress")
	public String documentsProgress(Paging page, HttpSession session, Model model) {

		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Long empNo = (Long) session.getAttribute("empNo");
		List<Documents> result = service.findByProgress(empNo, page);
		model.addAttribute("documents", result);

		// 목록 페이징 하는 코드
		int total = service.getProgressTotal(empNo);
		PageMarker pageMaker = new PageMarker(page, total);
		model.addAttribute("pageMaker", pageMaker);

		return "process/documentBox";
	}

	/**
	 * @author 김주원
	 * @see 231223
	 */
	// 검색
	@GetMapping("/process/documents/search")
	public String search(String search, String searchType, Paging page, HttpSession session, Model model) {

		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		if (search.equals("")) {
			search = null;
		}

		// 검색창 메뉴 선택
		if (searchType.equals("board")) {
			log.info("param : " + searchType.equals("board"));
			List<Article> articles = articleService.findTitleAndBody(search);
			model.addAttribute("articles", articles);
			return "board/articles";
		} else {
			List<Documents> result = service.search(search, page);
			model.addAttribute("documents", result);

			// 목록 페이징 하는 코드
			int total = service.getSearchTotal(search);
			PageMarker pageMaker = new PageMarker(page, total);
			model.addAttribute("pageMaker", pageMaker);
		}
		model.addAttribute("search", search);
		return "process/documentBox";
	}

	/**
	 * @author 김주원
	 * @see 231220
	 */
	// 문서 조회
	@GetMapping("/process/documents/{docNo}")
	public String document(@PathVariable Long docNo, HttpSession session, Model model) {
		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Document result = service.getDocumentDetail(docNo);
		model.addAttribute("document", result);
		
		// session에서 받은 문서반려자 정보를 view로 전달
		String personReturned = (String)session.getAttribute("personReturned");
		model.addAttribute("personReturned", personReturned);
		
		// session에서 받은 반려된 시간 정보를 view로 전달
		String timeDocReturned = (String)session.getAttribute("timeDocReturned");
		model.addAttribute("timeDocReturned", timeDocReturned);
		return "process/document";
	}

	/**
	 * @author 김주원
	 * @see 231227
	 */
	// 첨부파일 다운로드
	@GetMapping(value = "/process/documents/{docNo}/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestParam String file) {
		Resource resource = new FileSystemResource("c:\\upload\\" + file);

		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();
		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		HttpHeaders headers = new HttpHeaders();

		try {
			// chrome encode
			headers.add("Content-Disposition",
					"attachment; filename=" + new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	/**
	 * @author 김주원
	 * @see 231222
	 */
	// 기안 작성창
	@GetMapping("/process/documents/write-form")
	public String writeForm(Model model) {
		List<Member> members = memberService.getMemberList();
		model.addAttribute("members", members);
		return "process/writeForm";
	}

	// 문서 저장
	@PostMapping("/process/documents/write-form")
	public String save(Documents doc, HttpSession session, @RequestParam("file") MultipartFile multipartFile,
			Model model) throws IllegalStateException, IOException {

		if (!multipartFile.isEmpty()) {
			// 파일 저장 경로
			String path = "C:\\upload\\";

			// 원본 파일 이름
			String originalFileName = multipartFile.getOriginalFilename();
			// 서버에 저장할 이름
			UUID uuid = UUID.randomUUID();
			String savedFileName = uuid + "_" + originalFileName;
			// 파일 생성
			File file = new File(path + savedFileName);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 서버로 전송
			multipartFile.transferTo(file);

			doc.setAttachedFileName(originalFileName);
			doc.setAttachedFile(savedFileName);
		}

		// session에서 사번 가져오는 코드 추가, status/line 최초등록 기본값 부여
		doc.setEmpNo((Long) session.getAttribute("empNo"));
		doc.setStatus("progress");
		doc.setLine(1);
		service.save(doc);
		model.addAttribute("document", doc);
		return "redirect:/process/documents/" + doc.getDocNo();
	}

	/**
	 * @author 김주원
	 * @since 231227
	 */
//	@Override
//	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
//			Exception ex) {
//		ModelAndView mv = new ModelAndView("404Error");
//
//		if (ex instanceof MaxUploadSizeExceededException) {
//			List<Member> members = memberService.getMemberList();
//			mv.addObject("members", members);
//			mv.getModel().put("message", "첨부파일 용량은 5MB를 넘길 수 없습니다!");
//
//			if (request.getRequestURI().equals("/workspace/process/documents/write-form")) {
//				mv.setViewName("process/writeForm");
//			} else {
//				String[] uri = request.getRequestURI().split("/");
//				mv.addObject("uri", "redirect:/process/documents/" + uri[4] + "/edit");
//				mv.setViewName("process/processElements/alert");
//			}
//		}
//		return mv;
//	}

	/**
	 * @author 김주원
	 * @see 작성완료 231224
	 */
	// 결재 승인 버튼
	@GetMapping("process/documents/{docNo}/complete")
	public String approve(@PathVariable Long docNo, HttpSession session) {
		Document result = service.getDocumentDetail(docNo);

		// session에 로그인 empNo와 승인자 empNo 일치여부 비교
		Long sessionEmpNo = (Long) session.getAttribute("empNo");
		switch (result.getLine()) {
		case 1:
			// 1차 승인자
			if (result.getFirstApproverNo() == sessionEmpNo.intValue()) {
				service.updateLine(docNo, 2);
			}
			break;
		case 2:
			// 2차 승인자
			if (result.getSecondApproverNo() == sessionEmpNo.intValue()) {
				service.updateLine(docNo, 3);
			}
			break;
		case 3:
			// 3차 승인자
			if (result.getThirdApproverNo() == sessionEmpNo.intValue()) {
				service.updateLine(docNo, 4);
				service.updateStatus(docNo, "complete");
			}
			break;
		}
		return "redirect:/process/documents/" + docNo;
	}

	/**
	 * @author 김주원
	 * @see 231222
	 */
	// 수정 페이지
	@GetMapping("/process/documents/{docNo}/edit")
	public String editForm(@PathVariable Long docNo, Model model) {
		List<Member> members = memberService.getMemberList();
		model.addAttribute("members", members);
		Document doc = service.getDocumentDetail(docNo);
		model.addAttribute("edit", "editingNow"); // 12.29 노윤건
		model.addAttribute("document", doc);
		return "process/editForm";
	}

	/**
	 * @author 김주원
	 * @see 231225
	 */
	// 문서 수정 완료 버튼
	@PostMapping("/process/documents/{docNo}/edit")
	public String edit(@PathVariable Long docNo, Documents doc, @RequestParam("file") MultipartFile multipartFile)
			throws IllegalStateException, IOException {

		log.info("value >>> " + doc.getOriginAttachedFileUseYn());

		// 신규파일 업로드
		if (!multipartFile.isEmpty()) {
			// 파일 저장 경로
			String path = "C:\\upload\\";

			// 원본 파일 이름
			String originalFileName = multipartFile.getOriginalFilename();
			// 서버에 저장할 이름
			UUID uuid = UUID.randomUUID();
			String savedFileName = uuid + "_" + originalFileName;
			// 파일 생성
			File file = new File(path + savedFileName);
			if (!file.exists()) {
				file.mkdirs();
			}
			// 서버로 전송
			multipartFile.transferTo(file);

			doc.setAttachedFileName(originalFileName);
			doc.setAttachedFile(savedFileName);

			// 기존 파일이 있었던 경우 기존 파일 삭제
			String defaultAttachedFile = service.getDocumentDetail(docNo).getAttachedFile();
			if (defaultAttachedFile != null) {
				Path filePath = Paths.get("C:\\upload\\" + defaultAttachedFile);
				try {
					// 파일 삭제
					Files.delete(filePath);
				} catch (NoSuchFileException e) {
					log.info("삭제하려는 파일/디렉토리가 없습니다");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			// 신규파일 업로드가 없는 경우
			if (doc.getOriginAttachedFileUseYn().equals("y")) {
				// 기존 파일 유지
				String defaultAttachedFile = service.getDocumentDetail(docNo).getAttachedFile();
				String defaultAttachedFileName = service.getDocumentDetail(docNo).getAttachedFileName();
				doc.setAttachedFile(defaultAttachedFile);
				doc.setAttachedFileName(defaultAttachedFileName);
			} else {
				// 기존 파일 삭제
				doc.setAttachedFile(null);
				doc.setAttachedFileName(null);

				// 파일 저장 경로에 업데이트 된 실제 파일 삭제
				String defaultAttachedFile = service.getDocumentDetail(docNo).getAttachedFile();
				Path filePath = Paths.get("C:\\upload\\" + defaultAttachedFile);
				try {
					// 파일 삭제
					Files.delete(filePath);
				} catch (NoSuchFileException e) {
					log.info("삭제하려는 파일/디렉토리가 없습니다");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		service.editForm(doc.getDocNo(), doc);
		return "redirect:/process/documents/{docNo}";
	}

	/**
	 * @author 김주원
	 * @see 231225
	 */
	// 반려 버튼 클릭
	@PostMapping("/process/documents/{docNo}/return")
	public String returnDocument(@PathVariable Long docNo, HttpSession session, String returnComment) {
		Long returnEmpNo = (Long) session.getAttribute("empNo");
		service.returnDocument(docNo, returnEmpNo, returnComment);
		return "redirect:/process/documents/return";
	}

	/**
	 * 
	 * @author 김주원
	 * @see 231226
	 */
	// 휴지통 페이지
	@GetMapping("/trashcan")
	public String trashcan(Paging page, HttpSession session, Model model) {

		// session에 값이 있는지 체크하여 로그인 여부 확인
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Long empNo = (Long) session.getAttribute("empNo");
		List<Documents> result = service.findByDelete(empNo, page);
		model.addAttribute("documents", result);

		// 목록 페이징 하는 코드
		int total = service.getDeleteTotal(empNo);
		PageMarker pageMaker = new PageMarker(page, total);
		model.addAttribute("pageMaker", pageMaker);
		return "process/documentBox";
	}

	/**
	 * @author 김주원
	 * @see 231226
	 */
	// 휴지통으로 이동 버튼
	@GetMapping("/process/documents/{docNo}/trashcan")
	public String updateDeleteStatus(@PathVariable Long docNo, HttpSession session) {
		// 작성자와 로그인 계정 같은경우 useYn 업데이트 쿼리 수행
		Document detail = service.getDocumentDetail(docNo);
		if (detail.getEmpNo() == session.getAttribute("empNo")) {
			service.updateUseYn(docNo, "n");
		}
		return "redirect:/trashcan";
	}

	/**
	 * @author 김주원
	 * @see 231226
	 */
	// 삭제
	@GetMapping("/process/documents/{docNo}/delete")
	public String deleteDocument(@PathVariable Long docNo, HttpSession session) {
		// 작성자와 로그인 계정 같은 경우 삭제 쿼리 수행
		Document detail = service.getDocumentDetail(docNo);
		if (detail.getEmpNo() == session.getAttribute("empNo")) {
			service.deleteDocument(docNo);
		}
		return "redirect:/trashcan";
	}

	/**
	 * @author 김주원
	 * @see 231226
	 */
	// 복원
	@GetMapping("/process/documents/{docNo}/restore")
	public String restoreDocument(@PathVariable Long docNo, HttpSession session) {
		// 작성자와 로그인 계정 같은 경우 useYn 업데이트 쿼리 수행
		Document detail = service.getDocumentDetail(docNo);
		if (detail.getEmpNo() == session.getAttribute("empNo")) {
			service.updateUseYn(docNo, "y");
		}
		return "redirect:/process/documents";
	}
}
