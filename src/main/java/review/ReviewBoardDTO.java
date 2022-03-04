package review;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewBoardDTO {
	private int rv_idx;
	private int m_code;
	private String title;
	private String contents;
	
	@JsonFormat(pattern="yyyy--MM-dd")
	private java.sql.Date postdate;
	private int hits;
	private String writer;
	private String rv_ofile1;
	private String rv_sfile1;
	private String rv_ofile2;
	private String rv_sfile2;
	private String rv_ofile3;
	private String rv_sfile3;
	private int or_idx;
	private int rv_best;
	
	private boolean like;
	private int likeCount;
}
