package com.mycompany.project1.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mycompany.project1.DAO.BoardDAO;
import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.Pagination;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO bd;
	

	// 게시글 출력
	@Override
	public List<BoardBean> board_select(Pagination pagination) throws Exception {
		
		List board_list = bd.board_select(pagination); // 게시글 list 가져오기

		return board_list;
		
	}
	// 총 게시글 개수 확인
	@Override
	public int board_count() throws Exception {
		
		return bd.board_count();
	}

	// 내용 출력
	@Override
	public BoardBean board_content(int num, String title) throws Exception {
		
		BoardBean board_content = (BoardBean) bd.board_content(num,title);
		
		return board_content;
	}

	// 조회수 증가
	@Override
	public void upReadcount(int num) throws Exception {
		bd.upReadcount(num);
	}

	

	
}
