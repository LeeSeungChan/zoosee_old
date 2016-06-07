package org.kosta.zoosee.model.pet;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository		
public class PetDAOImpl implements PetDAO {
	@Resource
	private SqlSessionTemplate template;	
	
	@Override
	public void registerPet(PetVO pvo) {
		template.insert("pet.registerPet",pvo);			
	}

	@Override
	public PetVO petDetail(int petNo) {
		return template.selectOne("pet.detail",petNo);
	}
}
