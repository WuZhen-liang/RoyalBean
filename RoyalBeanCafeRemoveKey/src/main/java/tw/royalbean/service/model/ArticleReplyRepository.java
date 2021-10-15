package tw.royalbean.service.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.member.model.Company;
import tw.royalbean.shop.model.ShopPd;



public interface ArticleReplyRepository extends JpaRepository<ArticleReply, Integer> {
	
	//public List<ArticleReply> findByArticleId(int articleid);
	
	public List<ArticleReply> findByArticle(Article article);
	
	//public List<ArticleReply> findByArticletype(String articletype);
	
//	public List<Article> findAllByArticletime();

}
