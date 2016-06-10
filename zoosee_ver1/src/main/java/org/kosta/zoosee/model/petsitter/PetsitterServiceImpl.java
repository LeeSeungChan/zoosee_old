package org.kosta.zoosee.model.petsitter;

import java.util.List;

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
	
	@Override
	public List<PetsitterVO> petsitterList(String value) {
		return petsitterDAO.petsitterList(value);
	}

	@Override
	public void recognitionPetsitter(int petsitterNo) {
		petsitterDAO.recognitionPetsitter(petsitterNo);
		
	}

	@Override
	public PetsitterVO getPetsitterVO(int petsitterNo) {
		return petsitterDAO.getPetsitterVO(petsitterNo);
	}

	@Override
	public void deletePetsitter(int petsitterNo) {
		 petsitterDAO.deletePetsitter(petsitterNo);
		
	}

	@Override
	public void updateRank(String id) {
		petsitterDAO.updateRank(id);
		
	}

	@Override
	public PetsitterVO findPetsitterById(String id) {
		return petsitterDAO.findPetsitterById(id);
	}

	@Override
	public void update(PetsitterVO petsitterVO) {
		petsitterVO.setAdminRecog("nonrecog");
		petsitterDAO.update(petsitterVO);
	}

}
