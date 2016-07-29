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
	
	// �۾���
	public int articleInsert(Article article){
		return boardDaoImpl.articleInsert(article);
	}
	
	// articleDetail
	public Article articleDetail(Article article){
		return boardDaoImpl.articleDetail(article);
	}
	
	// ��ü�� ����Ʈ ���
	public List<Article> articleList(Map<String, Object> map){
		return boardDaoImpl.articleList(map);
	}
	
	//������������ ���ϴ� �޼���
	public int getLastPage(String searchWord) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchWord", searchWord);
        return (int)(Math.ceil((double)boardDaoImpl.selectTotalCount(map)/LINE_PER_PAGE));
    }
	
	// �۹�ȣ�� �ۺ�й�ȣ �̿��� �� ����
	public Article articleSelectByNoAndPw(Article article) {
        return boardDaoImpl.articleSelectByNoAndPw(article);
    }
	
	// �� ����
	public int articleModify(Article article){
		return boardDaoImpl.articleModify(article);
	}
	
	// �� ����
	public int articleDelete(Article article){
		return boardDaoImpl.articleDelete(article);
	}
	
	// ��� ���
	public int replyInsert(Reply reply){
		return boardDaoImpl.replyInsert(reply);
	}
	
	// ��� ����Ʈ
	public List<Reply> replyList(Reply reply){
		return boardDaoImpl.replyList(reply);
	}
	
	// ��� ����
	public int replyModify(Reply reply){
		return boardDaoImpl.replyModify(reply);
	}
	
	// ��� ����
	public int replyDelete(Reply reply){
		return boardDaoImpl.replyDelete(reply);
	}

	// ��� ��
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