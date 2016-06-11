package org.kosta.zoosee.model.petsitter;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Service;

@Service
public class PetsitterServiceImpl implements PetsitterService {
	
	@Resource
	private PetsitterDAO petsitterDAO;
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public void registerPetsitter(PetsitterVO petsitterVO){
		String id = petsitterVO.getMemberVO().getId();
		String rank = memberDAO.findRank(id);
		if(rank.equals("normal")){
			//멤버의 rank가 normal 이면 petsitter로 update
			petsitterDAO.updateRank(id);
		}
			//멤버의 rank가 petmom이면 petmaster로 update
		if(rank.equals("petmom")){
			memberDAO.registerPetMaster(id);
		}
			//petsitter테이블에 insert
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
