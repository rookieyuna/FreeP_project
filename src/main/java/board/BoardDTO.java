package board;

import lombok.Data;

@Data
public class BoardDTO {
	private int b_idx;
	private int m_code;
	private int b_cate;
	private String title;
	private String contents;
	private java.sql.Date postdate;
	private int hits;
	private String writer;
	private String ofile;
	private String sfile;
	private int q_category;
	
	
}
