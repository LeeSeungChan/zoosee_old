package org.kosta.zoosee.model.pet;

import java.util.HashMap;
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
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			String inputRank="rank";
			if(rank.equals("normal")){
				inputRank="petmom";
			}else if(rank.equals("petsitter")){
				inputRank="petmaster";
			}else if(rank.equals("pre_petsitter")){
				inputRank="pre_petmaster";
			}
			map.put("rank", inputRank);
			memberDAO.upgradeRank(map);
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
