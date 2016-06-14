package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.qnaboard.QNABoardService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QNABoardController {
	@Resource
	private QNABoardService qnaBoardService;
	@RequestMapping("registerQNA.do")
	public ModelAndView registerQNA(HttpServletRequest request,QNABoardVO qnaboardVO ){
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		MemberVO memberVO=new MemberVO();
		memberVO.setId(id);
		qnaboardVO.setMemberVO(memberVO);
		String result=qnaBoardService.registerQNA(qnaboardVO);
		return new ModelAndView("qna_register_result","result",result);
	}
	@RequestMapping("qna_list.do")
	public ModelAndView getQNAList(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		List<QNABoardVO> list=qnaBoardService.getQNAList(id);
		return new ModelAndView("qna_list","list",list);
	}
	@RequestMapping("qna_content.do")
	public ModelAndView getContents(int boardNo){
		QNABoardVO qnaboardVO=qnaBoardService.getContent(boardNo);
		return new ModelAndView("qna_content_view","qnaBoardVO",qnaboardVO);
	}
	@RequestMapping("qna_update.do")
	public ModelAndView getContent(int boardNo){
		QNABoardVO qnaboardVO=qnaBoardService.getContent(boardNo);
		return new ModelAndView("qna_update","qnaBoardVO",qnaboardVO);
	}
	@RequestMapping("qna_update_result.do")
	public ModelAndView updateQNA(QNABoardVO qnaboardVO){
		String result=qnaBoardService.updateQNA(qnaboardVO);
		return new ModelAndView("qna_update_result","result",result);
	}
	@RequestMapping("qna_delete.do")
	public ModelAndView deleteQNA(int boardNo){
		qnaBoardService.deleteQNA(boardNo);
		return new ModelAndView("redirect:qna_list.do");
	}
}
