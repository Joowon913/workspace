<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.fixed {
	pointer-events: none;
	user-select: none;
	readonly;
	disabled;
}
</style>
<div>
	<table border="2" style="width: 700px;">
		<tbody>
			<tr>
				<th colspan="8" class="fixed">이 기안서는 기안자가 지정한 최종 결재자에게 관련 부서장을 거쳐 필히 결재를 받아야 한다.</th>
			</tr>
			<tr>
				<td class="fixed"><div class="fixed">품의제목</div></td>
				<td colspan="3" class="wide">
				${document.title}
				</td>
				<td class="fixed">최종결재자</td>
				<td colspan="3" class="wide"></td>
			</tr>
			<tr>
				<td class="fixed">결재번호</td>
				<td colspan="3" class="wide"></td>
				<td class="fixed">품의번호</td>
				<td colspan="3" class="wide"></td>
			</tr>
			<tr>
				<td class="fixed">결재일</td>
				<td colspan="3" class="wide"></td>
				<td class="fixed">품의일</td>
				<td colspan="3" class="wide"></td>
			</tr>
			<tr>
				<td class="fixed">인가</td>
				<td class="fixed">조건부인가</td>
				<td class="fixed">보류</td>
				<td class="fixed">부결</td>
				<td class="fixed">기안자</td>
				<td colspan="3" class="wide"></td>
			</tr>
			<tr class="blank">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="write">
				<td colspan="8" style="text-align: left; padding: 20px;"></td>
			</tr>
		</tbody>
	</table>
</div>
