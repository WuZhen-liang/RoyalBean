package tw.royalbean.benefit.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class CouponService {

	@Autowired
	private CouponRepository cpRepository;

	public Coupon findByCpid(Integer cpid) {
		Optional<Coupon> cpRep = cpRepository.findById(cpid);
		if (cpRep.isPresent()) {
			return cpRep.get();
		}
		return null;
	}

	public List<Coupon> findAll() {
		return cpRepository.findAll();
	}

	public Page<Coupon> findAllByPage(Pageable pageable) {
		return cpRepository.findAll(pageable);
	}

	public Coupon insertCoupon(Coupon cp) {
		return cpRepository.save(cp);
	}

	public Coupon updateCoupon(Coupon cp) {
		return cpRepository.save(cp);
	}

	public void deleteCoupon(Coupon cp) {
		cpRepository.delete(cp);
	}
	

}
