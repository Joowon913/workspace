package himedia.project.workspace.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@NoArgsConstructor
public class Member {
	Long empNo;			// 사번
	String userId;		// 아이디
	String password;	// 비밀번호
	String name;		// 직원 이름
	String position;	// 직위
	int positionNo;     // 직위 번호
	String department;	// 부서
	String icon;		// 아이콘 이미지
	String email;		// 이메일
	String phone;		// 내선번호
}
