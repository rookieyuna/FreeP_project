package order;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import cart.CartDTO;

@Service
public interface OrderImpl {

	public ArrayList<CartDTO> listCt(int a);
	

}
