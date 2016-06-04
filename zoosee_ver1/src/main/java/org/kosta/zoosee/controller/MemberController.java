package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.member.MemberSerivce;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Resource
	private MemberSerivce memberService;
	
	@RequestMapping(value="registerMember.do", method=RequestMethod.POST)
	public String registerMember(MemberVO mvo){
	/* Member 회원가입하는 메서드
	 */
		memberService.registerMember(mvo);

		return "home";
	}
	
	@RequestMapping(value="loginMember.do", method=RequestMethod.POST)
	public String loginMember(MemberVO mvo, HttpServletRequest request){
		System.out.println(mvo.toString());
		MemberVO vo = memberService.loginMember(mvo);
		HttpSession session = request.getSession();
		
		if(vo != null){
			session.setAttribute("mvo", vo);
		}
		return "home";
	}
	@RequestMapping(value="memberIdCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int memberIdCheck(String id){
		return memberService.memberIdCheck(id);
	}
}
