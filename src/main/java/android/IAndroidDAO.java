package android;

import java.util.ArrayList;

import member.MemberVO;
import orderlist.OrderlistVO;
import util.ParameterDTO;

public interface IAndroidDAO {

	public ArrayList<MemberVO> memberList();
	
	public MemberVO memberLogin(MemberVO memberVO);
	
	public ArrayList<OrderlistVO> orderList(String m_code);
	
	public ArrayList<OrderlistVO> orderStatus();
}

