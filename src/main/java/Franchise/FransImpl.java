package Franchise;

import java.util.ArrayList;

import board.BoardDTO;
import util.ParameterDTO;

public interface FransImpl {
	
	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<FransVO> listPage(ParameterDTO parameterDTO);
	
	/*
	 @Param 어노테이션을 통해 파라미터를 전달하면 Mapper에서는 별칭을 통해
	 인파라미터 처리를 할 수 있다.
	 */
	public void regist(FransVO fransVO);
	
	//기존 게시물의 내용을 읽어오기 위한 메서드
	public FransVO view(ParameterDTO parameterDTO);
	
	//수정처리
	public int edit(FransVO fransVO);
	
	//삭제처리
	public int delete(String f_code);
	
	//쓰기처리
	public void write(FransVO fransVO);
}
