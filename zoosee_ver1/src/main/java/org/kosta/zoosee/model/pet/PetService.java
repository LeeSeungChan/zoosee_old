package org.kosta.zoosee.model.pet;

import java.util.List;

import org.kosta.zoosee.model.vo.PetVO;

public interface PetService {

	public abstract void registerPet(PetVO pvo);

	public abstract PetVO petDetail(int petNo);

	public abstract List<PetVO> petList(String id);

	public abstract void petUpdateResult(PetVO vo);


}