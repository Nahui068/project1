package com.mycompany.project1.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.Pagination;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSessionTemplate sqlSession = null;
	

	// 데이터베이스 - 게시글 출력
	@Override
	public List board_select(Pagination pagination) throws Exception {

		return sqlSession.selectList("board.boardSelect",pagination);
	}

	// 데이터베이스 - 게시글 수 확인
	@Override
	public int board_count() throws Exception {
		
		return sqlSession.selectOne("board.boardCount");
	}
	
	// 데이터베이스 - 내용 출력
	@Override
	public BoardBean board_content(int num) throws Exception {

		return (BoardBean)sqlSession.selectOne("board.boardContent",num);
	}

	// 조회수 증가
	@Override
	public int upReadcount(int num) throws Exception {
		
		return  sqlSession.update("board.upReadcount",num);
	}



	
}
