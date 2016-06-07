package org.kosta.zoosee.model.petsitter;

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

}
