package himedia.project.workspace.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import himedia.project.workspace.dto.Member;
import himedia.project.workspace.mapper.MemberMapper;

@Service
public class MemberService {
	
	private final MemberMapper mapper;
	
	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}
	
	public Member findMember(String userId) {
		return mapper.findMember(userId);
	}
	
	public List<Member> getMemberList() {
		return mapper.getMemberList();
	}
	
	// 종배님 =====================================================================
//	@Service
//	public class MemberService {
//
//		private final MemberRepository memberRepository;
//
//		public MemberService(MemberRepository memberRepository) {
//			this.memberRepository = memberRepository;
//		}
//
//		public void saveMember(Member article) {
//			memberRepository.save(article);
//		}
//
//		public Optional<Member> findUserId(String userId) {
//			return memberRepository.findByUserId(userId);
//		}
//
//		public List<Member> findAll() {
//			return memberRepository.findAll();
//		}
//
//		public int updateMember(Long MemberId, Member updateMember) {
//			return memberRepository.update(MemberId, updateMember);
//		}
//
//		public int deleteMember(Long MemberId) {
//			return memberRepository.delete(MemberId);
//		}
		
	// ==========================================================================
}
