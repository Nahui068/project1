package com.mycompany.project1.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.project1.bean.ReservationBean;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Inject
	private SqlSessionTemplate sqlSession = null;
	
	// 예약하기
	@Override
	public void insertReservation(ReservationBean reservation) {
		sqlSession.insert("reservation.reservationInsert", reservation);
		
	}

	// 예약확인
	@Override
	public int confirmReservation(String room1, String room2, String res_date, String start_time) {
		
		HashMap<String, String> cmap = new HashMap<String, String>();
		cmap.put("r1",room1);
		cmap.put("r2", room2);
		cmap.put("res_date", res_date);
		cmap.put("start_time", start_time);
		
		return sqlSession.selectOne("reservation.reservationConfirm",cmap);
	}
	
	// 예약내용 가져오기
	@Override
	public List<ReservationBean> selectReservation(String room1, String room2) {
		 
		HashMap<String, String> rmap = new HashMap<String, String>();
		rmap.put("r1",room1);
		rmap.put("r2", room2);
		
		return sqlSession.selectList("reservation.reservationSelect",rmap);
		 
	}

	// 예약 삭제
	@Override
	public void deleteReservation(ReservationBean reservation) {
		sqlSession.delete("reservation.reservationDelete",reservation);
		
	}

	// 예약 내용 수정하기
	@Override
	public void updateReservation(ReservationBean reservation) {
		sqlSession.update("reservation.reservationUpdate",reservation);
		
	}



	
}
