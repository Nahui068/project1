package com.mycompany.project1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;
import com.mycompany.project1.service.AdminService;

@Controller
public class AdminController {

	@Inject
	AdminService service;
	
	// 게시글 등록 form
	@RequestMapping(value="/board_form")
	public String board_form() {
		return "board_form";
	}
	
	// 게시글 등록
	@RequestMapping(value="/board_insert")
	public void board_insert(BoardBean boardDTO,HttpServletResponse response) throws Exception {
		service.board_insert(boardDTO, response);
	}
	
	// 게시글 출력
	@RequestMapping(value="/admin_board")
	public String adminPage(BoardBean boardDTO, Model model,
			@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		
		// 전체 게시글 수
		int listCnt = service.board_count();
				
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
				
		List board_list = service.board_select(pagination);	
				
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", board_list);
		
		return "admin_board";
	}
	
	// 내용 출력
	@RequestMapping(value="/admin_content")
	public String content(int num, Model model) throws Exception {
			
		BoardBean board_content = service.board_content(num); // 게시글 번호와 제목이 일치하는 게시글 내용 가져오기
			
		model.addAttribute("content", board_content);
			
		return "admin_content";
	}
	
	// 내용 수정Form
	@RequestMapping(value="/admin_board_update")
	public String boardUpdateForm(int num, Model model) throws Exception{
		
		BoardBean board_content = service.board_content(num); // 게시글 가져오기
		
		model.addAttribute("content",board_content);
		
		return "admin_board_update";
		
	}
	
	// 내용 수정
	@RequestMapping(value="/board_update")
	public void boardUpdate(BoardBean board,HttpServletResponse response) throws Exception{
		service.board_update(board,response);
		
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board_delete")
	public void boardDelete(int num,HttpServletResponse response) throws Exception{
		service.board_delete(num,response);
	}
	
	// 회원삭제
	@RequestMapping(value="/member_delete")
	public void memberDelete(MemberBean member,HttpServletResponse response) throws Exception{
		service.member_delete(member, response);
	}
	

}
