package kr.or.ddit.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Repository
public class BoardDAOImpl implements IBoardDAO{

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return sqlSession.selectOne("board.selectBoardCount",pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return sqlSession.selectList("board.selectBoardList",pagingVO);
	}

	@Override
	public BoardVO selectBoard(int boNo) {
		return sqlSession.selectOne("board.selectBoard", boNo);
	}

	@Override
	public void incrementHit(int boNo) {
		sqlSession.update("board.incrementHit",boNo);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		return sqlSession.insert("board.insertBoard",boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		return sqlSession.update("board.updateBoard",boardVO);
	}

	@Override
	public int deleteBoard(int boNo) {
		return sqlSession.delete("board.deleteBoard",boNo);
	}

}
