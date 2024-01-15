<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
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
<link rel="stylesheet" href="${resPath}/css/process/step.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
	function confirmAndTrash(apiEndpoint) {
		// 사용자에게 확인을 받음
		var isConfirmed = confirm("휴지통으로 이동 하시겠습니까?");

		// 확인이면 페이지 이동
		if (isConfirmed) {
			// 새로운 URL로 이동
			window.location.href = apiEndpoint;
		}
	}

	function confirmAndDelete(apiEndpoint) {
		// 사용자에게 확인을 받음
		var isConfirmed = confirm("삭제 하시겠습니까?");

		// 확인이면 페이지 이동
		if (isConfirmed) {
			// 새로운 URL로 이동
			window.location.href = apiEndpoint;
		}
	}

	function confirmAndRestore(apiEndpoint) {
		// 사용자에게 확인을 받음
		var isConfirmed = confirm("복원 하시겠습니까?");

		// 확인이면 페이지 이동
		if (isConfirmed) {
			// 새로운 URL로 이동
			window.location.href = apiEndpoint;
		}
	}
</script>
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
	overflow: visible;
}

.write {
	width: 700px;
	height: 300px;
}

table, tr, td {
	border: 1px solid black;
	margin: 15px auto auto auto;
}

.wide {
	width: 250px;
}

.blank {
	height: 30px;
}

.fixed {
	pointer-events: none;
	user-select: none;
	readonly;
	disabled;
}

.documentBody span {
	display: flex;
	margin-left: 200px;
	margin-top: 20px;
	font-weight: bolder;
}

.documentBody textarea {
	width: 700px;
	margin-top: 10px;
	min-height: 60px;
	max-height: 100px;
}

</style>
<!-- TODO:: 231221 본문 스타일 적용 -->
</head>
<body>
	<%@ include file="processElements/header.jsp"%>
	<%@ include file="processElements/sider.jsp"%>
	<div class="container-xl mb-5 mt-5">
		<div class="row">
			<div class="col-12">
				<div class="card card-margin">
				<form action="${context}process/documents/${docNo}/return" method="post">
					<div class="card-body shadow">
						<section class="step-wizard">
							<ul class="step-wizard-list">
								<li class="step-wizard-item"><span class="progress-count"></span> <span class="progress-label">${document.name}</span></li>
								<li class="step-wizard-item ${document.line ge 2 ? '' : 'current-item'}"><span class="progress-count"></span> <span class="progress-label">${document.firstApproverName}</span></li>
								<li class="step-wizard-item ${document.line ge 3 ? '' : 'current-item'}"><span class="progress-count"></span> <span class="progress-label">${document.secondApproverName}</span></li>
								<li class="step-wizard-item ${document.line ge 4 ? '' : 'current-item'}"><span class="progress-count"></span> <span class="progress-label">${document.thirdApproverName}</span></li>
							</ul>
						</section>
						<div class="mx-auto">
							<div class="mb-3 d-flex justify-content-center">
								<label for="id" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-8">
									<input class="form-control bg-gray" name="id" type="text" value="${document.title}" disabled>
								</div>
							</div>
							<div class="mb-2 d-flex justify-content-center">
								<div class="col-sm-2 col-form-label">첨부파일</div>
								<div class="col-sm-8" style="border: 1px solid #dee2e6; background-color: #e9ecef; border-radius: 5px; color: #212529; font-weight: 400; text-align: left; padding: 6px 12px;">
									<a id="file" href="${context}process/documents/${document.docNo}/download?file=${document.attachedFile}"> ${document.attachedFileName} </a>
								</div>
							</div>
							<div class="mb-3 d-flex justify-content-center">
								<label for="id" class="col-sm-2 col-form-label">작성일</label>
								<div class="col-sm-8" style="font-weight: 400; text-align: left; padding: 6px 12px;">
									${document.insertDate}
								</div>
							</div>
						</div>
						<hr>
						<div class="mb-3 px-5 py-3 border documentBody">${document.body}</div>
						<c:if test="${document.returnComment != null}">
							<div class="d-flex align-items-center">
								<div style="padding: 5px; margin-right: 5px; border: 1px solid #eee; background-color: #eee; border-radius: 5px; width: 10%; text-align: center; font-weight: bold;">반려의견</div>
								<div class="mx-1">${document.returnEmpName}</div>
								<div>${document.returnDate}</div>
							</div>
							<div class="mb-5 mt-2 px-5 py-3 border documentBody">
								<div class="text-start">${document.returnComment}</div>
							</div>
						</c:if>
						<div class="d-flex justify-content-evenly gap-5">
							<!-- TODO:: 231224 결재 승인 버튼 구현 -->
							<c:if test="${document.useYn == 'y'}">
								<c:choose>
									<c:when test="${document.line eq 1}">
										<c:if test="${sessionScope.empNo == document.firstApproverNo && document.status != 'return'}">
											<button type="button" class="btn btn-lg btn-primary px-5 btn-lg documentButton" onclick="location.href='${context}process/documents/${document.docNo}/complete'">결재승인</button>
											<button type="submit" class="btn btn-lg btn-primary px-5 documentButton returnButton">반려</button>
											<button type="button" class="btn btn-lg btn-primary documentButton px-5 commentButton" onclick="createUserInputZone()">의견작성</button>
										</c:if>
									</c:when>
									<c:when test="${document.line eq 2}">
										<c:if test="${sessionScope.empNo == document.secondApproverNo && document.status != 'return'}">
											<button type="button" class="btn btn-lg btn-primary px-5 documentButton" onclick="location.href='${context}process/documents/${document.docNo}/complete'">결재승인</button>
											<button type="submit" class="btn btn-lg btn-primary px-5 documentButton returnButton">반려</button>
											<button type="button" class="btn btn-lg btn-primary documentButton px-5 commentButton" onclick="createUserInputZone()">의견작성</button>
										</c:if>
									</c:when>
									<c:when test="${document.line eq 3}">
										<c:if test="${sessionScope.empNo == document.thirdApproverNo && document.status != 'return'}">
											<button type="button" class="btn btn-lg btn-primary px-5 documentButton" onclick="location.href='${context}process/documents/${document.docNo}/complete'">결재승인</button>
											<button type="submit" class="btn btn-lg btn-primary px-5 documentButton returnButton">반려</button>
											<button type="button" class="btn btn-lg btn-primary documentButton px-5 commentButton" onclick="createUserInputZone()">의견작성</button>
										</c:if>
									</c:when>
								</c:choose>
								<c:if test="${document.empNo == sessionScope.empNo && document.line eq 1 && document.status != 'return' }">
									<button type="button" class="btn btn-lg btn-primary px-5" onclick="location.href='${context}process/documents/${document.docNo}/edit'">수정</button>
								</c:if>
								<c:if test="${document.empNo == sessionScope.empNo && document.status != 'progress'}">
									<button type="button" class="btn btn-lg px-3 btn-primary" onclick="confirmAndTrash('${context}process/documents/${document.docNo}/trashcan')">휴지통으로 이동</button>
								</c:if>
							</c:if>
							<c:if test="${document.empNo == sessionScope.empNo && document.useYn == 'n'}">
								<button type="button" class="btn btn-primary btn-lg px-5" onclick="confirmAndRestore('${context}process/documents/${document.docNo}/restore')">복원</button>
								<button type="button" class="btn btn-danger btn-lg px-5" onclick="confirmAndDelete('${context}process/documents/${document.docNo}/delete')">삭제</button>
							</c:if>
						</div>
						<!-- 여기 바디 마지막 -->
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		// '의견작성' 버튼 클릭하면 반려의견 작성 가능.
		function createUserInputZone() {
			const userInputZone = document.querySelector('.documentBody');
			
			const description = document.createElement('span');
			description.textContent = '반려 의견 : ';
			
			const commentSection = document.createElement('textarea');
			commentSection.rows = 4;
			commentSection.maxLength = 150;
			commentSection.name = "returnComment";
			
			userInputZone.appendChild(description);
			userInputZone.appendChild(commentSection);
		}
	</script>
</body>
</html>