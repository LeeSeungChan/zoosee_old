package org.kosta.zoosee.model.freeboard;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.FreeBoardVO;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Resource
	private FreeBoardDAO freeBoardDAO;

	@Override
	public ListVO getFreeBoardList(String pageNo) {
		if(pageNo==null||pageNo==""){
			pageNo="1";
		}
		int pNo=Integer.parseInt(pageNo);
		List<FreeBoardVO> list=freeBoardDAO.getFreeBoardList(pNo);
		PagingBean pagingBean=new PagingBean(freeBoardDAO.totalContents(),pNo);
		return new ListVO(list,pagingBean);
	}

	@Override
	public FreeBoardVO showFreeBoardContentNoHit(int freeBoardNo) {
		return freeBoardDAO.getFreeBoardContent(freeBoardNo);
	}
	
	@Override
	public void updateCount(int freeBoardNo) {
		freeBoardDAO.updateCount(freeBoardNo);
	}

	@Override
	public void FreeBoardContentDelete(int freeBoardNo) {
		freeBoardDAO.FreeBoardContentDelete(freeBoardNo);
		
	}

	@Override
	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO) {
		freeBoardDAO.FreeBoardWriteContent(freeBoardVO);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO) {
		freeBoardDAO.updateFreeBoard(freeBoardVO);
	}
}
