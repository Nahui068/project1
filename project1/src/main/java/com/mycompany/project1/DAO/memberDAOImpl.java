package com.mycompany.project1.DAO;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.project1.bean.MemberBean;

@Repository
public class memberDAOImpl implements memberDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession = null;
	
	// 데이터베이스 - 회원정보 찾기
	@Override
	public int member_select(MemberBean member) throws Exception {
		
		int result = sqlSession.selectOne("member.memberSelect", member);
		return result;
	}
	
	// 데이터베이스 - 회원 등록
	@Override
	public void member_insert(MemberBean member) throws Exception{
		sqlSession.insert("member.memberInsert",member);
	}





	
}

