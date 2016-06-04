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
	public void registerPet(PetVO vo) {
		template.insert("pet.registerPet",vo);			
	}
}
