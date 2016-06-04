package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetController {
	@Resource
	private PetService petService;
	@RequestMapping("registerPet.do")
	public ModelAndView write(@RequestParam("petImg")MultipartFile img, PetVO vo,HttpSession session, HttpServletRequest request) {
		if(session==null||session.getAttribute("mvo")==null){
			return new ModelAndView("redirect:index.jsp");
		}
		String petName = request.getParameter("petName");
		int petAge = Integer.parseInt(request.getParameter("petAge"));
		String petType = request.getParameter("petType");
		String petGender = request.getParameter("petGender");
		String petNeutral = request.getParameter("petNeutral");
		MultipartFile petImg = img;
		String petSize = request.getParameter("petSize");
		String clob = request.getParameter("clob");
		PetVO pvo=new PetVO();
		pvo.setPetName(petName);
		pvo.setPetAge(petAge);
		pvo.setPetType(petType);
		pvo.setPetGender(petGender);
		pvo.setPetNeutral(petNeutral);
		pvo.setPetImg(petImg);
		pvo.setPetSize(petSize);
		pvo.setClob(clob);
		pvo.setMemberVO((MemberVO)session.getAttribute("mvo"));	
		petService.registerPet(pvo);
		return new ModelAndView("redirect:index.jsp");
	}
}
