package org.kosta.zoosee.model.message;

import java.util.List;

import org.kosta.zoosee.model.vo.MessageVO;

public interface MessageDAO {

	public abstract int countMessage(String id);

	public abstract List<MessageVO> getMessageList(String pageNo,String id);

	public abstract int getTotalMessage();

	public abstract MessageVO getMessageByNo(String message_no);

	public abstract void updateChecked(MessageVO message);

	public abstract void updateCheckedAll(String id);

}