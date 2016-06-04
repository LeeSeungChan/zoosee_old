package org.kosta.zoosee.model.member;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberSerivce {
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public void registerMember(MemberVO mvo){
		// 메서드를 이용해서 등급 체크 및 업데이트
		mvo.setRank("일반");
		
		memberDAO.registerMember(mvo);
	}
}