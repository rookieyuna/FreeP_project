package review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import menu.MenuVO;
import order.OrderDTO;
import util.ParameterDTO;

/*
해당 인터페이스는 컨트롤러와 DAO사이에서 매개역할을 하는 서비스
객체로 사용된다.
@Service 어노테이션은 빈을 자동으로 생성하기 위한 용도이지만 
여기서는 단순히 역할을 명시적으로 표현하기 위해 사용되었다. 
따라서 필수 사항은 아니다.   
 */
@Service
public interface ReviewBoardDAOImpl {
	
	public int getTotalCount();
	public int getMyCount(ParameterDTO parameterDTO);
	public int getMyFavCount(ParameterDTO parameterDTO);
	
	public ArrayList<ReviewBoardDTO> listPage(int s, int e);
	public ArrayList<ReviewBoardDTO> listMyPage(ParameterDTO parameterDTO);
	public ArrayList<ReviewBoardDTO> listMyFavPage(ParameterDTO parameterDTO);
	
	public ArrayList<ReviewBoardDTO> listBest(int s, int e);
	
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<ReviewBoardDTO> listPageSearch(ParameterDTO parameterDTO);

	public ReviewBoardDTO view(ReviewBoardDTO boardDTO);
	
	public void write(ReviewBoardDTO boardDTO); 
	public int findm_code(String a);
	 
	// review를 지우기 위해선 fk로인해 likedReview에서 해당 rv_idx데이터를 지워줘야함
	public void deleteLikedReview(int a);
	public void delete(int a);
	public String selectsfile(String a);
	public String selectsfile2(String a);
	public String selectsfile3(String a);
	
	public void deletefile(int a);
	public void deletefile2(int a);
	public void deletefile3(int a);
	public void edit(ReviewBoardDTO boardDTO);
	
	
	//좋아요 리뷰 테이블 추가 및 삭제 메서드 JYA
	public void likeReview(LikedReviewDTO likedReviewDTO); 
	public void dislikeReview(LikedReviewDTO likedReviewDTO);
	
	
	// 리뷰게시판 주문상품 KDB
	public List<String> geReviewtInfo(int a);
	public Map<String, Object> getNormalName(String a);
	public Map<String, Object> getDiyData(String a);
	public List<String> getDiyName(List<Object> a);
	
	
	//좋아요 검사
	public int likeChk(LikedReviewDTO likedReviewDTO);
	public List<String> viewMyLike(LikedReviewDTO likedReviewDTO);
	
	// 리뷰게시판 > 장바구니 추가
	public Map<String, Object> getDiyChk(String a);
	
}