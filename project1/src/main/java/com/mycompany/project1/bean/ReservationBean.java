package com.mycompany.project1.bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReservationBean {

	private int num; // 예약 번호
	private String id; // 회원아이디
	private String r1; // 예약구분
	private String r2; // 장소
	private String title; // 예약명
	private String res_date; // 예약일
	private String start_time; //예약 시간(시작)
	private String end_time; // 예약 시간(종료)
	private String color; //색상
	
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR1() {
		return r1;
	}
	public void setR1(String r1) {
		this.r1 = r1;
	}
	public String getR2() {
		return r2;
	}
	public void setR2(String r2) {
		this.r2 = r2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		
		this.end_time = end_time;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	
	
}
