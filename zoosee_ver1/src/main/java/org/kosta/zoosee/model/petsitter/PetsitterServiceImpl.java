package org.kosta.zoosee.model.petsitter;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.qnaboard.PagingBean;
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
		//petsitter테이블에 insert
		petsitterDAO.registerPetsitter(petsitterVO);
	}
	
	@Override
	public ListVO petsitterList(String value,String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		int totalContents=petsitterDAO.petsitterListCount(value);
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("value", value);
		map.put("pageNo", pageNo);
		List<PetsitterVO> list=petsitterDAO.petsitterList(map);
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo)); 
		return new ListVO(list, pagingBean);
	}

	@Override
	public void recognitionPetsitter(int petsitterNo, String id) {
		String rank = memberDAO.findRank(id);
		if(rank.equals("normal")){
			//멤버의 rank가 normal 이면 petsitter로 update
			petsitterDAO.updateRank(id);
		}
			//멤버의 rank가 petmom이면 petmaster로 update
		if(rank.equals("petmom")){
			memberDAO.registerPetMaster(id);
		}
		
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
