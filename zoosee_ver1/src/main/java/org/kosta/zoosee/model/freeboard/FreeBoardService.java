package org.kosta.zoosee.model.freeboard;

import org.kosta.zoosee.model.vo.FreeBoardVO;

public interface FreeBoardService {

	public ListVO getFreeBoardList(String pageNo);

	public FreeBoardVO showFreeBoardContentNoHit(int freeBoardNo);

	public void updateCount(int freeBoardNo);

	public void FreeBoardContentDelete(int freeBoardNo);

	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO);

	public void updateFreeBoard(FreeBoardVO freeBoardVO);

}
