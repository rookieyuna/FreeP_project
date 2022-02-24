package coupon;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import util.ParameterDTO;


@Service
public interface CouponImpl {
	public ArrayList<CouponVO> listCp(ParameterDTO a);
}
