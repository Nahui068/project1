package com.mycompany.project1.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.mycompany.project1.DAO.AdminDAO;
import com.mycompany.project1.DAO.BoardDAO;
import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.Pagination;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO ad;
	
	// 게시판 등록
	@Override
	public void board_insert(BoardBean board, HttpServletResponse response) throws Exception {
			
		ad.board_insert(board);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('등록되었습니다.')");
		out.println("window.location='/project1/admin_board'");
		out.println("</script>");
	}
		
	// 게시글 출력
	@Override
	public List<BoardBean> board_select(Pagination pagination) throws Exception {
			
		List board_list = ad.board_select(pagination); // 게시글 list 가져오기

		return board_list;
			
	}
	// 총 게시글 개수 확인
	@Override
	public int board_count() throws Exception {
			
		return ad.board_count();
	}

	// 내용 출력
	@Override
	public BoardBean board_content(int num, String title) throws Exception {
		
		BoardBean board_content = (BoardBean) ad.board_content(num,title);
		
		return board_content;
	}
	
	// 내용 수정 
	@Override
	public void board_update(BoardBean board,HttpServletResponse response) throws Exception {
		
		ad.board_update(board);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('게시글이 수정되었습니다.')");
		out.println("window.location='admin_board'");
		out.println("</script>");
		
	}
	
	// 게시글 삭제
	@Override
	public void board_delete(int num, String title, HttpServletResponse response) throws Exception {
		
		ad.board_delete(num, title);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('게시글이 삭제되었습니다.')");
		out.println("window.location='admin_board'");
		out.println("</script>");
		
	}



}
