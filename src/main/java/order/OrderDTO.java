package order;

import java.util.List;

import cart.CartDTO;
import lombok.Data;

@Data
public class OrderDTO {
	private int op_idx;
	private int or_idx;
	private int code;
	private String p_price;
	private int p_count;
	
}
