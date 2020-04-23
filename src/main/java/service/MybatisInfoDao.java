package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Info;
import mybatis.AbstractRepository;

@Component
public class MybatisInfoDao {
	
	private final String namespace = "mybatis.Info";
	
	@Autowired
	public AbstractRepository dbPro;
	
	 public void insertInfo(Info info){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try
	        {
	            sqlSession.insert(namespace + ".insertInfo",info);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }
	 public int allfemale(){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try
	        {
	        	return sqlSession.selectOne(namespace + ".allfemale");
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }
	 public int allmale(){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try
	        {
	        	return sqlSession.selectOne(namespace + ".allmale");
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }

}
