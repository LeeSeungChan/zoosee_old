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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetsitterController {
	
	@Resource
	private PetsitterService petsitterService;
	
	@Resource(name="petsitterUploadPath")
	private String uploadPath;
	
	@RequestMapping("petsiter_registerPetsitter.do")
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
					System.out.println(fileName+" 업로드 완료");
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
	

}
