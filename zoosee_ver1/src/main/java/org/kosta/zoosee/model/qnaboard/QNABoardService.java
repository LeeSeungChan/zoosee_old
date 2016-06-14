package org.kosta.zoosee.model.qnaboard;

import java.util.List;

import org.kosta.zoosee.model.vo.QNABoardVO;

public interface QNABoardService {

	String registerQNA(QNABoardVO qnaboardVO);

	List<QNABoardVO> getQNAList(String id);

	QNABoardVO getContent(int boardNo);

	String updateQNA(QNABoardVO qnaboardVO);

	void deleteQNA(int boardNo);

}
