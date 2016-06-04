package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.member.MemberSerivce;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberSerivce memberService;
	
	@RequestMapping("registerMember.do")
	public String registerMember(MemberVO mvo, HttpServletRequest request){
	/* [ 회원가입 메서드 ]
 	 * session 체크 부분은 추후 interceptor로 바꾼다. */
		HttpSession session = request.getSession();
		memberService.registerMember(mvo); // mvo를 DB에 저장 // 위치 확인
		
		if(session != null){
			session.setAttribute("mvo", mvo);
		}
		
		return "home";
	}
	
	@RequestMapping("loginMember.do")
	public String loginMember(String id, String password){
		
		//memberService.loginMember()
		
		return "home";
	}
	
}
