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
<link rel="stylesheet" href="${resPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="${resPath}/css/process/documentBox.css">
<link rel="icon" href="${resPath}/image/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: "Noto Sans KR", sans-serif; overflow: hidden;
}
</style>
</head>
<body>
	<%@ include file="../board/boardElements/header.jsp"%>
	<%@ include file="../board/boardElements/sider.jsp"%>
	<div class="container-xl mb-5 mt-5">
		<h2 class="mb-4" style="color: #1E9CE3; font-weight: bold; font-size: 25px;">
			<i class="bi bi-stickies me-3"></i>게시글
		</h2>

		<div class="row">
			<div class="col-12 ">
				<div class="card card-margin" style="height: 60vh;">
					<div class="card-body shadow" style="height: 50vh;">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-2">
									<label for="author" class="form-label fw-bolder mt-2">작성자</label>
								</div>
								<div class="col">
									<input type="text" id="author" name="author" class="form-control" value="${article.author}" readonly disabled>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-2">
									<label for="title" class="form-label fw-bolder mt-2">제목</label>
								</div>
								<div class="col">
									<input type="text" id="title" name="title" class="form-control" value="${article.title}" readonly disabled>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="form-floating">
									<textarea class="form-control" style="height: 40vh" readonly disabled>${article.body}</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="card-footer bg-transparent border border-0">
				<div class="container" style="width: 30rem;">
					<div class="row">
						<%-- <div class="col-4">
							<button type="button" class="btn btn-secondary" onclick="location.href='${context}board/articles/${article.articleNo}/edit'">수정</button>
						</div> --%>
						<div class="col-4">
							<button type="button" class="btn btn-info text-white" onclick="location.href='${context}board/articles'">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>