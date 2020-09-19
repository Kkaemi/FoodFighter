package community.dao;

import java.util.List;

import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;

public interface CommunityRankDAO {

	public List<CommunityRankResDTO> getRankResList();

	public List<CommunityRankMemDTO> getRankMemList();

}
