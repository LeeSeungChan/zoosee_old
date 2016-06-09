package org.kosta.zoosee.model.pet;

import java.util.List;

import javax.annotation.Resource;

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

	@Override
	public PetVO petDetail(int petNo) {
		return petDAO.petDetail(petNo);
	}

	@Override
	public List<PetVO> petList(String id) {
		return petDAO.petList(id);
	}

	@Override
	public void petUpdateResult(PetVO vo) {
		System.out.println("서비스임플");
		petDAO.petUpdateResult(vo);
	}

	@Override
	public void updatePetNoImg(PetVO pvo) {
		petDAO.updatePetNoImg(pvo);
	}
	
	@Override
	public void deletePet(int petNo) {
		petDAO.deletePet(petNo);
	}
}
