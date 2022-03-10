package coupon;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import util.ParameterDTO;


@Service
public interface CouponImpl {
	public ArrayList<CouponVO> listCp(ParameterDTO a);
	
	public int getTotalCount();
	public ArrayList<CouponVO>listPage(int s, int e);
	public void write(CouponVO a);
	public void delete(int a);
	
}
 