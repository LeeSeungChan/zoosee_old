package org.kosta.zoosee.model.member;

import org.kosta.zoosee.model.vo.MemberVO;

public interface MemberSerivce {

	public abstract void registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

}