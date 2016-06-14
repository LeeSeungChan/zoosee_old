package org.kosta.zoosee.model.freeboard;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.FreeBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<FreeBoardVO> getFreeBoardList(int pageNo) {
		return template.selectList("board.getFreeBoardList",pageNo);
	}

	@Override
	public FreeBoardVO getFreeBoardContent(int freeBoardNo) {
		return template.selectOne("board.getFreeBoardContent",freeBoardNo);
	}

	@Override
	public void updateCount(int freeBoardNo) {
		template.update("board.updateCount",freeBoardNo);
	}

	@Override
	public void FreeBoardContentDelete(int freeBoardNo) {
		template.update("board.FreeBoardContentDelete",freeBoardNo);
		
	}

	@Override
	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO) {
		template.insert("board.FreeBoardWriteContent",freeBoardVO);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO) {
		template.update("board.updateFreeBoard",freeBoardVO);
	}
	
	@Override
	public int totalContents() {
		return template.selectOne("board.totalContents");
	}
	
	
}
