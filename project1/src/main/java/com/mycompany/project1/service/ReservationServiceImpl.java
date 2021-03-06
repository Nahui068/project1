package com.mycompany.project1.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.mycompany.project1.DAO.ReservationDAO;
import com.mycompany.project1.bean.ReservationBean;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Inject
	private ReservationDAO rd;
	
	//예약
	@Override
	public void reservation_insert(ReservationBean reservation) throws Exception {
		
		int rcount = rd.confirmReservation(reservation.getR1(), reservation.getR2(),
				reservation.getRes_date(), reservation.getStart_time()); // 겹치는 시간 여부
		
		if(rcount == 0)// 시간이 겹치지 않을 경우 예약 완료
			rd.insertReservation(reservation);
		
	}

	// 예약 내용 가져오기
	@Override
	public List reservation_select(String room1, String room2) throws Exception {
		
		return rd.selectReservation(room1,room2);
	}

	// 예약 내용 삭제하기
	@Override
	public void reservation_delete(ReservationBean reservation,HttpServletResponse response) throws Exception {
		
		rd.deleteReservation(reservation);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.')");
		out.println("location.href = document.referrer");
		out.println("</script>");
		
	}

	// 예약 수정하기
	@Override
	public void reservation_update(ReservationBean reservation, HttpServletResponse response) throws Exception {
		
		rd.updateReservation(reservation);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href = document.referrer");
		out.println("</script>");
		
	}

	
	

}
