package com.mycompany.project1.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.project1.bean.EqReservationBean;

public interface EqReservationService{

	// 장비 예약 조회
	public List<EqReservationBean> selectEqReservation(String eq1, String eq2) throws Exception;
	
	// 장비 예약
	public void insertEqReservation(EqReservationBean eqReservation) throws Exception;
	
	// 장비 예약 수정
	public void updateEqReservation(EqReservationBean eqReservation,HttpServletResponse response) throws Exception;
	
	// 장비 예약 삭제
	public void deleteEqReservation(EqReservationBean eqReservation, HttpServletResponse response) throws Exception;
	
	// 장비 이미지 가져오기
	public String selectImage(String eq2) throws Exception;
}
