package tw.royalbean.service.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.activity.model.ActivityStore;



public interface ArticleRepository extends JpaRepository<Article, Integer> {
	
	public List<Article> findByArticletype(String articletype);
	
//	public List<Article> findAllByArticletime();

}
