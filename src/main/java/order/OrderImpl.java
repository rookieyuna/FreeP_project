package order;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import cart.CartDTO;
import store.StoreVO;

@Service
public interface OrderImpl {

	public ArrayList<CartDTO> listCt(int a);
	
	public void insertOrder(int a);
	
	public OrderDTO productInfo(String a, String b);
	public OrderDTO productDIYInfo(String a, String b);
	public void productInsert(OrderDTO a);
	//사용한 포인트 차감
	public void updatePoint(int a, int b);
	//포인트 적립
	public void updatePoint1(int a, int b);
	//사용한 쿠폰삭제
	public void deleteMyCoupon(int a);
	//장바구니에서 삭제
	public void deleteProduct(String a);

	public StoreVO selectStore(String a);
}
