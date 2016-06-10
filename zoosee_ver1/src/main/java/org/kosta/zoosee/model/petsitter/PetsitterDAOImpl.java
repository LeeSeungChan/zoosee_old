package org.kosta.zoosee.model.petsitter;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PetsitterDAOImpl implements PetsitterDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public void registerPetsitter(PetsitterVO petsitterVO){
		System.out.println(petsitterVO);
		template.insert("petsitter.registerPetsitter",petsitterVO);
	}
	
	@Override
	public List<PetsitterVO> petsitterList(String value) {
		return template.selectList("petsitter.petsitterList",value);
	}

	@Override
	public void recognitionPetsitter(int petsitterNo) {
		template.update("petsitter.recognitionPetsitter",petsitterNo);
		
	}

	@Override
	public PetsitterVO getPetsitterVO(int petsitterNo) {
		return template.selectOne("petsitter.getPetsitterVO",petsitterNo);
	}

	@Override
	public void deletePetsitter(int petsitterNo) {
		template.selectOne("petsitter.deletePetsitter",petsitterNo);
	}

	@Override
	public void updateRank(String id) {
		template.update("petsitter.updateRank", id);
		
	}

	@Override
	public PetsitterVO findPetsitterById(String id) {
		return template.selectOne("petsitter.findPetsitterById",id);
	}

	@Override
	public void update(PetsitterVO petsitterVO) {
		template.update("petsitter.update",petsitterVO);
	}

}
