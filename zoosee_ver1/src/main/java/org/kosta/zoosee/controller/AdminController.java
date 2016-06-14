package org.kosta.zoosee.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.admin.AdminService;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	/* 관리자 페이지 - 회원이 등록한 모든 Q&A게시물 보기 */
	@RequestMapping("admin_qna_list.do")
	public ModelAndView getQuestionList(String when){
		List<QNABoardVO> list=new ArrayList<QNABoardVO>();
		if(when.equals("all")){
			list=adminService.getQuestionList();//모든 회원 qna 리스트
		}else if(when.equals("nonAnswer")){
			list=adminService.nonAnswerList();//답변이 없는 qna 리스트
		}
		return new ModelAndView("admin_qna_list","list",list);
	}
	/* 관리자 페이지 -  회원이 등록한 해당 Q&A게시물 상세보기*/
	@RequestMapping("admin_showQuestion.do")
	public ModelAndView showQuestion(int boardNo){
		return new ModelAndView("admin_showQuestion","qnaBoardVO",adminService.showQuestion(boardNo));
	}
	/* 관리자 페이지 -	답변등록하기 */
	@RequestMapping("admin_update_answer.do")
	public ModelAndView updateAnswer(QNABoardVO qnaBoardVO){
		adminService.updateAnswer(qnaBoardVO);
		return new ModelAndView("redirect:admin_showQuestion.do?boardNo="+qnaBoardVO.getBoardNo());
	}
	/*관리자 페이지 - 아이디로 Q&A 검색하기*/
	@RequestMapping("admin_qna_find_view.do")
	public ModelAndView findByIdQNA(String id){
		List<QNABoardVO> list=adminService.findByIdQNA(id);
		return new ModelAndView("admin_qna_find_view","list",list);
	}
}
