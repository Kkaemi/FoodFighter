package community.dao;

import java.util.List;

import community.bean.CommunityRankResDTO;

public interface CommunityRankDAO {

	public List<CommunityRankResDTO> getRankResList();

	public List<CommunityRankResDTO> getRankResRevList(List<String> list);

}
