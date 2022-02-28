package orderlist;

import java.util.ArrayList;
import org.springframework.stereotype.Service;

import util.ParameterDTO;

@Service
public interface OrderlistImpl {
	
	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<OrderlistVO> listPage(ParameterDTO parameterDTO);
	
	/*
	 @Param 어노테이션을 통해 파라미터를 전달하면 Mapper에서는 별칭을 통해
	 인파라미터 처리를 할 수 있다.
	 */
	public int regist(OrderlistVO orderlistVO);
	
	//기존 게시물의 내용을 읽어오기 위한 메서드
	public OrderlistVO view(ParameterDTO parameterDTO);
	
	//수정처리
	public int edit(OrderlistVO orderlistVO);
	
	//삭제처리
	public int delete(String or_idx);
	
	//이후부터 신태임 작성
	//인서트
	public void insertOrder(OrderlistVO a);
	//orderproduct용 idx확인
	public int checkidx();
	
//	//삭제처리
//	public int delete(String idx, String id);
//	
//	//Map 컬렉션 사용을 위한 추상메서드
//	public ArrayList<MyBoardDTO> hashMapUse(Map<String, String> hMap);
//	//List 컬렉션 사용을 위한 추상메서드
//	public ArrayList<MyBoardDTO> arrayListUse(List<String> aList);
}
