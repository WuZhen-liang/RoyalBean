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
public class QAService {
	@Autowired
	private QARepository QARepository;
	
	public QA findById(Integer id) {
		Optional<QA> qRep =QARepository.findById(id);
		
		if(qRep.isPresent()) {
			return qRep.get();
		}
		
		return null;
	}
	
	public List<QA> findAll(){
		return QARepository.findAll();
	}
	
	public Page<QA> findAllByPage(Pageable pageable){
		return QARepository.findAll(pageable);
	}
	
	public QA insertQA(QA q) {
		return QARepository.save(q);
	}
	
	public QA updateQA(QA q) {
		return QARepository.save(q);
	}
	
	public void deleteQA(Integer qid) {
		QARepository.deleteById(qid);
	}
}
