package com.mycompany.project1;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.Pagination;
import com.mycompany.project1.service.BoardService;

@Controller
public class BoardController {

	@Inject
	BoardService service;

	// 게시글 출력
	@RequestMapping(value="/board_select")
	public String board_select(BoardBean boardDTO, Model model,
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
	
		return "main";
	}
	
	// 내용 출력
	@RequestMapping(value="/content")
	public String content(String title,int num, Model model) throws Exception {
		
		BoardBean board_content = service.board_content(num,title);
		service.upReadcount(num); // 조회 수 증가
		
		model.addAttribute("content", board_content);
		
		return "content";
	}
}
