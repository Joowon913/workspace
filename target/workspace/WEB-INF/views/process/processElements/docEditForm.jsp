<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.yaya {background-color: yellow;}
</style>
<div class="container-xl" style="max-width: 1000px; margin-top: 0; margin-right: 300px;">
	<div id="container-xl" class="container" style="max-width: 600px; padding-top: 0;">
		<div class="py-5 text-center"></div>
		<div style="margin-top: -90px;">
			<div class="mb-3 row">
				<label for="id" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input class="form-control bg-gray" name="title" id="title" type="text" value="${document.title}">
					<div id="titleAlert" class="text-left mt-1" style="color: #f00;"></div>
				</div>
			</div>
			<div class="mb-2 row">
				<div class="col-sm-2 col-form-label">첨부파일</div>
				<div class="col-sm-10">
					<input class="form-control bg-gray" name="file" id="file" type="file" placeholder="파일을 첨부하세요..">
					<span style="color: f00;">${message}</span>
				</div>
			</div>
			<div class="mb-2 row">
				<div class="col-sm-2 col-form-label"></div>
				<c:if test="${not empty document.attachedFileName}">
					<div id="fileTextArea" class="col-sm-10 bg-gray bg-secondary-subtle bg-secondary-subtle py-2 m-auto"
						style="border-radius: 5px; color: #212529; font-weight: 400; text-align: left; max-width: 79%;">
						<a id="file" href="#"
							aria-hidden="true">
							${not empty document.attachedFileName ? document.attachedFileName : ""}
						</a>
						<button id="delete-btn" type="button" style="border: 0; background-color: transparent; margin-left: 3px;">
							X
						</button>
					</div>
				</c:if>
				<input name="originAttachedFileUseYn" id="originAttachedFileUseYn" hidden=true;
					value="${document.attachedFileName == null ? 'n' : 'y'}"></input>
			</div>
			<hr>
		</div>
	</div>

	<div class="mx-auto" style="width: 902px; border-radius: 10px; min-height: 500px;">
		<hr>
		<div style="margin-top: -30px;">
			<textarea id="summernote" name="body" class="texta">
				${document.body}
			</textarea>
		</div>
		<%-- <jsp:include page="docTextArea.jsp"></jsp:include> --%>
	</div>

	<div style="display: flex; justify-content: flex-end; margin-right: 90px;" class="mt-3">
		<button type="button" class="btn btn-secondary me-3" onclick="history.back();">취소</button>
		<button type="button" class="btn btn-primary" onclick="formSubmit();">수정완료</button>
	</div>
</div>

<script>
	/* 기존파일 삭제버튼 클릭 시 */
	$("#delete-btn").click(function (e) {
		var isConfirm = confirm("첨부된 파일을 삭제하시겠습니까?");
		if (isConfirm) {
			$("#originAttachedFileUseYn").val("n");
			$("#fileTextArea").css('display', 'none');
		}
	})

	/* 파일 선택 클릭 시 기존 파일이 있는 경우 confirm 후 삭제 */
	$("#file").click(function (e) {
		if ($("#originAttachedFileUseYn").val() == "y") {
			if (confirm("기존 파일은 삭제됩니다. 새로운 파일을 첨부 하시겠습니까?")) {
				$("#originAttachedFileUseYn").val("n");
				$("#fileTextArea").css('display', 'none');
			}
		}
	})
	
	const clicker = document.querySelector('.addFormBtn');
	clicker.addEventListener('click', function() {
	    const texta = document.querySelector('.texta');
	    const docTable = document.createElement('div');
	    const docTableBody = document.querySelector('.docTable');
	    const docTableHtml = docTableBody.innerHTML;
	
	    console.log("버튼클릭됨ddddddddd");
	    docTable.innerHTML = docTableHtml;
	    texta.appendChild(docTable);
	});
	
</script>