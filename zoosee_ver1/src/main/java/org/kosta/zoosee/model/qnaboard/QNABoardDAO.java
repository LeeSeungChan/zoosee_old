package org.kosta.zoosee.model.qnaboard;

import java.util.List;

import org.kosta.zoosee.model.vo.QNABoardVO;

public interface QNABoardDAO {

	int registerQNA(QNABoardVO qnaboardVO);

	List<QNABoardVO> getQNAList(String id);

	QNABoardVO getContent(int boardNo);

	int updateQNA(QNABoardVO qnaboardVO);

	void deleteQNA(int boardNo);

	List<QNABoardVO> getQuestionList();

	void updateAnswer(QNABoardVO qnaBoardVO);

	List<QNABoardVO> nonAnswerList();

	List<QNABoardVO> findByIdQNA(String id);

}
