package cart;

import java.util.ArrayList;

import org.springframework.stereotype.Service;



@Service
public interface CartImpl {

	
	//전체 리스트 가져오기
	public ArrayList<CartDTO> listPage(int a);
	
	//diy피자에서 가져오기
	public ArrayList<CartDTO> listPagediy(int a);
	public CartDTO objectdiy(int a);
	
	public int sum1(int a);
	public int sum2(int a);
}
