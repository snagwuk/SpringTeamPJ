package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Category;

import mybatis.AbstractRepository;

@Component
public class MybatisCategoryDao {
	private final String namespace = "mybatis.Category";

	@Autowired
	public AbstractRepository dbPro;
	
	 public List<Category> selectsecond(Category c) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectList(namespace + ".selectsecond",c);
			} finally {
				sqlSession.close();
			}
		}
	   
	 public List<Category> selectfirst() {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectList(namespace + ".selectfirst");
			} finally {
				sqlSession.close();
			}
		}
}
