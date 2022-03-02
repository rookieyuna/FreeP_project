package android;

import java.util.ArrayList;

import member.MemberVO;
import orderlist.OrderlistVO;

public interface IAndroidDAO {

	public ArrayList<MemberVO> memberList();
	
	public MemberVO memberLogin(MemberVO memberVO);
	
	public ArrayList<OrderlistVO> orderStatus();
}

