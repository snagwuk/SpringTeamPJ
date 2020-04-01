package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Member;
import mybatis.AbstractRepository;

@Component
public class MybatisMemberDao {

	private final String namespace = "mybatis.Member";

	@Autowired
	public AbstractRepository dbPro;

	public void insertmember(Member member) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertMember", member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public Member authenticate(String id) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".authenticate", id);
		} finally {
			sqlSession.close();
		}
	}

	public Member getMemberinfo(String id) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMemberinfo", id);
		} finally {
			sqlSession.close();
		}
	}

}