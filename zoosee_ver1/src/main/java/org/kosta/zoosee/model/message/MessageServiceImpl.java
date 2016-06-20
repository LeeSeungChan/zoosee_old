package org.kosta.zoosee.model.message;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.MessageVO;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Resource
	private MessageDAO messageDAO;
	
	@Override
	public int countMessage(String id){
		return messageDAO.countMessage(id);
	}

	@Override
	public ListVO getMessageList(String pageNo,String id) {
		if(pageNo==null||pageNo==""){
			pageNo="1";
		}
		List<MessageVO> list = messageDAO.getMessageList(pageNo,id);
		PagingBean pagingBean = new PagingBean(messageDAO.getTotalMessage(),Integer.parseInt(pageNo));
		ListVO listVO = new ListVO(list,pagingBean);
		return listVO;
	}

	@Override
	public MessageVO getMessageByNo(String message_no) {
		//메세지를 읽을때 checked값을 1로 변경해준다.
		MessageVO message = new MessageVO();
		message.setMessage_no(Integer.parseInt(message_no));
		message.setChecked(1);
		messageDAO.updateChecked(message);
		return messageDAO.getMessageByNo(message_no);
	}

	@Override
	public void updateCheckedAll(String id) {
		messageDAO.updateCheckedAll(id);
	}

}
