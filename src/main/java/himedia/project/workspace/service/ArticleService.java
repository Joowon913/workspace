package himedia.project.workspace.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import himedia.project.workspace.dto.Article;
import himedia.project.workspace.mapper.ArticleMapper;

/**
 * @author 전종배
 * @see 작성완료 231225
 */

@Service
public class ArticleService {

	private final ArticleMapper articleMapper;

	public ArticleService(ArticleMapper articleMapper) {
		this.articleMapper = articleMapper;
	}

	public void saveArticle(Article article, Long empNo) {
		articleMapper.save(article, empNo);
	}

	public Optional<Article> findArticleNo(Long articleNo) {
		return articleMapper.findByArticleNo(articleNo);
	}

	public List<Article> findAuthor(String author) {
		return articleMapper.findByAuthor(author);
	}

	public List<Article> findTitle(String title) {
		return articleMapper.findByTitle(title);
	}

	public List<Article> findBody(String body) {
		return articleMapper.findByBody(body);
	}

	public List<Article> findTitleAndBody(String search) {
		return articleMapper.findByTitleAndBody(search);
	}

	public List<Article> findAll() {
		return articleMapper.findAll();
	}

	public int updateArticle(Long articleNo, Article updateArticle) {
		return articleMapper.update(articleNo, updateArticle);
	}

	public int deleteArticle(Long articleNo) {
		return articleMapper.delete(articleNo);
	}
}
