package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.member.MemberSerivce;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberSerivce memberService;
	
	@RequestMapping(value="registerMember.do", method=RequestMethod.POST)
	public String registerMember(MemberVO mvo){
	/* Member 회원가입하는 메서드
	 */
		memberService.registerMember(mvo);

		return "member_register_result";
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
	@RequestMapping("member_update_result.do")
	public ModelAndView updateMember(MemberVO vo,HttpServletRequest request){
		String message=memberService.updateMember(vo);
		ModelAndView mv=new ModelAndView();
		if(message=="fail"){
			mv.setViewName("member_update_fail");
		}else{
			HttpSession session=request.getSession(false);
			session.setAttribute("mvo", vo);
			mv.setViewName("member_detail");
		}
		return mv;
	}
	
	//멤버 리스트를 보여준다.
	@RequestMapping("member_memberlist.do")
	public ModelAndView memberList(String rank){
		return new ModelAndView("member_memberlist","list",memberService.memberList(rank));
		
	}
	
	//멤버정보보기
	@RequestMapping("member.getMemberVO.do")
	public ModelAndView getMemberVO(String id){
		return new ModelAndView("member_memberInfo","mvo",memberService.getMemberVO(id));
	}
	
}
