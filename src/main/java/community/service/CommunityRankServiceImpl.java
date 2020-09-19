package community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;
import community.dao.CommunityRankDAO;

@Service
public class CommunityRankServiceImpl implements CommunityRankService {
	@Autowired
	private CommunityRankDAO cRankDAO;

	@Override
	public List<CommunityRankResDTO> getRankResList() {
		return cRankDAO.getRankResList();
	}

	@Override
	public List<CommunityRankMemDTO> getRankMemList() {
		return cRankDAO.getRankMemList();
	}
}
