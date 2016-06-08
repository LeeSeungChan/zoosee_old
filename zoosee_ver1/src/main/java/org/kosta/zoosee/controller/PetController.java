package org.kosta.zoosee.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
		
		if(session==null||session.getAttribute("mvo")==null){
			return new ModelAndView("redirect:home.do");
		}
		pvo.setMemberVO((MemberVO)session.getAttribute("mvo"));
		
		String path = petUploadPath+petImg2.getOriginalFilename();
		if(petImg2.isEmpty()==false){	
			//System.out.println(petImg);
			//System.out.println(petImg.isEmpty());//�뾽濡쒕뱶�븷 �뙆�씪�씠 �엳�뒗吏� �솗�씤
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
		System.out.println("등록"+path);
		return new ModelAndView("redirect:pet_detail.do?petNo="+pvo.getPetNo());
	}
	@RequestMapping("pet_detail.do")
		public ModelAndView petDetail(int petNo){
			PetVO pvo=petService.petDetail(petNo);
			return new ModelAndView("pet_detail","pvo",pvo);
	}
	@RequestMapping("pet_list.do")
	public ModelAndView petList(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		List<PetVO> list=petService.petList(id);
		return new ModelAndView("pet_list","list",list);
	}
	@RequestMapping("pet_update.do")
	public ModelAndView petUpdate(int petNo){
		return new ModelAndView("pet_update","pvo",petService.petDetail(petNo));
	}
	@RequestMapping(value="pet_update_result.do", method=RequestMethod.POST)
	public String petUpadteResult(HttpServletRequest request,PetVO vo, MultipartFile petImg3){
		HttpSession session = request.getSession(false);
		System.out.println(vo);
		if (session != null && session.getAttribute("mvo")!=null) {
			String path = petUploadPath+petImg3.getOriginalFilename();
			System.out.println(path);
			if(petImg3.isEmpty()==false){	
				//System.out.println(petImg);
				//System.out.println(petImg.isEmpty());//�뾽濡쒕뱶�븷 �뙆�씪�씠 �엳�뒗吏� �솗�씤
				File uploadFile=new File(path);
				path = path.substring(path.indexOf("upload\\"));
				vo.setPetImg(path);
				petService.petUpdateResult(vo);
				System.out.println("수정"+path);
				try {
					petImg3.transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}else{
				petService.updatePetNoImg(vo);
			}
			System.out.println(vo);
			return "redirect:pet_detail.do?petNo="+vo.getPetNo();
		}else{
			return "redirect:home.do";
		}
	}
}
