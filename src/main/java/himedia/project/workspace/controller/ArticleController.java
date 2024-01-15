package himedia.project.workspace.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import himedia.project.workspace.dto.Article;
import himedia.project.workspace.service.ArticleService;

/**
 * @author 김주원
 * @see 231224
 */

@Controller
public class ArticleController {

	private final ArticleService service;

	public ArticleController(ArticleService service) {
		this.service = service;
	}

	@GetMapping("/board/articles/myArticles")
	public String myArticles(Model model, HttpSession session) {
		String articleAuthor = (String) session.getAttribute("name");
		List<Article> articles = service.findAuthor(articleAuthor);
		model.addAttribute("articles", articles);
		return "board/articles";
	}

	@GetMapping("/board/articles")
	public String articles(Model model) {
		List<Article> articles = service.findAll();
		model.addAttribute("articles", articles);
		return "board/articles";
	}

	@GetMapping("/board/articles/{articleNo}")
	public String detailArticle(@PathVariable("articleNo") Long articleNo, Model model, HttpSession session) {
		Article article = service.findArticleNo(articleNo).get();
		model.addAttribute("article", article);

		String userName = (String) session.getAttribute("name");
		if (userName.equals(article.getAuthor())) {
			return "board/articleModifiable";
		} else {
			return "board/articleReadOnly";
		}
	}

	@GetMapping("/board/articles/add")
	public String addForm(@ModelAttribute("article") Article article, Model model) {
		model.addAttribute("article", new Article());
		return "board/addForm";
	}

	@PostMapping("/board/articles/add")
	public String postAddFrom(@Valid @ModelAttribute Article article, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "board/addForm";
		} else {
			String author = (String) session.getAttribute("name");
			Long empNo = (Long) session.getAttribute("empNo");
			article.setAuthor(author);
			service.saveArticle(article, empNo);
			return "redirect:/board/articles/" + article.getArticleNo();
		}
	}

	@GetMapping("/board/articles/{articleNo}/edit")
	public String editForm(@PathVariable Long articleNo, Model model) {
		Article article = service.findArticleNo(articleNo).get();
		model.addAttribute("article", article);
		return "board/editForm";
	}

	@PostMapping("/board/articles/{articleNo}/edit")
	public String postEditForm(@PathVariable Long articleNo, Article updateArticle) {
		service.updateArticle(articleNo, updateArticle);
		return "redirect:/board/articles";
	}

	@GetMapping("/board/articles/search")
	public String search(String search, Model model) {
		List<Article> articles = service.findTitleAndBody(search);
		model.addAttribute("articles", articles);
		return "board/articles";
	}

	@GetMapping("/board/articles/delete/{articleNo}")
	public String deleteArticle(@PathVariable Long articleNo) {
		service.deleteArticle(articleNo);
		return "redirect:/board/articles";
	}

}
