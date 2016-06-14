package org.kosta.zoosee.model.admin;

import java.util.List;

import org.kosta.zoosee.model.vo.QNABoardVO;

public interface AdminService {

	List<QNABoardVO> getQuestionList();

	QNABoardVO showQuestion(int boardNo);

	void updateAnswer(QNABoardVO qnaBoardVO);

	List<QNABoardVO> nonAnswerList();

	List<QNABoardVO> findByIdQNA(String id);

}
