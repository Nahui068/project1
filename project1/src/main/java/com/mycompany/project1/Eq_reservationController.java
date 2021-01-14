package com.mycompany.project1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project1.bean.eq_ReservationBean;
import com.mycompany.project1.service.eq_ReservationService;

@Controller
public class Eq_reservationController {

	@Inject
	eq_ReservationService service;
	
	// 장비 예약 화면
	@RequestMapping("/eq_reservation")
	public String eq_reservation() {
		
		return "eq_reservation";
	}
	
	// 장비 예약 현황 보기
	@RequestMapping("/eq_show")
	public String selectEqReservation(String eq1, String eq2, Model model) throws Exception{
		
		
		List rlist = (List)service.selectEqReservation(eq1, eq2);
		model.addAttribute("rlist",rlist);
		model.addAttribute("eq1",eq1);
		model.addAttribute("eq2",eq2);
		
		return "eq_reservation";
		
	}
	
	// 장비 예약
	@RequestMapping("/eq_schedule")
	public void insertEqReservation(eq_ReservationBean eqReservation) throws Exception{
		System.out.println(eqReservation.getId());
		System.out.println(eqReservation.getEq1());
		service.insertEqReservation(eqReservation);
		
	}
	
	
	
}
