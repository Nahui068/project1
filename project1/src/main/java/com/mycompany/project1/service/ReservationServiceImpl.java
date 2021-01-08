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
		
		if(rcount == 0)
			rd.insertReservation(reservation);
		
	}

	// 예약 내용 가져오기
	@Override
	public List reservation_select(String room1, String room2) throws Exception {
		
		return rd.selectReservation(room1,room2);
	}
	
	

}
