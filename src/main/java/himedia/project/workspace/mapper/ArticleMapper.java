package himedia.project.workspace.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.workspace.dto.Article;

/**
 * @author 김주원
 * @see 231225
 */

public interface ArticleMapper {

	@Insert("insert into article(author, title, body, empNo) values(#{article.author}, #{article.title}, #{article.body},#{empNo})")
	@Options(useGeneratedKeys = true, keyProperty = "article.articleNo")
	void save(@Param("article") Article article, @Param("empNo") Long empNo);

	@Select("select * from article where articleNo=#{articleNo}")
	Optional<Article> findByArticleNo(Long articleNo);

	@Select("select * from article where author like concat('%', #{author}, '%')")
	List<Article> findByAuthor(String author);

	@Select("select * from article where title like concat('%', #{title}, '%')")
	List<Article> findByTitle(String title);

	@Select("select * from article where body like concat('%', #{body}, '%')")
	List<Article> findByBody(String body);

	@Select("select * from article where title like concat('%', #{search}, '%') or body like concat('%', #{search}, '%')")
	List<Article> findByTitleAndBody(String search);

	@Select("select * from article")
	List<Article> findAll();

	@Update("update article set title=#{updateArticle.title}, body=#{updateArticle.body} where articleNo=#{articleNo}")
	int update(@Param("articleNo") Long articleNo, @Param("updateArticle") Article updateArticle);

	@Delete("delete from article where articleNo=#{articleNo}")
	int delete(Long articleNo);
}
