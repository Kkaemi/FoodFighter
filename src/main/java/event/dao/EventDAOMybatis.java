package event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import event.bean.EventDTO;

@Repository
@Transactional
public class EventDAOMybatis implements EventDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void eventWrite(Map<String, String> map) {
		sqlSession.insert("eventSQL.eventdWrite", map);
		
	}

	@Override
	public List<EventDTO> eventBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("eventSQL.eventBoardList",map);
	}

	@Override
	public void hit(String seq_event) {
		sqlSession.update("eventSQL.hit",Integer.parseInt(seq_event));
		
	}

	@Override
	public EventDTO geteventBoardtView(String seq_event) {
		return sqlSession.selectOne("eventSQL.geteventBoardtView",Integer.parseInt(seq_event));
	}

	@Override
	public void eventBoardModify(Map<String, Object> map) {
		sqlSession.update("eventSQL.eventBoardModify", map);
		
	}

	@Override
	public void eventBoardDelete(String seq_event) {
		sqlSession.delete("eventSQL.eventBoardDelete",Integer.parseInt(seq_event));
	}
	@Override
	public int geteventTotalA() {
		return sqlSession.selectOne("eventSQL.geteventTotalA");
	}

	@Override
	public List<EventDTO> getEventSearch(Map<String, String> map) {
		return sqlSession.selectList("eventSQL.getEventSearch",map);
	}

	@Override
	public int geteventSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("eventSQL.geteventSearchTotalA", map);
	}

	@Override
	public void eventBoardListDelete(List<String> list) {
		for (int i = 0; i < list.size(); i++) {
			String temp = list.get(i);
			System.out.println(temp);
			sqlSession.update("eventSQL.eventBoardListDelete",temp);
		}
	}

}
