package org.kosta.zoosee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.vo.FileVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetsitterController {
	
	@Resource
	private PetsitterService petsitterService;
	
	@Resource(name="petsitterUploadPath")
	private String uploadPath;
	
	@RequestMapping("petsitter_registerPetsitter.do")
	   public ModelAndView registerPetsitter(HttpServletRequest request,
	         PetsitterVO petsitterVO,FileVO fileVO){
	      List<MultipartFile>list = fileVO.getFile();
	      ArrayList<String> nameList=new ArrayList<String>();
	      for(int i=0; i<list.size(); i++){
	         String fileName=list.get(i).getOriginalFilename();
	         String fileType=list.get(i).getName();
	         String filePath=uploadPath+fileName;
	         if(!fileName.equals("")){
	            try {
	               list.get(i).transferTo(new File(filePath));
	               nameList.add(fileName);
	            } catch (IllegalStateException | IOException e) {
	               e.printStackTrace();
	            }
	         }
	         //house_img
	         if(fileType.equals("file[0]")){
	            filePath = filePath.substring(filePath.indexOf("upload\\"));
	            petsitterVO.setHouseImg(filePath);
	         }
	         //petsitter_img
	         if(fileType.equals("file[1]")){
	            filePath = filePath.substring(filePath.indexOf("upload\\"));
	            petsitterVO.setPetsitterImg(filePath);
	         }
	      }
	      MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
	      petsitterVO.setMemberVO(mvo);
	      petsitterService.registerPetsitter(petsitterVO);
	      return new ModelAndView("redirect:home.do");
	   }

	
	//펫시터 리스트를 보여준다.
		@RequestMapping("petsitter_petsitterList.do")
		public ModelAndView petsitterList(String value){
			if(value.equals("recog")){//value -> recog 이면 펫시터 리스트 
				return new ModelAndView("petsitter_petsitterlist","list",petsitterService.petsitterList(value));
			}else{//value -> nonrecog 이면 펫시터 대기자 리스트 
				return new ModelAndView("petsitter_petsitterwaitinglist","list",petsitterService.petsitterList(value));
			}
		}
		
		//펫시터 추방
		@RequestMapping("petsitter_deletePetsitter.do")
		@ResponseBody
		public void deletePetsitter(int petsitterNo){
			petsitterService.deletePetsitter(petsitterNo);
		}	
			
		//펫시터 인증
		@RequestMapping(value="petsitter_recognitionPetsitter.do",method=RequestMethod.POST)
		@ResponseBody
		public void recognitionPetsitter(int petsitterNo){
			//System.out.println("petsitterNo:"+petsitterNo);
			petsitterService.recognitionPetsitter(petsitterNo);
		}
		
		//펫시터정보보기
		@RequestMapping("petsitter.getPetsitterVO.do")
		public ModelAndView getPetsitterVO(int petsitterNo , String value){
			PetsitterVO pvo=petsitterService.getPetsitterVO(petsitterNo);
			ModelAndView mv=new ModelAndView("petsitter_petsitterInfo");
			mv.addObject("pvo", pvo);
			mv.addObject("value", value);
			System.out.println(pvo);
			return mv;
		}
		
		//팻시터 정보 수정폼
		@RequestMapping("petsitter_updateform.do")
		public ModelAndView petsitter_updateForm(String id){
			PetsitterVO petsitterVO=petsitterService.findPetsitterById(id);
			return new ModelAndView("petsitter_updateform","petsitterVO",petsitterVO);
		}
		
		//팻시터 정보 수정
		@RequestMapping("petsitter_update.do")
		public ModelAndView petsitter_update(PetsitterVO	petsitterVO,FileVO fileVO){
			  List<MultipartFile>list = fileVO.getFile();
		      ArrayList<String> nameList=new ArrayList<String>();
		      for(int i=0; i<list.size(); i++){
		         String fileName=list.get(i).getOriginalFilename();
		         String fileType=list.get(i).getName();
		         String filePath=uploadPath+fileName;
		         if(!fileName.equals("")){
		            try {
		               list.get(i).transferTo(new File(filePath));
		               nameList.add(fileName);
		            } catch (IllegalStateException | IOException e) {
		               e.printStackTrace();
		            }
		         }
		         //house_img
		         if(fileType.equals("file[0]")){
		            filePath = filePath.substring(filePath.indexOf("upload\\"));
		            petsitterVO.setHouseImg(filePath);
		         }
		         //petsitter_img
		         if(fileType.equals("file[1]")){
		            filePath = filePath.substring(filePath.indexOf("upload\\"));
		            petsitterVO.setPetsitterImg(filePath);
		         }
		      }
		    petsitterService.update(petsitterVO);
			return new ModelAndView("redirect:home.do");
		}
		
	

}
