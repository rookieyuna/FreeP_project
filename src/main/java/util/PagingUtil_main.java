package util;

public class PagingUtil_main {
   public static String pagingImg(
      int totalRecordCount,
      int pageSize,
      int blockPage,
      int nowPage,
      String page) {
      
      String pagingStr = "";
      
      //1.전체페이지 구하기
      int totalPage = 
      (int)(Math.ceil(((double)totalRecordCount/pageSize)));
      
      /*2.현재페이지번호를 통해 이전 페이지블럭에
      해당하는 페이지를 구한다.
      */
      int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
      
      //3.이전페이지블럭 바로가기
      if(intTemp != 1) {
         pagingStr += ""
        	+ "<a href='"+page+"nowPage="+(intTemp-blockPage)+"' class='btn-prev' title='이전 페이지로 이동'><span class='hidden'>이전 페이지로 이동</span></a>";
      }
      
      //페이지표시 제어를 위한 변수
      int blockCount = 1;
      /*
      4.페이지를 뿌려주는 로직 : blockPage의 수만큼 또는
         마지막페이지가 될때까지 페이지를 출력한다.
      */
      while(blockCount<=blockPage && intTemp<=totalPage)
      {
    	  
         if(intTemp==nowPage) {
            pagingStr += "<a title='현재 페이지' class='sel'><span>"+intTemp+"</span></a>";
         }
         else {
            pagingStr += "<a href='"+page+"nowPage="+intTemp+"'><span>"+intTemp+"</span></a>";
         }
         intTemp++;
         blockCount++;
      }
      
      //5.다음페이지블럭 & 마지막페이지 바로가기
      if(intTemp <= totalPage) {
    	  
         pagingStr += "<a href='"+page+"nowPage="+intTemp+"' class='btn-next' title='다음 페이지로 이동'><span class='hidden'>다음 페이지로 이동</span></a>";
      }      
            
      return pagingStr;
   }
}