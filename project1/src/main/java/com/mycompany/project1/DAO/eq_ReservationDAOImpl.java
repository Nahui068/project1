package com.mycompany.project1.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.project1.bean.eq_ReservationBean;

@Repository
public class eq_ReservationDAOImpl implements eq_ReservationDAO{

	@Inject
	private SqlSessionTemplate sqlSession = null;
	
	// 장비 예약 현황 보기
	@Override
	public List<eq_ReservationBean> selectEqReservation(String eq1, String eq2) {
		HashMap<String, String> emap = new HashMap<String, String>();
		
		emap.put("eq1", eq1);
		emap.put("eq2", eq2);
		
		return sqlSession.selectList("eq_reservation.eqSelect",emap);
		
	}

	// 장비 예약
	@Override
	public void insertEqReservation(eq_ReservationBean eq_Reservation) throws Exception {
		sqlSession.insert("eq_reservation.eqInsert",eq_Reservation);
		
	}

	

}
