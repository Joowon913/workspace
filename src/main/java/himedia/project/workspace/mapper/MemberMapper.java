package himedia.project.workspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.workspace.dto.Member;

@Mapper
public interface MemberMapper {
	@Select("select * from member mem left outer join `position` po on mem.positionNo = po.positionNo where mem.userid = #{userid}")
	Member findMember(String userId);
	
	@Select("select * from member mem left outer join `position` po on mem.positionNo = po.positionNo")
	List<Member> getMemberList();
}
