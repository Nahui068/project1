package com.mycompany.project1.DAO;

import java.util.List;

import com.mycompany.project1.bean.ReservationBean;


public interface ReservationDAO {

	// 예약하기
	public void insertReservation(ReservationBean reservation);
	
	// 예약 존재 여부 확인 
	public int confirmReservation(String room1, String room2, String res_date, String start_time);
	
	//예약 내용 가져오기
	public List<ReservationBean> selectReservation(String room1, String room2);

	// 예약 내용 삭제하기
	public void deleteReservation(ReservationBean reservation);
	
	// 예약 내용 가져오기
	public ReservationBean contentReservation(ReservationBean reservation);
	
	// 예약 내용 수정하기
	public void updateReservation(ReservationBean reservation);
	
}
