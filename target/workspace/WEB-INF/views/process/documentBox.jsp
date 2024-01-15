<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Work Space</title>
<link rel="stylesheet" href="${resPath}/css/reset.css">
<link rel="stylesheet" href="${resPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="${resPath}/css/process/documentBox.css">
<link rel="icon" href="${resPath}/image/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
body {
	font-family: "Noto Sans KR", sans-serif;
	overflow: hidden;
}

a {
	text-decoration: none;
}

a:hover {
	font-weight: bold;
	color: #1E9CE3;
}
.selected {
	font-weight: bold;
	color: #1E9CE3 !important;
	background-color: #e9ecef;
}
</style>
<script>
  // navigation 활성화 함수 실행
  $(document).ready(function() {
    // 현재 주소값 
    var currentURL = window.location.href;
    
    // URL 객체 생성
    var currentUrlObject = new URL(currentURL);

    // 현재 경로 + 쿼리 문자열 추출
    var currentPath = currentUrlObject.pathname;

    // navigation for문 수행
    $('.nav-link').each(function() {
      var menuLink = $(this).attr('href');
      
      // navigation href의 주소와 현재 url 일치 시 클래스 추가 
      if (currentPath == menuLink) {
        $(this).addClass('selected');
      }
    });
  });
</script>
</head>

<body>
	<%@ include file="processElements/header.jsp"%>
	<%@ include file="processElements/sider.jsp"%>

	<div class="container-xl mb-5 mt-5">
		<h2 class="mb-4" style="color: #1E9CE3; font-weight: bold; font-size: 25px;">
			<c:choose>
				<c:when test='${path eq "/process/documents/progress"}'>
					<i class="bi bi-people me-3"></i>진행 결재함
				</c:when>
				<c:when test='${path eq "/process/documents/return"}'>
					<i class="bi bi-envelope-slash me-3"></i>반려 결재함
				</c:when>
				<c:when test='${path eq "/process/documents/complete"}'>
					<i class="bi bi-briefcase me-3"></i>완료 결재함
				</c:when>
				<c:when test='${path eq "/process/documents/search"}'>
					<i class="bi bi-archive me-3"></i>검색 결과
				</c:when>
				<c:when test='${path eq "/trashcan"}'>
					<i class="bi bi-trash3 me-3"></i>휴지통
				</c:when>
				<c:otherwise>
					<i class="bi bi-archive me-3"></i>내 결재함
				</c:otherwise>
			</c:choose>
		</h2>

		<div class="row">
			<div class="col-12">
				<div class="card card-margin">
					<div class="card-body shadow">
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="width: 10%;">문서 번호</th>
									<th style="width: 40%;">결재 목록</th>
									<th style="width: 20%;">작성자</th>
									<th style="width: 20%;">진행 상황</th>
									<th style="width: 10%;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="document" items="${documents}">
									<tr>
										<td>${document.docNo}</td>
										<td><a href="${context}process/documents/${document.docNo}"> ${document.title} </a></td>
										<td class="d-flex justify-content-center align-items-center">
											<div class="emp-img">
												<img src="${resPath}${document.icon}" alt="emp-img" class="icon-img">
											</div>
											<div class="job-title ms-2 dropdown">
												<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
													${document.name}<span>${document.position}</span>
												</a>
												<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
													<li><a class="dropdown-item" href="#">사번 : ${document.empNo}</a></li>
													<li><a class="dropdown-item" href="#">부서 : ${document.department}</a></li>
													<li><a class="dropdown-item" href="#">내선번호 : ${document.phone}</a></li>
													<li><a class="dropdown-item" href="#">이메일 : ${document.email}</a></li>
												</ul>
											</div>
										</td>
										<td>
											<c:choose>
												<c:when test='${document.status.equals("progress")}'>
													<div class="badge rounded-pill bg-soft-warning">
														<span style="color: #fd7e14; background-color: #fff4e1;">결재 진행중</span>
													</div>
												</c:when>
												<c:when test='${document.status.equals("return")}'>
													<div class="badge rounded-pill bg-soft-danger" style="background-color: #fedce0;">
														<span style="color: #dc3545 !important">결재 반려</span>
													</div>
												</c:when>
												<c:when test='${document.status.equals("complete")}'>
													<div class="badge rounded-pill bg-soft-success">
														<span style="color: #198754;">결재 완료</span>
													</div>
												</c:when>
												<c:when test='${document.status.equals("delete")}'>
													<div class="badge rounded-pill bg-soft-danger">
														<span style="color: #dc3545 !important">삭제 예정</span>
													</div>
												</c:when>
											</c:choose>
										</td>
										<td>${document.insertDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<c:choose>
							<c:when test='${path eq "/process/documents/search"}'>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link" href="/workspace${path}?searchType=document&search=${search}&pageNum=${pageMaker.startPage-1 == 0 ? 1 : pageMaker.startPage-1}" aria-label="Previous"> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
											<li class="page-item"><a class="page-link" href="/workspace${path}?searchType=document&search=${search}&pageNum=${num}">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="page-item"><a class="page-link" href="/workspace${path}?searchType=document&search=${search}&pageNum=${pageMaker.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</c:when>
							<c:otherwise>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link" href="/workspace${path}?pageNum=${pageMaker.startPage-1 == 0 ? 1 : pageMaker.startPage-1}" aria-label="Previous"> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
											<li class="page-item"><a class="page-link" href="/workspace${path}?pageNum=${num}">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="page-item"><a class="page-link" href="/workspace${path}?pageNum=${pageMaker.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 231223 툴팁용 JS 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>

</html>