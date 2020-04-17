package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Penalty;
import model.Auction;
import model.Member;
import mybatis.AbstractRepository;

@Component
public class MybatisPenaltyDao {

	private final String namespace = "mybatis.Penalty";

	@Autowired
	public AbstractRepository dbPro;

	public void insertPenalty(Penalty penalty) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertPenalty", penalty);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public int penaltyCount(String id) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".penaltyCount", id);
		} finally {
			sqlSession.close();
		}
	}

	public Penalty getRecentPenalty(String id) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getRecentPenalty", id);
		} finally {
			sqlSession.close();
		}
	}

	public int getMyPenaltyCount(String id) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMyPenaltyCount", id);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Penalty> getMyPenaltyList(int startRow, int endRow, String id) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();	
	        startRow = startRow - 1;
	        endRow = endRow - startRow;
	        Map map = new HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("id", id);
		try {
			return sqlSession.selectList(namespace + ".getMyPenaltyList", map);
		} finally {
			sqlSession.close();
		}
	}

}
