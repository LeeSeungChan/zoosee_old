package org.kosta.zoosee.model.pet;

import javax.annotation.Resource;

import org.kosta.zoosee.model.pet.PetDAO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Service;

@Service				
public class PetServiceImpl implements PetService {
	@Resource
	private PetDAO petDAO;
	
	@Override
	public void registerPet(PetVO pvo){
		petDAO.registerPet(pvo);
	}
}
