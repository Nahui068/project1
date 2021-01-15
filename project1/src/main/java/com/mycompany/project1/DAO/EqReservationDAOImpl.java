package com.mycompany.project1.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.project1.bean.EqReservationBean;

@Repository
public class EqReservationDAOImpl implements EqReservationDAO{

	@Inject
	private SqlSessionTemplate sqlSession = null;
	
	// 장비 예약 현황 보기
	@Override
	public List<EqReservationBean> selectEqReservation(String eq1, String eq2) {
		HashMap<String, String> emap = new HashMap<String, String>();
		
		emap.put("eq1", eq1);
		emap.put("eq2", eq2);
		
		return sqlSession.selectList("eq_reservation.eqSelect",emap);
		
	}

	// 장비 예약
	@Override
	public void insertEqReservation(EqReservationBean eq_Reservation) throws Exception {
		sqlSession.insert("eq_reservation.eqInsert",eq_Reservation);
		
	}

	// 장비 예약 수정
	@Override
	public void updateEqReservation(EqReservationBean eq_Reservation) throws Exception {
		sqlSession.update("eq_reservation.eqUpdate",eq_Reservation);
		
	}

	// 장비 예약 삭제
	@Override
	public void deleteEqReservation(EqReservationBean eq_Reservation) throws Exception {
		sqlSession.delete("eq_reservation.eqDelete",eq_Reservation);
		
	}

	// 장비 이미지 가져오기
	@Override
	public String selectImage(String eq2) throws Exception {
		
		return sqlSession.selectOne("eq_reservation.imageSelect", eq2);
	}

	

}
