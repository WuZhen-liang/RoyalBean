package tw.royalbean.service.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleReplyService {
	@Autowired
	private ArticleReplyRepository replyRepository;
	@Autowired
	private ArticleRepository articleRepository;
	
	public ArticleReply findById(Integer id) {
		Optional<ArticleReply> qRep =replyRepository.findById(id);
		
		if(qRep.isPresent()) {
			return qRep.get();
		}
		
		return null;
	}
	
	public List<ArticleReply> findAll(){
		return replyRepository.findAll();
	}
	
	public Page<ArticleReply> findAllByPage(Pageable pageable){
		return replyRepository.findAll(pageable);
	}
	
	public ArticleReply insertReply(ArticleReply q) {
		return replyRepository.save(q);
	}
	
	public ArticleReply updateReply(ArticleReply q) {
		return replyRepository.save(q);
	}
	
	public void deleteArticleReply(Integer qid) {
		replyRepository.deleteById(qid);
	}
	
	public List<ArticleReply> findArticleId(int aid) {
		Article article = articleRepository.getById(aid);
		List<ArticleReply> reply = replyRepository.findByArticle(article);
		return reply;
	}
	
}

