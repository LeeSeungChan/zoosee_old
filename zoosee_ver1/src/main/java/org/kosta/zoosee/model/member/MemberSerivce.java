package org.kosta.zoosee.model.member;

import java.util.List;

import org.kosta.zoosee.model.vo.MemberVO;

public interface MemberSerivce {

	public abstract void registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

	public abstract int memberIdCheck(String id);

	public abstract String updateMember(MemberVO vo);

	public abstract List<MemberVO> memberList(String rank);

	public abstract MemberVO getMemberVO(String id);

	public abstract String deleteMember(String id);

}