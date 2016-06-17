package org.kosta.zoosee.model.petsitter;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterVO;

public interface PetsitterDAO {

	public abstract void registerPetsitter(PetsitterVO petsitterVO);

	public abstract List<PetsitterVO> petsitterList(HashMap<String, String> map);

	public abstract void recognitionPetsitter(int petsitterNo);

	public abstract PetsitterVO getPetsitterVO(int petsitterNo);

	public abstract void deletePetsitter(int petsitterNo);

	public abstract void updateRank(String id);

	public abstract PetsitterVO findPetsitterById(String id);

	public abstract void update(PetsitterVO petsitterVO);

	public abstract int petsitterListCount(String value);
}