package board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/*
해당 인터페이스는 컨트롤러와 DAO사이에서 매개역할을 하는 서비스
객체로 사용된다.
@Service 어노테이션은 빈을 자동으로 생성하기 위한 용도이지만 
여기서는 단순히 역할을 명시적으로 표현하기 위해 사용되었다. 
따라서 필수 사항은 아니다.   
 */
@Service
public interface BoardDAOImpl {
	
	public int getTotalCount(int a);
	public ArrayList<BoardDTO> listPage(int a, int s, int e);
	
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<BoardDTO> listPageSearch(ParameterDTO parameterDTO);


	public void write(BoardDTO boardDTO);
	public int findm_code(String a);
	
	public BoardDTO view(BoardDTO boardDTO);
	
	public void edit(BoardDTO boardDTO);
	
	public void delete(int a);
	
	public String selectsfile(String a);
	
	public void deletefile(int a);
	
}