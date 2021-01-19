package com.mycompany.project1.DAO;

import java.util.List;

import com.mycompany.project1.bean.EqReservationBean;

public interface EqReservationDAO {

	// 장비 예약 현황보기
	public List<EqReservationBean> selectEqReservation(String eq1, String eq2);
	
	// 장비 예약
	public void insertEqReservation(EqReservationBean eq_Reservation) throws Exception;
	
	// 장비 예약 수정
	public void updateEqReservation(EqReservationBean eq_Reservation) throws Exception;
	
	// 장비 예약 삭제
	public void deleteEqReservation(EqReservationBean eq_Reservation) throws Exception;
	
	// 장비 사진 가져오기
	public String selectImage(String eq2) throws Exception;
	
	// 장비 위치 가져오기
	public String eqPlace(String eq2) throws Exception;
	
}
