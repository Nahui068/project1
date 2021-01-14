package com.mycompany.project1.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.project1.DAO.eq_ReservationDAO;
import com.mycompany.project1.bean.eq_ReservationBean;


@Service
public class eq_ReservationServiceImpl implements eq_ReservationService{

	@Inject
	private eq_ReservationDAO rd;

	// 장비 예약 현황 보기
	@Override
	public List<eq_ReservationBean> selectEqReservation(String eq1, String eq2) throws Exception {
		
		return rd.selectEqReservation(eq1, eq2);
	}

	// 장비 예약
	@Override
	public void insertEqReservation(eq_ReservationBean eqReservation) throws Exception {
		
		rd.insertEqReservation(eqReservation);
		
	}
	
	
}
