package org.kosta.zoosee.model.member;

import org.kosta.zoosee.model.vo.MemberVO;

public interface MemberDAO {

	public abstract void registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

	public abstract int memberIdCheck(String id);

}