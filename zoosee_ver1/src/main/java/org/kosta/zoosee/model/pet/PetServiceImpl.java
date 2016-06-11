package org.kosta.zoosee.model.pet;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Service;

@Service				
public class PetServiceImpl implements PetService {
	@Resource
	private PetDAO petDAO;
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public void registerPet(PetVO pvo){
		int i=petDAO.registerPet(pvo);
		if(i==1){
			String id=pvo.getMemberVO().getId();
			String rank=memberDAO.findRank(id);
			//System.out.println("등급확인:"+rank);
			if(rank.equals("nomal")){
				//System.out.println("펫맘");
				memberDAO.registerPet(id);
			}else if(rank.equals("petsitter")){
				//System.out.println("마스터");
				memberDAO.registerPetMaster(id);
			}
		}
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
		//System.out.println("서비스임플");
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
