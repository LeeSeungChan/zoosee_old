package org.kosta.zoosee.model.freeboard;

import java.util.List;

import org.kosta.zoosee.model.vo.FreeBoardVO;

public interface FreeBoardDAO {

	public List<FreeBoardVO> getFreeBoardList(int pageNo);

	public FreeBoardVO getFreeBoardContent(int freeBoardNo);

	public void updateCount(int freeBoardNo);

	public void FreeBoardContentDelete(int freeBoardNo);

	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO);

	public void updateFreeBoard(FreeBoardVO freeBoardVO);

	public int totalContents();

	

}
