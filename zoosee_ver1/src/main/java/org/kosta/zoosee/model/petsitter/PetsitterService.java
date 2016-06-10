package org.kosta.zoosee.model.petsitter;

import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterVO;

public interface PetsitterService {

		public abstract void registerPetsitter(PetsitterVO petsitterVO);
		
		public abstract List<PetsitterVO> petsitterList(String value);
	
		public abstract void recognitionPetsitter(int petsitterNo);
	
		public abstract PetsitterVO getPetsitterVO(int petsitterNo);
	
		public abstract void deletePetsitter(int petsitterNo);

		public abstract void updateRank(String id);

		public abstract PetsitterVO findPetsitterById(String id);

		public abstract void update(PetsitterVO petsitterVO);

}