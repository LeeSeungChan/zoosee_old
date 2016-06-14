package org.kosta.zoosee.model.qnaboard;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.QNABoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class QNABoardDAOImpl implements QNABoardDAO {
	@Resource
	private SqlSessionTemplate template;
	@Override
	public int registerQNA(QNABoardVO qnaboardVO) {
		return template.insert("qna.registerQuestion",qnaboardVO);
	}
	@Override
	public List<QNABoardVO> getQNAList(String id) {
		return template.selectList("qna.getQNAList",id);
	}
	@Override
	public QNABoardVO getContent(int boardNo) {
		return template.selectOne("qna.getContent",boardNo);
	}
	@Override
	public int updateQNA(QNABoardVO qnaboardVO) {
		return template.update("qna.updateQNA",qnaboardVO);
	}
	@Override
	public void deleteQNA(int boardNo) {
		template.delete("qna.deleteQNA",boardNo);
	}
	@Override
	public List<QNABoardVO> getQuestionList() {
		return template.selectList("qna.getQuestionList");
	}
	@Override
	public void updateAnswer(QNABoardVO qnaBoardVO) {
		template.update("qna.updateAnswer",qnaBoardVO);
	}
	@Override
	public List<QNABoardVO> nonAnswerList() {
		return template.selectList("qna.nonAnswerList");
	}
	@Override
	public List<QNABoardVO> findByIdQNA(String id) {
		return template.selectList("qna.findByIdQNA",id);
	}

}
