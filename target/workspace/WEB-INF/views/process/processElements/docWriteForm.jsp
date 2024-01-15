<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!-- TODO::231221 form 상단 컴포넌트로 이동 -->
	<div class="container-xl" style="max-width: 1000px; margin-top: 0; margin-right: 300px;">
		<div id="container-xl" class="container" style="max-width: 600px; padding-top: 0;">
			<div class="py-5 text-center"></div>
			<div style="margin-top: -90px;">
				<div class="mb-3 row">
					<label for="title" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input class="form-control bg-gray" name="title" id="title" type="text" placeholder="제목을 입력하세요..">
						<div id="titleAlert" class="text-left mt-1" style="color: #f00;"></div>
					</div>
				</div>
				<div class="mb-2 row">
					<div class="col-sm-2 col-form-label">첨부파일</div>
					<div class="col-sm-10">
						<input class="form-control bg-gray" name="file" id="file" type="file" placeholder="파일을 첨부하세요..">
						<span style="color: #f00;">${message == null ? "" : message}</span>
					</div>
				</div>
				<hr>
			</div>
		</div>

		<div class="mx-auto" style="width: 902px; border: 1.5px solid gray; border-radius: 10px; min-height: 500px;">
			<hr>
			<jsp:include page="docTextArea.jsp"></jsp:include>

			<!-- 
		<div class="form-floating" >
			<textarea class="form-control" placeholder="Leave a comment here" id="summernote" style="height: 500px; border: 1.5px solid gray"></textarea>
			<label for="floatingTextarea2">Comments</label>
		</div>
		 -->
		</div>
		<div style="display: flex; justify-content: flex-end; margin-right: 90px;" class="mt-3">
			<button type="button" class="btn btn-secondary me-3" onclick="history.back();">취소</button>
			<button type="button" class="btn btn-primary" onclick="formSubmit();">작성완료</button>
		</div>
	</div>
