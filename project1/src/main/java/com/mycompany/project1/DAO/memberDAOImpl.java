package com.mycompany.project1.DAO;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;

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

	// 데이터베이스 - 회원정보 가져오기
	@Override
	public MemberBean member_info(MemberBean member) throws Exception {
		
		return sqlSession.selectOne("member.memberInfo",member);
		
	}

	// 데이터베이스 - 회원정보 수정하기
	@Override
	public void member_update(MemberBean member) throws Exception {
		
		sqlSession.update("member.memberUpdate", member);
		
	}

	// 데이터베이스 - 회원 list
	@Override
	public List member_list(Pagination pagination) throws Exception {
		
		return sqlSession.selectList("member.memberList",pagination);
		
	}

	// 데이터베이스 - 회원 수
	@Override
	public int memberCount() throws Exception {
		return sqlSession.selectOne("member.memberCount");
	}
	
	// 아이디 중복체크
	@Override
	public int idChk(MemberBean member) throws Exception {
		return sqlSession.selectOne("member.idCheck",member);
	}
	

}

