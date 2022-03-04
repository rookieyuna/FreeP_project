package board;

public class ParameterDTO {
   
   private int cate;
   private String searchField;
   private String searchTxt;
   private int start;
   private int end;
   
   
   public int getCate() {
      return cate;
   }
   public void setCate(int cate) {
      this.cate = cate;
   }
   public String getSearchField() {
      return searchField;
   }
   public void setSearchField(String searchField) {
      this.searchField = searchField;
   }
   public String getSearchTxt() {
      return searchTxt;
   }
   public void setSearchTxt(String searchTxt) {
      this.searchTxt = searchTxt;
   }
   public int getStart() {
      return start;
   }
   public void setStart(int start) {
      this.start = start;
   }
   public int getEnd() {
      return end;
   }
   public void setEnd(int end) {
      this.end = end;
   }
   
}