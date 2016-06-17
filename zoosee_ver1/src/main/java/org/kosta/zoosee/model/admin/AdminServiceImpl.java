package org.kosta.zoosee.model.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.qnaboard.QNABoardDAO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private QNABoardDAO qnaBoardDAO;

	@Override
	public ListVO getQuestionList(String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		List<QNABoardVO> list=qnaBoardDAO.getQuestionList(Integer.parseInt(pageNo));
		int totalContents=qnaBoardDAO.getAllQuestionCount();
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public QNABoardVO showQuestion(int boardNo) {
		return qnaBoardDAO.getContent(boardNo);
	}

	@Override
	public void updateAnswer(QNABoardVO qnaBoardVO) {
		qnaBoardDAO.updateAnswer(qnaBoardVO);
	}

	@Override
	public ListVO nonAnswerList(String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		List<QNABoardVO> list=qnaBoardDAO.nonAnswerList(Integer.parseInt(pageNo));
		int totalContents=qnaBoardDAO.getnonAnswerQuestionCount();
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public ListVO findByIdQnaList(String id,String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("pageNo", pageNo);
		List<QNABoardVO> list=qnaBoardDAO.findByIdQnaList(map);
		int totalContents=qnaBoardDAO.getTotalQnaCountById(id);
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}
	
}
