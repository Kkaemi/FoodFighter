package community.service;

import java.util.List;

import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;

public interface CommunityRankService {

	public List<CommunityRankResDTO> getRankResList();

	public List<CommunityRankResDTO> getRankResRevList(List<String> list);

	public List<CommunityRankMemDTO> getRankMemList();

}
