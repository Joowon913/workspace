<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<aside class="float-start">
	<div class="d-flex flex-column flex-shrink-0 bg-body-tertiary sider" style="width: 280px; margin-top: -69.71px; padding-top: 69.71px; min-height: 140vh;">
		<ul class="nav nav-pills flex-column border-top p-3 ps-4">
			<li class="nav-item">
				<button type="button" onclick="location.href='${context}process/documents/write-form'" class="btn btn-outline-dark btn-lg d-inline-flex align-items-center p-3 px-5 m-2 shadow-sm mb-4 shadow"
					style="background-color: #fff; font-weight: bold;">
					<i class="bi bi-pencil-square me-3"></i> 기안 작성
				</button>
			</li>
			<li class="nav-item top-menu fw-bold">
				<a href="${context}process/documents" class="nav-link link-body-emphasis" aria-current="page"> 
					<i class="bi bi-archive me-3"></i>내 결재함
				</a>
				<ul style="font-weight: 500;">
					<li>
						<a href="${context}process/documents/progress" class="nav-link link-body-emphasis"> 
							<i class="bi bi-people me-3"></i>진행 결재함
						</a>
					</li>
					<li>
						<a href="${context}process/documents/return" class="nav-link link-body-emphasis"> 
							<i class="bi bi-envelope-slash me-3"></i>반려 결재함
						</a>
					</li>
					<li>
						<a href="${context}process/documents/complete" class="nav-link link-body-emphasis"> 
							<i class="bi bi-briefcase me-3"></i>완료 결재함
						</a>
					</li>
				</ul>
			</li>
			<%-- <li class="nav-item top-menu fw-bold">
				<a href="${context}calendar" class="nav-link link-body-emphasis"> 
					<i class="bi bi-calendar3 me-3"></i>일정
				</a>
			</li> --%>
			<li class="top-menu top-menu fw-bold">
				<a href="${context}board/articles" class="nav-link link-body-emphasis"> 
					<i class="bi bi-clipboard me-3"></i>게시판
				</a>
				<ul style="font-weight: 500;">
					<li>
						<a href="${context}board/articles/myArticles" class="nav-link link-body-emphasis">
							<i class="bi bi-bookmark-star me-3"></i>내 게시글
						</a>
					</li>
				</ul>
			</li>
			<li>
				<hr class="divider">
			</li>
		</ul>
		<div class="flex-column p-3 ps-4">
			<a href="${context}trashcan" class="nav-link link-body-emphasis" style=" padding: 15px 20px;"> 
				<i class="bi bi-trash3 me-3"></i>휴지통
			</a>
		</div>
	</div>
</aside>