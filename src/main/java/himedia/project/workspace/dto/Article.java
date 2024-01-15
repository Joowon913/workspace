package himedia.project.workspace.dto;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author 김주원
 * @see 231218
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Article {
	private Long articleNo;
	private String author;
	
	@NotEmpty(message = "제목을 입력하세요")
	private String title;
	@NotEmpty(message = "내용을 입력하세요")
	private String body;
}
