package org.kosta.zoosee.model.message;

import org.kosta.zoosee.model.vo.MessageVO;

public interface MessageService {

	public abstract int countMessage(String id);


	public abstract Object getMessageList(String pageNo, String id);


	public abstract MessageVO getMessageByNo(String message_no);


	public abstract void updateCheckedAll(String id);

}