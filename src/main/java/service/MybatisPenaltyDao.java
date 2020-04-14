package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Penalty;
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
	
}
