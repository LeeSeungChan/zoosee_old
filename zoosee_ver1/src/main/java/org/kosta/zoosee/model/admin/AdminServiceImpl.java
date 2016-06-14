package org.kosta.zoosee.model.admin;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.qnaboard.QNABoardDAO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private QNABoardDAO qnaBoardDAO;

	@Override
	public List<QNABoardVO> getQuestionList() {
		return qnaBoardDAO.getQuestionList();
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
	public List<QNABoardVO> nonAnswerList() {
		return qnaBoardDAO.nonAnswerList();
	}

	@Override
	public List<QNABoardVO> findByIdQNA(String id) {
		return qnaBoardDAO.findByIdQNA(id);
	}
	
}
