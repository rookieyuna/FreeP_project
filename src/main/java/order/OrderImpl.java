package order;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import cart.CartDTO;

@Service
public interface OrderImpl {

	public ArrayList<CartDTO> listCt(int a);
	
	//회원포인트 가져오기
}
