package com.mycompany.project1;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.project1.bean.ReservationBean;
import com.mycompany.project1.service.ReservationService;

@Controller
public class ReservationController {

	@Inject
	ReservationService service;
	
	// 예약화면
	@RequestMapping("/reservation")
	public String reservation() {
		
		return "reservation";
	}
	
	// 날짜 형식 변경
	@RequestMapping("/date") 
	public @ResponseBody String formatDate(String year,String month,String day) {
		
		String date = year + "-" + month + "-" + day; // year-month-day로 합쳐진 형태로 저장시키기 위함
		
		return date;
	}
	
	// 예약저장
	@RequestMapping("/res_submit")
	public void insertReservation(ReservationBean reservation,HttpServletResponse response) throws Exception {
		service.reservation_insert(reservation);
		
	}
	
	// 예약 현황 보기
	@RequestMapping("/schedule_show")
	public String selectReservation(String room1, String room2, Model model) throws Exception {
		
		List rlist = (List) service.reservation_select(room1,room2);
		model.addAttribute("rlist", rlist);
		model.addAttribute("room1", room1);
		model.addAttribute("room2",room2);
		
		return "reservation";
	}
	
	
	
}
