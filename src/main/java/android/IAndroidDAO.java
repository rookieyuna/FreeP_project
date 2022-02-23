package android;

import java.util.ArrayList;

import member.MemberVO;

public interface IAndroidDAO {

	public ArrayList<MemberVO> memberList();
	
	public MemberVO memberLogin(MemberVO memberVO);
}

