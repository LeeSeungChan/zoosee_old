package org.kosta.zoosee.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetController {
	@Resource
	private PetService petService;
	@Resource(name="petUploadPath")
	private String petUploadPath;
	
	@RequestMapping(value="registerPet.do", method=RequestMethod.POST)
	public ModelAndView write(PetVO pvo, MultipartFile petImg2, HttpSession session) {
		System.out.println("매핑"+pvo);
		
		if(session==null||session.getAttribute("mvo")==null){
			return new ModelAndView("redirect:home.do");
		}
		pvo.setMemberVO((MemberVO)session.getAttribute("mvo"));
		
		String path = petUploadPath+petImg2.getOriginalFilename();
		if(petImg2.isEmpty()==false){	
			//System.out.println(petImg);
			//System.out.println(petImg.isEmpty());//업로드할 파일이 있는지 확인
			File uploadFile=new File(path);
			try {
				petImg2.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		path = path.substring(path.indexOf("upload\\"));
		pvo.setPetImg(path);
		petService.registerPet(pvo);
		System.out.println("path:"+path);
		System.out.println(pvo.getPetNo());
		return new ModelAndView("redirect:pet_detail.do?petNo="+pvo.getPetNo());
	}
	@RequestMapping("pet_detail.do")
		public ModelAndView petDetail(int petNo){
			PetVO pvo=petService.petDetail(petNo);
			
			return new ModelAndView("pet_detail","pvo",pvo);
	}
	
}
