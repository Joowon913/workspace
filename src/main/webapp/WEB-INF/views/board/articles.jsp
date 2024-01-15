<%@page import="java.util.ArrayList"%>
<%@ page import="himedia.project.workspace.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${resPath}/css/board/slidingEffect.css">
<link rel="stylesheet" href="${resPath}/css/reset.css">
<link rel="stylesheet" href="${resPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="${resPath}/css/process/documentBox.css">
<link rel="icon" href="${resPath}/image/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
		var currentPath = currentUrlObject.pathname + currentUrlObject.search;

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
<%
ArrayList<Article> articles = (ArrayList<Article>) request.getAttribute("articles");
%>
</head>
<body>
	<%@ include file="../board/boardElements/header.jsp"%>
	<%@ include file="../board/boardElements/sider.jsp"%>
	<div class="container-xl mb-5 mt-5">
		<h2 class="mb-4" style="color: #1E9CE3; font-weight: bold; font-size: 25px;">
			<i class="bi bi-stickies me-3"></i>게시글 목록
		</h2>
		<div class="row">
			<div class="col-12 ">
				<div class="card card-margin" style="height: 60vh;">
					<div class="card-body shadow overflow-y-auto" style="height: 60vh;">
						<div class="stretched">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col" colspan="2" class="col-3">작성자</th>
											<th scope="col" class="text-start">제목</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (int i = articles.size() - 1; i >= 0; i--) {
										%>
										<tr>
											<%-- <td><a href=""> <img class="" src="${resPath}/image/<%=articles.get(i).getAuthor()%>.png" width="30px" height="30px" alt="icon">
											</a></td>
											<td><a href="" class="ps-3"><%=articles.get(i).getAuthor()%></a></td> --%>
											<td>
												<img class="" src="${resPath}/image/<%=articles.get(i).getAuthor()%>.png" width="30px" height="30px" alt="icon">
												<a href="" class="ps-3"><%=articles.get(i).getAuthor()%></a>
											</td>
											<td></td>
											<td class="text-start">
												<a class="anchor title" href=""><%=articles.get(i).getTitle()%></a>
											</td>
											<td class="body visually-hidden">
												<textarea id="textarea" readonly disabled><%=articles.get(i).getBody()%></textarea>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<div class="detail-hidden d-flex align-items-start flex-column mt-3 ps-3 overflow-y-auto" id="slide" style="height: 50vh;">
							<div class="" id="title"></div>
							<hr class="bg-black w-100">
							<div class="" id="body"></div>
							<button type="button" id="close" class="mt-auto btn btn-info text-white mx-auto">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="card-footer bg-transparent border border-0">
				<div class="container" style="width: 30rem;">
					<div class="row">
						<div class="col-8">
							<form action="${context}board/articles/search" class="col-8 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
								<div class="row">
									<input type="search" name="search" class="col me-2 form-control form-control-dark" placeholder="" aria-label="Search">
									<button type="submit" class="col-4 btn btn-info text-white" onclick="location.href='${context}board/articles'">검색</button>
								</div>
							</form>
						</div>
						<div class="col">
							<button type="button" class="btn btn-secondary" onClick="location.href='${context}board/articles/add'">글쓰기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${resPath}/js/board/slidingEffect.js"></script>
</body>
</html>