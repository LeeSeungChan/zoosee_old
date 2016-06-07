package org.kosta.zoosee.model.member;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public void registerMember(MemberVO mvo){
		template.insert("member.registerMember", mvo);
	}
	@Override
	public MemberVO loginMember(MemberVO mvo) {
		MemberVO m = template.selectOne("member.loginMember", mvo);
		return m;
	}
	@Override
	public int memberIdCheck(String id) {
		return template.selectOne("member.memberIdCheck",id);
	}
	@Override
	public int updateMember(MemberVO vo) {
		return template.update("member.updateMember",vo);
	}
}
