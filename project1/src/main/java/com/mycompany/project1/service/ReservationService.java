package com.mycompany.project1.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.project1.bean.ReservationBean;

public interface ReservationService {

	// 예약
	public void reservation_insert(ReservationBean reservation) throws Exception;
	
	// 예약 내용 가져오기
	public List reservation_select(String r1, String r2) throws Exception;
	
	// 예약 내용 삭제하기
	public void reservation_delete(ReservationBean reservation,HttpServletResponse response) throws Exception;
	
	// 예약 수정하기
	public void reservation_update(ReservationBean reservation, HttpServletResponse response) throws Exception;
	
	
}
