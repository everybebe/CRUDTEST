package kr.or.ddit.member.service;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {

	public int signup(MemberVO memberVO);

	public MemberVO signin(MemberVO memberVO);

	
}
