package tw.royalbean.service.model;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.activity.model.ActivityStore;

@Service
@Transactional
public class ArticleService {
	@Autowired
	private ArticleRepository ArticleRepository;
	public Article findById(Integer id) {
		Optional<Article> aRep =ArticleRepository.findById(id);
		
		if(aRep.isPresent()) {
			return aRep.get();
		}
		
		return null;
	}
	
	public List<Article> findAll(){
		return ArticleRepository.findAll();
	}
	
	public Page<Article> findAllByPage(Pageable pageable){
		return ArticleRepository.findAll(pageable);
	}
	
	public List<Article> findByType(String articletype){
		return ArticleRepository.findByArticletype(articletype);
	}
	
//	public List<Article> findAllByArticletime(){
//		
//		return ArticleRepository.findAllByArticletime();
//	}
//	
	public Article insertArticle(Article a) {
		return ArticleRepository.save(a);
	}
	
	public Article updateArticle(Article a) {
		return ArticleRepository.save(a);
	}
	
	public void deleteArticle(Integer aid) {
		ArticleRepository.deleteById(aid);
	}
}
