<%@ page import="himedia.project.workspace.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
	<div class="card border border-0 mb-3 p-5" style="width: 60vw;">
		<div class="card-header bg-transparent border border-0">
			<h2 class="mb-4" style="color: #1E9CE3; font-weight: bold; font-size: 25px;">
				<i class="bi bi-pencil me-3"></i>글 쓰기
			</h2>
		</div>
		<div class="card-body">
			<form:form modelAttribute="article">
				<div class="card border text-success" style="height: 35rem;">
					<div class="card-body">
						<div class="row mb-2">
							<div class="col-2">
								<label for="title" class="form-label fw-bolder mt-2">제목</label>
							</div>
							<div class="col">
								<form:input path="title" cssClass="form-control" />
								<form:errors path="title" />
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="form-floating">
								<form:textarea path="body" cssClass="form-control" style="height: 25rem" />
								<form:errors path="body" />
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer bg-transparent border border-0">
					<div class="row">
						<div class="row">
							<div class="col-2">
								<button type="button" class="btn btn-secondary" onclick="location.href='/workspace/board/articles'">취소</button>
							</div>
							<div class="col-2">
								<button type="submit" class="btn btn-info text-white">등록</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
