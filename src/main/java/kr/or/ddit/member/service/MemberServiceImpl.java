package kr.or.ddit.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService {

	@Inject
	private IMemberDAO memberDao;
	
	public int signup(MemberVO memberVO) {
		return memberDao.signup(memberVO);
	}

	@Override
	public MemberVO signin(MemberVO memberVO) {
		return memberDao.signin(memberVO);
	}



}
