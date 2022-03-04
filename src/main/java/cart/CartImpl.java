package cart;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import store.StoreVO;



@Service
public interface CartImpl {

	
	//전체 리스트 가져오기
	public ArrayList<CartDTO> listPage(int a);
	
	//diy피자에서 가져오기
	public ArrayList<CartDTO> listPagediy(int a);
	public CartDTO objectdiy(int a);
	public CartDTO takeTopping(int a);
	
	public int sum1(int a);
	public int sum2(int a);
	
	public void deleteCart(int cart);

	public void updateCart(int a, int b);
	
	public void deleteCartall(int a);
	//장바구니에 같은 품목이 있는지 판별하기
	public int confirmCart(Map<String, Object> map);
	//개수 +1
	public int updateCountCart(Map<String, Object> map);
	//장바구니에서 매장별 거리
	public ArrayList<StoreVO> storeList(double a, double b); 

}
 