package kr.or.ddit.member.dao;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDAO {

	public int signup(MemberVO memberVO);

	public MemberVO signin(MemberVO memberVO);

}
