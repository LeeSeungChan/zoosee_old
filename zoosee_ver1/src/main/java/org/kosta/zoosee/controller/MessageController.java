package org.kosta.zoosee.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.message.ListVO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {
	
	@Resource
	private MessageService messageService;
	
	@RequestMapping(value="countMessage.do",method=RequestMethod.POST)
	@ResponseBody
	public Object countMessage(String id){
		//읽지 않은 메세지 개수를 가져온다.
		int result = messageService.countMessage(id);
		//가져온값을 String형으로 바꾼다
		 String count = String.valueOf(result);
		 //새로운 맵 생성
		HashMap<String,String> map = new HashMap<String, String>();
		//맵에 result값을 넣는다
		map.put("count", count);
		
		return map;
	}
	
	@RequestMapping("message_list.do")
	public ModelAndView messageList(String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String id = mvo.getId();
		return new ModelAndView("message_list","list",messageService.getMessageList(pageNo,id));
	}
	
	@RequestMapping("message_uncheckedlist.do")
	public ModelAndView messageUncheckedList(String pageNo,String id,HttpServletRequest request){
		return new ModelAndView("message_uncheckedlist","list",messageService.getMessageList(pageNo, id));
	}
	
	@RequestMapping("message_content.do")
	public ModelAndView showContent(String message_no){
		return new ModelAndView("message_showcontent","message",messageService.getMessageByNo(message_no));
	}
	
	@RequestMapping("message_updateCheckedAll.do")
	public ModelAndView updateCheckedAll(String id){
		messageService.updateCheckedAll(id);
		return new ModelAndView("redirect:message_list.do");
	}
	
	
	
}
