package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.freeboard.FreeBoardService;
import org.kosta.zoosee.model.freeboard.ListVO;
import org.kosta.zoosee.model.vo.FreeBoardVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	@Resource
	private FreeBoardService freeBoardService;
	
	//자유게시판 리스트 가져오기
	@RequestMapping("freeBoard_list.do")
	public ModelAndView getFreeBoardList(String pageNo){
		ListVO listVO=freeBoardService.getFreeBoardList(pageNo);
		return new ModelAndView("freeBoard_list","listVO",listVO);
	}
	
	//상세보기 조회수 업데이트
	@RequestMapping("freeBoard_showFreeBoardContent.do")
	public ModelAndView showFreeBoardContent(int freeBoardNo) {		
		freeBoardService.updateCount(freeBoardNo);	
		return new ModelAndView("redirect:freeBoard_showFreeBoardContentNoHit.do?freeBoardNo="+freeBoardNo);
	}
	
	//노히트 상세보기
	@RequestMapping("freeBoard_showFreeBoardContentNoHit.do")
	public ModelAndView showFreeBoardContentNoHit(int freeBoardNo){
		return new ModelAndView("freeBoard_showcontent","freeBoardVO",freeBoardService.showFreeBoardContentNoHit(freeBoardNo));
	}
	
	//게시물 삭제하기
	@RequestMapping("freeBoard_contentDelete.do")
	public String FreeBoardContentDelete(int freeBoardNo){
		freeBoardService.FreeBoardContentDelete(freeBoardNo);
		return "redirect:freeBoard_list.do";
	}
	
	//글 등록
	@RequestMapping(value="freeBoard_contentWrite.do",method=RequestMethod.POST)
	public ModelAndView FreeBoardWriteContent(HttpServletRequest request, FreeBoardVO freeBoardVO){
		HttpSession session=request.getSession(false);
		if(session!=null){
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			if(mvo!=null){
				freeBoardVO.setMemberVO(mvo);
			}
		}		
		freeBoardService.FreeBoardWriteContent(freeBoardVO);
		return new ModelAndView("redirect:freeBoard_list.do");
	}
	
	//게시물 업데이트
	@RequestMapping("freeBoard_updateFreeBoard.do")
	public ModelAndView updateFreeBoard(FreeBoardVO freeBoardVO) {
		freeBoardService.updateFreeBoard(freeBoardVO);
		return new ModelAndView("freeBoard_showcontent","freeBoardVO",freeBoardService.showFreeBoardContentNoHit(freeBoardVO.getFreeBoardNo()));
	}
	
	//게시물 view
	@RequestMapping("freeBoard_updateView.do")
	public ModelAndView updateView(int freeBoardNo) {
		return new ModelAndView("freeBoard_update","freeBoardVO",freeBoardService.showFreeBoardContentNoHit(freeBoardNo));
	}
	

}
