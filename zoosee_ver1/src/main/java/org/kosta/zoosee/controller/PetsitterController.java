package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetsitterController {
	
	@Resource
	private PetsitterService petsitterService;
	
	@RequestMapping("petsiter_registerPetsitter.do")
	public ModelAndView registerPetsitter(HttpServletRequest request, PetsitterVO petsitterVO){
		//세션에 있는 mvo 정보를 가져옴
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		petsitterVO.setMemberVO(mvo);
		System.out.println(petsitterVO);
		petsitterService.registerPetsitter(petsitterVO);
		return new ModelAndView("redirect:home.do");
	}
	

}
