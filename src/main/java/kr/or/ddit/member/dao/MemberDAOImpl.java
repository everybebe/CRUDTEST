package kr.or.ddit.member.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

@Repository
public class MemberDAOImpl implements IMemberDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int signup(MemberVO memberVO) {
		return sqlSession.insert("member.signup",memberVO);
	}

	@Override
	public MemberVO signin(MemberVO memberVO) {
		return sqlSession.selectOne("member.signin",memberVO);
	}

}
