package com.mycompany.project1.DAO;

import java.util.List;

import com.mycompany.project1.bean.eq_ReservationBean;

public interface eq_ReservationDAO {

	// 장비 예약 현황보기
	public List<eq_ReservationBean> selectEqReservation(String eq1, String eq2);
	
	// 장비 예약
	public void insertEqReservation(eq_ReservationBean eq_Reservation) throws Exception;
	
	
}
