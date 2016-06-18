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
	public void registerPetsitter(PetsitterVO petsitterVO) {
		String id = petsitterVO.getMemberVO().getId();
		int i = petsitterDAO.registerPetsitter(petsitterVO);
		if (i == 1) {//petsitter신청이 완료되었을때
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			String rank = memberDAO.findRank(id);
			String inputRank = "rank";
			if (rank.equals("nomal")) {
				inputRank = "pre_petsitter";
			} else if (rank.equals("petmom")) {
				inputRank = "pre_petmaster";
			}
			map.put("rank", inputRank);
			memberDAO.upgradeRank(map);
		}
	}

	@Override
	public ListVO petsitterList(String value, String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		int totalContents = petsitterDAO.petsitterListCount(value);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("value", value);
		map.put("pageNo", pageNo);
		List<PetsitterVO> list = petsitterDAO.petsitterList(map);
		PagingBean pagingBean = new PagingBean(totalContents,
				Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public void recognitionPetsitter(int petsitterNo, String id) {
		int i=petsitterDAO.recognitionPetsitter(petsitterNo);
		String rank = memberDAO.findRank(id);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		String inputRank = "rank";
		if (rank.equals("pre_petsitter")) {// 멤버의 rank가 prepetsitter 이면 petsitter로 update
			inputRank="petsitter";
		}else if (rank.equals("pre_petmaster")) {// 멤버의 rank가 petmom이면 petmaster로 update
			inputRank="petmaster";
		}
		map.put("rank", inputRank);
		memberDAO.upgradeRank(map);
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
	public PetsitterVO findPetsitterById(String id) {
		return petsitterDAO.findPetsitterById(id);
	}

	@Override
	public void update(PetsitterVO petsitterVO) {
		petsitterVO.setAdminRecog("nonrecog");
		petsitterDAO.update(petsitterVO);
	}

}
