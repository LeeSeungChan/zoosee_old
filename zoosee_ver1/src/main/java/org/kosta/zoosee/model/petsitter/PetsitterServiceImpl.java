package org.kosta.zoosee.model.petsitter;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Service;

@Service
public class PetsitterServiceImpl implements PetsitterService {
	
	@Resource
	private PetsitterDAO petsitterDAO;
	
	@Override
	public void registerPetsitter(PetsitterVO petsitterVO){
		petsitterDAO.registerPetsitter(petsitterVO);
	}

}
