package com.mycompany.project1.AuthLoginInterceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// session 객체를 가져옴
        HttpSession session = request.getSession();
        
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        String id = (String)session.getAttribute("id");
          
        if (id == null || id.equals("")){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
        	 response.setContentType("text/html; charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.print("<script>alert('로그인 후 이용해주세요'); window.location='/project1/login_form'</script>");
             //response.sendRedirect("/project1/login_form");
             out.flush(); 

            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
          
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
	}


}
