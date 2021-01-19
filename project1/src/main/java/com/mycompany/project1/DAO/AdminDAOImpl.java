package com.mycompany.project1.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSessionTemplate sqlSession = null;
	
	// 데이터베이스 - 게시글 삽입
	@Override
	public void board_insert(BoardBean board) throws Exception {
		sqlSession.insert("board.boardInsert",board);
		
	}
		
	// 데이터베이스 - 게시글 출력(관리자)
	@Override
	public List board_select(Pagination pagination) throws Exception {

		return sqlSession.selectList("board.boardSelect",pagination);
	}

	// 데이터베이스 - 게시글 수 확인(관리자)
	@Override
	public int board_count() throws Exception {
		
		return sqlSession.selectOne("board.boardCount");
	}
	
	// 데이터베이스 - 내용 출력
	@Override
	public BoardBean board_content(int num) throws Exception {
		

			
		return (BoardBean)sqlSession.selectOne("board.boardContent",num);
	}

	// 게시글 수정
	@Override
	public void board_update(BoardBean board) throws Exception {
		
		sqlSession.selectOne("board.boardUpdate",board);
	}

	// 게시글 삭제
	@Override
	public void board_delete(int num) throws Exception {
		sqlSession.selectOne("board.boardDelete",num);
	}

	// 회원 삭제
	@Override
	public void member_delete(MemberBean member) throws Exception {
		sqlSession.delete("member.memberDelete",member);
		
	}


}
