package cafe.jjdev.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.board.model.Article;
import cafe.jjdev.board.model.Reply;
import cafe.jjdev.board.repository.BoardDao;

@Service
@Transactional
public class BoardService {
	private final int LINE_PER_PAGE = 10;
	@Autowired
	private BoardDao boardDaoImpl;
	
	// 글쓰기
	public int articleInsert(Article article){
		return boardDaoImpl.articleInsert(article);
	}
	
	// articleDetail
	public Article articleDetail(Article article){
		return boardDaoImpl.articleDetail(article);
	}
	
	// 전체글 리스트 출력
	public List<Article> articleList(Map<String, Object> map){
		return boardDaoImpl.articleList(map);
	}
	
	//마지막페이지 구하는 메서드
	public int getLastPage(String searchWord) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchWord", searchWord);
        return (int)(Math.ceil((double)boardDaoImpl.selectTotalCount(map)/LINE_PER_PAGE));
    }
	
	// 글번호와 글비밀번호 이용한 글 선택
	public Article articleSelectByNoAndPw(Article article) {
        return boardDaoImpl.articleSelectByNoAndPw(article);
    }
	
	// 글 수정
	public int articleModify(Article article){
		return boardDaoImpl.articleModify(article);
	}
	
	// 글 삭제
	public int articleDelete(Article article){
		return boardDaoImpl.articleDelete(article);
	}
	
	// 댓글 등록
	public int replyInsert(Reply reply){
		return boardDaoImpl.replyInsert(reply);
	}
	
	// 댓글 리스트
	public List<Reply> replyList(Reply reply){
		return boardDaoImpl.replyList(reply);
	}
	
	// 댓글 수정
	public int replyModify(Reply reply){
		return boardDaoImpl.replyModify(reply);
	}
	
	// 댓글 삭제
	public int replyDelete(Reply reply){
		return boardDaoImpl.replyDelete(reply);
	}

	// 댓글 상세
	public Reply replyDetail(Reply reply) {
		return boardDaoImpl.replyDetail(reply);
	}

	public Reply replyDetailByArticleNo(Reply reply) {
		return boardDaoImpl.replyDetailByArticleNo(reply);
	}

	public Object articleDetailByArticleNo(int articleNo) {
		return boardDaoImpl.articleDetailByArticleNo(articleNo);
	}

	public List<Reply> replyListByArticleNo(Article article) {
		return boardDaoImpl.replyListByArticleNo(article);
		
	}

	public int replyDeleteWithArticle(Article article) {
		return boardDaoImpl.replyDeleteWithArticle(article);
		
	}

	public int articleCountBySearch(Map<String, Object> map) {
		return boardDaoImpl.articleCountBySearch(map);
	}
}