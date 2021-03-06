package com.mycompany.project1.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.mycompany.project1.DAO.EqReservationDAO;
import com.mycompany.project1.bean.EqReservationBean;


@Service
public class EqReservationServiceImpl implements EqReservationService{

	@Inject
	private EqReservationDAO rd;

	// 장비 예약 현황 보기
	@Override
	public List<EqReservationBean> selectEqReservation(String eq1, String eq2) throws Exception {
		
		return rd.selectEqReservation(eq1, eq2);
	}

	// 장비 예약
	@Override
	public void insertEqReservation(EqReservationBean eqReservation) throws Exception {
		
		rd.insertEqReservation(eqReservation);
		
	}

	// 장비 예약 수정
	@Override
	public void updateEqReservation(EqReservationBean eqReservation, HttpServletResponse response) throws Exception {
		rd.updateEqReservation(eqReservation);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href = document.referrer");
		out.println("</script>");
		
	}

	//장비 예약 삭제
	@Override
	public void deleteEqReservation(EqReservationBean eqReservation,HttpServletResponse response) throws Exception {
		rd.deleteEqReservation(eqReservation);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.')");
		out.println("location.href = document.referrer");
		out.println("</script>");
		
	}

	// 장비 이미지 가져오기
	@Override
	public String selectImage(String eq2) throws Exception {
		return rd.selectImage(eq2);
		
	}

	// 장비 위치 가져오기
	@Override
	public String eqPlace(String eq2) throws Exception {
		return rd.eqPlace(eq2);
	}
	
	
	
	
	
	
}
