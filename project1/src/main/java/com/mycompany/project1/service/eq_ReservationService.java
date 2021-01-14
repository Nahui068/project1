package com.mycompany.project1.service;

import java.util.List;

import com.mycompany.project1.bean.eq_ReservationBean;

public interface eq_ReservationService{

	// 장비 예약 조회
	public List<eq_ReservationBean> selectEqReservation(String eq1, String eq2) throws Exception;
	
	// 장비 예약
	public void insertEqReservation(eq_ReservationBean eqReservation) throws Exception;
	
}
