package himedia.project.workspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.workspace.dto.Document;
import himedia.project.workspace.dto.Documents;
import himedia.project.workspace.dto.Paging;

public interface ProcessMapper {

	/**
	 * @author 김주원
	 * @see 231223
	 */
	@Select("select docNo, title, status, d.empNo, m.name, po.position, department, icon, line, firstApproverNo, secondApproverNo, thirdApproverNo, email, phone, date_format(d.insertDate,'%Y-%m-%d') as insertDate from documents d"
			+ " left join member m on d.empNo = m.empNo left join `position` po on m.positionNo = po.positionNo"
			+ " where status like 'progress' and d.useYn = 'y'"
			+ " having (line=1 and (d.empNo=#{empNo} or firstApproverNo=#{empNo})) or (line=2 and (firstApproverNo=#{empNo} or secondApproverNo=#{empNo}))"
			+ " or (line=3 and (secondApproverNo=#{empNo} or thirdApproverNo=#{empNo}))"
			+ " order by docNo desc limit #{page.skip}, #{page.pagePer}")
	List<Documents> findByProgress(@Param("empNo") Long empNo, @Param("page") Paging page);
	
	/**
	 * @author 김주원
	 * @see 231230
	 */
	@Select("select docNo, title, status, d.empNo, m.name, po.position, department, icon, firstApproverNo, secondApproverNo, thirdApproverNo, email, phone, date_format(d.insertDate,'%Y-%m-%d') as insertDate from documents d"
			+ " left join member m on d.empNo = m.empNo left join `position` po on m.positionNo = po.positionNo"
			+ " where status like 'complete' and d.useYn = 'y'"
			+ " having d.empNo=#{empNo} or firstApproverNo=#{empNo} or secondApproverNo=#{empNo} or thirdApproverNo=#{empNo}"
			+ " order by docNo desc limit #{page.skip}, #{page.pagePer}")
	List<Documents> findByComplete(@Param("empNo") Long empNo, @Param("page") Paging page);
	
	/**
	 * @author 김주원
	 * @see 231229
	 */
	@Select("select docNo, title, status, d.empNo, m.name, po.position, department, icon, useYn, email, phone, date_format(d.insertDate,'%Y-%m-%d') as insertDate from documents d"
			+ " left join member m on d.empNo = m.empNo left join `position` po on m.positionNo = po.positionNo"
			+ " where status like 'return' and d.empNo=#{empNo}"
			+ " having d.useYn = 'y' order by docNo desc limit #{page.skip}, #{page.pagePer}")
	List<Documents> findByReturn(@Param("empNo") Long empNo, @Param("page") Paging page);
	
	/**
	 * @author 김주원
	 * @see 231224
	 */
	@Select("select docNo, title, status, d.empNo, m.name, po.position, department, icon, email, phone, firstApproverNo, secondApproverNo, thirdApproverNo, date_format(d.insertDate,'%Y-%m-%d') as insertDate from documents d"
			+ " left join member m on d.empNo = m.empNo"
			+ " left join `position` po on m.positionNo = po.positionNo"
			+ " where d.useYn = 'n'"
			+ " having d.empNo=#{empNo}"
			+ " order by docNo desc limit #{page.skip}, #{page.pagePer}")
	List<Documents> findByDelete(@Param("empNo") Long empNo, @Param("page") Paging page);
	
	/**
	 * @author 김주원
	 * @see 231223
	 */
	@Select("select docNo, title, status, d.empNo, m.name, po.position, department, icon, email, phone, date_format(d.insertDate,'%Y-%m-%d') as insertDate "
			+ "from documents d, member m, `position` po where d.empNo = m.empNo and m.positionNo = po.positionNo "
			+ "and d.empNo=#{empNum} and d.useYn = 'y' order by docNo desc limit #{page.skip}, #{page.pagePer}")
	List<Documents> findMyDoc(@Param("empNum") Long empNum, @Param("page") Paging page);
	
	/**
	 * @author 김주원
	 * @see 231223
	 */
	@Select("select d.docNo, d.title, d.status, d.empNo, m.name, po.position, m.department, m.icon, email, phone, date_format(d.insertDate,'%Y-%m-%d') as insertDate from documents d"
			+ " left join member m on d.empNo = m.empNo"
			+ " left join `position` po on m.positionNo = po.positionNo"
			+ " where title like concat('%', #{search}, '%') order by docNo desc limit #{page.skip}, #{page.pagePer}")
	List<Documents> search(@Param("search") String search, @Param("page") Paging page);
	
	/**
	 * @author 김주원
	 * @see 231222
	 */
	@Select("select count(*) from documents where empNo = ${empNo} and useYn = 'y'")
	int getTotal(Long empNo);
	
	/**
	 * @author 김주원
	 * @see 231230
	 */
	@Select("select count(*) from documents where status like 'complete' and useYn = 'y' and (empNo=#{empNo} or firstApproverNo=#{empNo} or secondApproverNo=#{empNo} or thirdApproverNo=#{empNo})")
	int getCompleteTotal(Long empNo);
	
	/**
	 * @author 김주원
	 * @see 231229
	 */
	@Select("select count(*) from documents where status like 'return' and useYn = 'y' and empNo=#{empNo}")
	int getReturnTotal(Long empNo);
	
	/**
	 * @author 김주원
	 * @see 231230
	 */
	@Select("select count(*) from documents where status like 'progress' and useYn = 'y' "
			+ "and ((line=1 and (empNo=#{empNo} or firstApproverNo=#{empNo})) "
			+ "or (line=2 and (firstApproverNo=#{empNo} or secondApproverNo=#{empNo})) "
			+ "or (line=3 and (secondApproverNo=#{empNo} or thirdApproverNo=#{empNo})));")
	int getProgressTotal(Long empNo);
	
	/**
	 * @author 김주원
	 * @see 231224
	 */
	@Select("select count(*) from documents where useYn = 'n' and empNo=#{empNo}")
	int getDeleteTotal(@Param("empNo") Long empNo);
	
	/**
	 * @author 김주원
	 * @see 231222
	 */
	@Select("select count(*) from documents where title like concat('%', #{search}, '%')")
	int getSearchTotal(String search);
	
	/**
	 * @author 김주원
	 * @see 231221
	 */
	@Insert("insert into documents(empNo, title, body, status, attachedFile, attachedFileName, line, firstApproverNo, secondApproverNo, thirdApproverNo, insertDate) values (#{empNo}, #{title}, #{body}, #{status}, #{attachedFile}, #{attachedFileName}, #{line}, #{firstApproverNo}, #{secondApproverNo}, #{thirdApproverNo}, now())")
	@Options(useGeneratedKeys = true, keyProperty = "docNo")
	void save(Documents doc);
	
	/**
	 * @author 김주원
	 * @see 231221
	 */
	@Update("update documents set title=#{doc.title}, body=#{doc.body},"
			+ "attachedFile=#{doc.attachedFile}, attachedFileName=#{doc.attachedFileName}, firstApproverNo=#{doc.firstApproverNo}, secondApproverNo=#{doc.secondApproverNo}, thirdApproverNo=#{doc.thirdApproverNo} where docNo = #{docNo}")
	int editForm(@Param("docNo") Long docNo, @Param("doc") Documents doc);
	
	/**
	 * @author 김주원
	 * @see  231226
	 */
	@Select("select doc.docNo, doc.empNo, concat(mem1.name, ' ', po1.position) as name, doc.title, doc.body, doc.status, doc.attachedFile, doc.attachedFileName, doc.line, doc.useYn, "
			+ "concat(mem5.name, ' ', po5.position) as returnEmpName, doc.returnComment, date_format(doc.returnDate, '%Y-%m-%d %H:%i') as returnDate, "
			+ "concat(mem2.name, ' ', po2.position) as firstApproverName, "
			+ "concat(mem3.name, ' ', po3.position) as secondApproverName, "
			+ "concat(mem4.name, ' ', po4.position) as thirdApproverName, "
			+ "doc.firstApproverNo, doc.secondApproverNo, doc.thirdApproverNo, "
			+ "po2.positionNo as firstApproverPositionNo, "
			+ "po3.positionNo as secondApproverPositionNo, "
			+ "po4.positionNo as thirdApproverPositionNo, "
			+ "date_format(doc.insertDate,'%Y-%m-%d %H:%i') as insertDate "
			+ "from documents doc left outer join member mem1 on doc.empNo = mem1.empNo "
			+ "left outer join `position` po1 on mem1.positionNo = po1.positionNo "
			+ "left outer join member mem2 on doc.firstApproverNo = mem2.empNo "
			+ "left outer join `position` po2 on mem2.positionNo = po2.positionNo "
			+ "left outer join member mem3 on doc.secondApproverNo = mem3.empNo "
			+ "left outer join `position` po3 on mem3.positionNo = po3.positionNo "
			+ "left outer join member mem4 on doc.thirdApproverNo = mem4.empNo "
			+ "left outer join `position` po4 on mem4.positionNo = po4.positionNo "
			+ "left outer join member mem5 on doc.returnEmpNo = mem5.empNo "
			+ "left outer join `position` po5 on mem5.positionNo = po5.positionNo "
			+ "where doc.docNo = #{docNo}")
	Document getDocumentDetail(Long docNo);
	
	/**
	 * @author 김주원
	 * @see 231225
	 */
	@Update("update documents set status='return', returnEmpNo=#{returnEmpNo}, returnComment=#{returnComment}, returnDate=now() where docNo = #{docNo}")
	int returnDocument(@Param("docNo") Long docNo, @Param("returnEmpNo") Long returnEmpNo, @Param("returnComment") String returnComment);
	
	/**
	 * @author 김주원
	 * @see 231222
	 */
	@Update("update documents set line=#{line} where docNo=#{docNo}")
	int updateLine(@Param("docNo") Long docNo, @Param("line") int line);
	
	/**
	 * @author 김주원
	 * @see  231225
	 */
	@Update("update documents set status=#{status} where docNo=#{docNo}")
	int updateStatus(@Param("docNo") Long docNo, @Param("status") String status);
	
	/**
	 * @author 김주원
	 * @see  231226
	 */
	@Update("update documents set useYn=#{useYn} where docNo=#{docNo}")
	int updateUseYn(@Param("docNo") Long docNo, @Param("useYn") String useYn);

	/**
	 * @author 김주원
	 * @see  231225
	 */
	@Delete("delete from documents where docNo=#{docNo}")
	int deleteDocument(Long docNo);
	

}
