package store;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import util.ParameterDTO;

@Service
public interface StoreImpl {
	
	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<StoreVO> listPage(ParameterDTO parameterDTO);
	
	/*
	 @Param 어노테이션을 통해 파라미터를 전달하면 Mapper에서는 별칭을 통해
	 인파라미터 처리를 할 수 있다.
	 */
	public void regist(StoreVO storeVO);
	
	//기존 게시물의 내용을 읽어오기 위한 메서드
	public StoreVO view(ParameterDTO parameterDTO);
	
	//수정처리
	public int edit(StoreVO storeVO);
	
	//삭제처리
	public int delete(String b_code);
	
	//매장검색 부분
	public ArrayList<StoreVO> getList(ParameterDTO parameterDTO);
	
	public StoreVO views(StoreVO storeVO);
	
	public StoreVO storelist(StoreVO storeVO);
	
	public StoreVO mapList(StoreVO storeVO);
	
}
