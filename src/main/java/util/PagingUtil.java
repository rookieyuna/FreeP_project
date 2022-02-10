package util;

public class PagingUtil {
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
      
      //3.처음페이지 바로가기 & 이전페이지블럭 바로가기
      if(intTemp != 1) {
         //첫번째 페이지 블럭에서는 출력되지 않음
         //두번째 페이지 블럭부터 출력됨.
         pagingStr += ""
            + "<li class='page-item'><a class='page-link' href='"+page+"nowPage=1'>"
            + "<i class='bi bi-skip-backward-fill'></i></a></li>";
         
         
         pagingStr += ""
            + "<li class='page-item'><a class='page-link' href='"+page+"nowPage="+(intTemp-blockPage)+"'>"
            + "<i class='bi bi-skip-start-fill'></i></a></li>";         
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
            pagingStr += "<li class='page-item active'>"
                  +"<a class='page-link'>"+intTemp+"</a></li>";
         }
         else {
            pagingStr += "<li class='page-item'>"
               + "<a class='page-link' href='"+page
               +"nowPage="+intTemp+"'>"+intTemp+"</a></li>";
         }
         intTemp++;
         blockCount++;
      }
      
      //5.다음페이지블럭 & 마지막페이지 바로가기
      if(intTemp <= totalPage) {
         pagingStr += "<li class='page-item'>"
            + "<a class='page-link' href='"+page+"nowPage="+intTemp+"'>"
            + "<i class='bi bi-skip-end-fill'></i></a></li>";
         
         pagingStr += "<li class='page-item'>"
            + "<a class='page-link' href='"+page+"nowPage="+totalPage+"'>"
            + "<i class='bi bi-skip-forward-fill'></i></a></li>";
      }      
            
      return pagingStr;
   }
}