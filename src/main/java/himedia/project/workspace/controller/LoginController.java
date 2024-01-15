package himedia.project.workspace.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import himedia.project.workspace.dto.Member;
import himedia.project.workspace.service.MemberService;

/**
 * @author 김주원
 * @see 231218
 */
@Controller
public class LoginController {
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	private final MemberService service;
	
	public LoginController(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute Member member, Model model, HttpSession session) throws Exception {
		System.out.println(member.getPassword());
		System.out.println(pwdEncoder.encode(member.getPassword()));
		// 사용자 조회
		Member findMember = service.findMember(member.getUserId());
		
		// id, pw 일치여부에 따른 처리
		if(findMember == null) {
			// 인증 실패, 로그인 화면으로 이동
			model.addAttribute("message", "error");
			return "redirect:/";
		}
		else {
			// 비밀번호 일치여부 체크
			if(pwdEncoder.matches(member.getPassword(), findMember.getPassword())) {
				// 인증 성공, 세션에 값 저장, 메인 페이지로 이동
				session.setAttribute("empNo", findMember.getEmpNo());
				session.setAttribute("userId", findMember.getUserId());
				session.setAttribute("name", findMember.getName());
				session.setAttribute("position", findMember.getPosition());
				session.setAttribute("positionNo", findMember.getPositionNo());
				
				// 231223 아이콘 추가 
				session.setAttribute("icon", findMember.getIcon());
				return "redirect:/process/documents";
			} else {
				// 인증 실패, 로그인 화면으로 이동
				model.addAttribute("message", "error");
				return "redirect:/";
			}
			
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		session.invalidate();	// 세션 초기화
		return "redirect:/";
	}
}
