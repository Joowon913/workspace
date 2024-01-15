<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<header class="py-2 border-bottom" style="background-color: #F9F9F9;">
	<div class="container-fruid gap-3 text-center align-items-center">
		<div class="row align-items-center w-100">
			<a href="${context}process/documents" class="col-2 ms-4 mb-2 mb-lg-0 link-body-emphasis"> <img src="${resPath}/image/logo.png" alt="logo" width="175px">
			</a>
			<div class="col-md-auto mx-auto p-2 input-group" style="width: 700px;">
				<form role="search" action="${context}process/documents/search" method="get" style="width: 100%;">
				<!-- 검색 게시판 선택 기능 추가 -->
					<div class="input-group">
						<select name="searchType" class="form-select" aria-label="검색 영역" style="border-color: #6c757d; width: 19%;">
							<option value="document">서류 검색</option>
							<option value="board">게시판 검색</option>
						</select> 
						<input type="search" class="form-control" placeholder="Search..." aria-label="Search" style="border-color: #6c757d; width: 74%;" name="search">
						<button type="submit" class="btn btn-outline-secondary" style="width: 7%;">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="col-2 ">
				<div class="dropdown p-1 row">
					<div class="p-1 col-5" style="font-weight: bold;">
						<a href="#" class="d-block link-body-emphasis text-decoration-none fw-bold dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"> ${sessionScope.name} 님 <img
							src="${resPath}${sessionScope.icon}" alt="emp-img" width="32" height="32" class="rounded-circle ms-2">
						</a>
						<ul class="dropdown-menu text-small shadow">
							<li><a class="dropdown-item" href="${context}logout">Sign out</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>