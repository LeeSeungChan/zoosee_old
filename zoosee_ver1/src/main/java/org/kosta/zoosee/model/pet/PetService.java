package org.kosta.zoosee.model.pet;

import org.kosta.zoosee.model.vo.PetVO;

public interface PetService {

	public abstract void registerPet(PetVO pvo);

	public abstract PetVO petDetail(int petNo);

}