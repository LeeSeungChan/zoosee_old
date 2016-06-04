package org.kosta.zoosee.model.pet;

import org.kosta.zoosee.model.vo.PetVO;

public interface PetDAO {

	public abstract void registerPet(PetVO vo);

}