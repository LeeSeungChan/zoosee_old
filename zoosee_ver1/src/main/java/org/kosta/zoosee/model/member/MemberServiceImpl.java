package org.kosta.zoosee.model.member;

import java.util.List;

import javax.annotation.Resource;

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

	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}
	@Override
	public int memberIdCheck(String id) {
		return memberDAO.memberIdCheck(id);
	}
	@Override
	public String updateMember(MemberVO vo) {
		int i=memberDAO.updateMember(vo);
		String message="ok";
		if(i==0){
			message="fail";
		}
		return message;
	}

	@Override
	public List<MemberVO> memberList(String rank) {
		return memberDAO.memberList(rank);
	}

	@Override
	public MemberVO getMemberVO(String id) {
		return memberDAO.getMemberVO(id);
	}

	@Override
	public String deleteMember(String id) {
		int i=memberDAO.deleteMember(id);
		String result="ok";
		if(i==0){
			result="fail";
		}
		return result;
	}
}