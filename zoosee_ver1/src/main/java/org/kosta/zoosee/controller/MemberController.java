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
		System.out.println("registerMember 메서드 실행!!");
		HttpSession session = request.getSession();
		
		memberService.registerMember(mvo);
		
		if(session != null){
			session.setAttribute("mvo", mvo);
			System.out.println(mvo.toString());
		}
		
		return "home";
	}
}
