package community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import community.bean.CommunityNoticeDTO;

@Repository
@Transactional
public class CommunityNoticeDAOMybatis implements CommunityNoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void writeNotice(Map<String, String> map) {
		sqlSession.insert("cNoticeSQL.writeNotice", map);
	}

	@Override
	public List<CommunityNoticeDTO> getCNoticeList(Map<String, Integer> map) {
		return sqlSession.selectList("cNoticeSQL.getCNoticeList", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("cNoticeSQL.getTotalA");
	}

	@Override
	public List<CommunityNoticeDTO> getCNoticeSrch(Map<String, String> map) {
		return sqlSession.selectList("cNoticeSQL.getCNoticeSrch", map);
	}

	@Override
	public int getCNSrchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("cNoticeSQL.getCNSrchTotalA", map);
	}
	
	@Override
	public void hitUpdate(String nseq) {
		sqlSession.update("cNoticeSQL.hitUpdate", Integer.parseInt(nseq));
	}
	
	@Override
	public void deleteNoticeAdmin(List<String> list) {
		for (int i = 0; i < list.size(); i++) {
			String temp = list.get(i);
			sqlSession.update("cNoticeSQL.deleteNoticeAdmin",temp);
		}
	}

	@Override
	public CommunityNoticeDTO viewNotice(String nseq) {
		return sqlSession.selectOne("cNoticeSQL.viewNotice", Integer.parseInt(nseq));
	}

	@Override
	public CommunityNoticeDTO viewPrevNoitce(String nseq) {
		return sqlSession.selectOne("cNoticeSQL.viewPrevNoitce", Integer.parseInt(nseq));
	}

	@Override
	public CommunityNoticeDTO viewNextNoitce(String nseq) {
		return sqlSession.selectOne("cNoticeSQL.viewNextNotice", Integer.parseInt(nseq));
	}
	
	@Override
	public CommunityNoticeDTO viewSrchPrevNoitce(Map<String, String> map) {
		return sqlSession.selectOne("cNoticeSQL.viewSrchPrevNoitce", map);
	}
	
	@Override
	public CommunityNoticeDTO viewSrchNextNotice(Map<String, String> map) {
		return sqlSession.selectOne("cNoticeSQL.viewSrchNextNotice", map);
	}

	@Override
	public void modifyNotice(Map<String, String> map) {
		sqlSession.update("cNoticeSQL.modifyNotice", map);
	}

	@Override
	public void deleteNotice(String nseq) {
		sqlSession.update("cNoticeSQL.deleteNotice", Integer.parseInt(nseq));
	}

}
