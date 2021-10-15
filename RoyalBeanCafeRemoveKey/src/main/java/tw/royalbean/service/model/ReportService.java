package tw.royalbean.service.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ReportService {
	@Autowired
	private ReportRepository ReportRepository;
	
	public Report findById(Integer id) {
		Optional<Report> rRep = ReportRepository.findById(id);
		
		if(rRep.isPresent()) {
			return rRep.get();
		}
		return null;
	}
	public List<Report> findAll(){
		return ReportRepository.findAll();
	}
	
	public Page<Report> findAllByPage(Pageable pageable){
		return ReportRepository.findAll(pageable);
	}
	
	public Report insertReport(Report r) {
		return ReportRepository.save(r);
	}
	
	public Report updateReport(Report r) {
		return ReportRepository.save(r);
	}
	
	public void deleteReport(Integer rid) {
		ReportRepository.deleteById(rid);
	}
}
